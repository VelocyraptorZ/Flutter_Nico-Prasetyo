import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post_manager.dart';
import 'empty_post_screen.dart';
import 'post_item_screen.dart';
import 'post_list_screen.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Post'),
        centerTitle: true,
      ),
      body: buildPostScreen(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<PostManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostItemScreen(
                onCreate: (post) {
                  manager.addPost(post);
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildPostScreen() {
    return Consumer<PostManager>(
      builder: (context, manager, child) {
        if (manager.postModels.isNotEmpty) {
          return PostListScreen(
            manager: manager,
          );
        } else {
          return const EmptyPostScreen();
        }
      },
    );
  }
}
