import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:social_nest/pages/chat/private_chat_page.dart';

class GroupChatPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String communityId;

  GroupChatPage({
    required this.groupId,
    required this.groupName,
    required this.communityId,
  });

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController messageController = TextEditingController();

  void _sendMessage() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("You must be logged in to send messages.")),
      );
      return;
    }

    final text = messageController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Message cannot be empty.")),
      );
      return;
    }

    try {
      // Fetch user data from the `users` collection
      final userDoc = await firestore.collection('users').doc(user.uid).get();
      if (!userDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to fetch user data.")),
        );
        return;
      }

      // Fallback for missing username field
      final username = userDoc.data()?['username'] ?? "Unknown User";

      // Add message to Firestore
      await firestore
          .collection('communities')
          .doc(widget.communityId)
          .collection('groups')
          .doc(widget.groupId)
          .collection('messages')
          .add({
        'text': text,
        'sentBy': user.uid,
        'username': username,
        'timestamp': Timestamp.now(),
      });

      messageController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send message: $e")),
      );
      print("Error sending message: $e");
    }
  }

  void _handleLongPress(BuildContext context, String userId, String username) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null || currentUser.uid == userId) return;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.chat),
                title: Text("Start Private Chat"),
                onTap: () async {
                  Navigator.pop(context);

                  // Send private chat request
                  final requestDoc = await firestore
                      .collection('users')
                      .doc(userId)
                      .collection('privateChatRequests')
                      .add({
                    'requestedBy': currentUser.uid,
                    'requestedAt': Timestamp.now(),
                    'username': currentUser.displayName ?? 'Unknown',
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Private chat request sent to $username."),
                    ),
                  );

                  // Listen for acceptance of the request
                  requestDoc.snapshots().listen((docSnapshot) async {
                    if (docSnapshot.exists &&
                        docSnapshot.data()!['accepted'] == true) {
                      // Navigate to the private chat page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivateChatPage(
                            otherUserId: userId,
                            otherUsername: username,
                          ),
                        ),
                      );

                      await requestDoc.delete();
                    }
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.block),
                title: Text("Block User"),
                onTap: () async {
                  Navigator.pop(context);
                  await firestore
                      .collection('users')
                      .doc(currentUser.uid)
                      .collection('blockedUsers')
                      .doc(userId)
                      .set({
                    'blockedAt': Timestamp.now(),
                    'username': username,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$username has been blocked.")),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groupName),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: firestore
                  .collection('communities')
                  .doc(widget.communityId)
                  .collection('groups')
                  .doc(widget.groupId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No messages yet."));
                }

                final messages = snapshot.data!.docs;
                final currentUser = FirebaseAuth.instance.currentUser?.uid;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMine = message['sentBy'] == currentUser;

                    return GestureDetector(
                      onLongPress: () => _handleLongPress(
                        context,
                        message['sentBy'],
                        message['username'],
                      ),
                      child: Align(
                        alignment: isMine
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 8.0,
                          ),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: isMine
                                ? theme.colorScheme.primary.withOpacity(0.8)
                                : theme.colorScheme.secondary.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                              bottomLeft:
                                  isMine ? Radius.circular(12.0) : Radius.zero,
                              bottomRight:
                                  isMine ? Radius.zero : Radius.circular(12.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: isMine
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                message['username'],
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                message['text'],
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Enter a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send),
                  color: theme.colorScheme.primary,
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
