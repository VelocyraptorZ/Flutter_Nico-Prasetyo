import 'package:flutter/material.dart';

import 'post_model.dart';

class PostManager extends ChangeNotifier {
  final _postModels = <PostModel>[];
  // ignore: recursive_getters
  List<PostModel> get postModels => List.unmodifiable(_postModels);

  void deletePost(int index) {
    _postModels.removeAt(index);
    notifyListeners();
  }

  void addPost(PostModel post) {
    _postModels.add(post);
    notifyListeners();
  }
}
