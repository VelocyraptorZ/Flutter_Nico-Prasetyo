import 'package:flutter/material.dart';
import 'package:praktikum_task1/component/post_item.dart';
import '../models/post_manager.dart';

class PostListScreen extends StatelessWidget {
  final PostManager manager;
  const PostListScreen({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    final postItems = manager.postModels;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: postItems.length,
        itemBuilder: (context, index) {
          final item = postItems[index];
          return PostItem(
            key: Key(item.id),
            post: item,
            onPressed: () {
              manager.deletePost(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.id} Deleted')),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
      ),
    );
  }
}
