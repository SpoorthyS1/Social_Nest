import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_nest/pages/chat/group_page.dart';

class CommunityPage extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _addCommunity(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController nameController = TextEditingController();
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Community",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Community Name",
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () async {
                        final name = nameController.text.trim();
                        if (name.isNotEmpty) {
                          // Add the community to Firestore
                          await firestore.collection('communities').add({
                            'name': name,
                          });
                        }
                        Navigator.of(context).pop();
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _deleteCommunity(
      BuildContext context, String communityId, String communityName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Community"),
          content: Text(
              "Are you sure you want to delete the community '$communityName'?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await firestore
                      .collection('communities')
                      .doc(communityId)
                      .delete();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Community deleted successfully")),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to delete community: $e")),
                  );
                }
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  void _openGroupsPage(
      BuildContext context, String communityId, String communityName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            GroupsPage(communityId: communityId, communityName: communityName),
      ),
    );
  }

  void _addGroupToCommunity(BuildContext context, String communityId) {
    TextEditingController groupNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Group",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: groupNameController,
                  decoration: InputDecoration(
                    labelText: "Group Name",
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Close dialog without saving
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () async {
                        final groupName = groupNameController.text.trim();
                        if (groupName.isNotEmpty) {
                          // Add the group to Firestore under the selected community
                          await firestore
                              .collection('communities')
                              .doc(communityId)
                              .collection('groups')
                              .add({
                            'name': groupName,
                            'createdBy':
                                'userId', // Placeholder: replace with actual user ID
                            'createdAt': Timestamp.now(),
                          });
                        }
                        Navigator.of(context)
                            .pop(); // Close dialog after saving
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ],
            ),
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
        title: Text("Communities"),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: StreamBuilder(
        stream: firestore.collection('communities').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No communities found."));
          }

          final communities = snapshot.data!.docs;
          return ListView.builder(
            itemCount: communities.length,
            itemBuilder: (context, index) {
              final community = communities[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: theme.cardColor,
                  elevation: 4.0,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    title: Text(
                      community['name'],
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon:
                              Icon(Icons.add, color: theme.colorScheme.primary),
                          onPressed: () =>
                              _addGroupToCommunity(context, community.id),
                          tooltip: "Add Group",
                        ),
                        IconButton(
                          icon: Icon(Icons.delete,
                              color: theme.colorScheme.error),
                          onPressed: () => _deleteCommunity(
                              context, community.id, community['name']),
                          tooltip: "Delete Community",
                        ),
                      ],
                    ),
                    onTap: () => _openGroupsPage(
                        context, community.id, community['name']),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addCommunity(context),
        backgroundColor: theme.colorScheme.primary,
        child: Icon(Icons.add),
        tooltip: "Create Community",
      ),
    );
  }
}
