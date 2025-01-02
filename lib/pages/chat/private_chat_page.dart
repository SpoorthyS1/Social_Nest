import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class PrivateChatPage extends StatefulWidget {
  final String otherUserId;
  final String otherUsername;

  const PrivateChatPage({
    Key? key,
    required this.otherUserId,
    required this.otherUsername,
  }) : super(key: key);

  @override
  _PrivateChatPageState createState() => _PrivateChatPageState();
}

class _PrivateChatPageState extends State<PrivateChatPage> {
  final TextEditingController messageController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final encrypt.Key encryptionKey =
      encrypt.Key.fromLength(32); // Replace with a secure key.
  final encrypt.IV iv = encrypt.IV.fromLength(16); // Replace with a secure IV.

  String _encryptMessage(String message) {
    final encrypter = encrypt.Encrypter(encrypt.AES(encryptionKey));
    return encrypter.encrypt(message, iv: iv).base64;
  }

  String _decryptMessage(String encryptedMessage) {
    final encrypter = encrypt.Encrypter(encrypt.AES(encryptionKey));
    return encrypter.decrypt64(encryptedMessage, iv: iv);
  }

  Future<void> _sendMessage() async {
    final user = auth.currentUser;
    if (user == null || messageController.text.trim().isEmpty) return;

    final encryptedMessage = _encryptMessage(messageController.text.trim());
    final chatId = _getChatId(user.uid, widget.otherUserId);

    await firestore
        .collection('privateChats')
        .doc(chatId)
        .collection('messages')
        .add({
      'text': encryptedMessage,
      'sentBy': user.uid,
      'timestamp': Timestamp.now(),
    });

    messageController.clear();
  }

  String _getChatId(String user1, String user2) {
    return user1.compareTo(user2) < 0 ? '$user1-$user2' : '$user2-$user1';
  }

  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    if (user == null)
      return Scaffold(body: Center(child: Text("User not logged in.")));

    final chatId = _getChatId(user.uid, widget.otherUserId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with ${widget.otherUsername}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: firestore
                  .collection('privateChats')
                  .doc(chatId)
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
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMine = message['sentBy'] == user.uid;

                    String decryptedMessage = "";
                    try {
                      decryptedMessage = _decryptMessage(message['text']);
                    } catch (e) {
                      decryptedMessage = "Decryption failed.";
                    }

                    return Align(
                      alignment:
                          isMine ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 8.0,
                        ),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: isMine
                              ? Colors.blueAccent.withOpacity(0.8)
                              : Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          decryptedMessage,
                          style: TextStyle(color: Colors.white),
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
                  onPressed: _sendMessage,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
