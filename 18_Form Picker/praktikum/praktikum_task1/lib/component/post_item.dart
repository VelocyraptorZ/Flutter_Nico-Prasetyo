import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum_task1/models/post_model.dart';

// ignore: must_be_immutable
class PostItem extends StatelessWidget {
  final PostModel post;
  final Function() onPressed;
  const PostItem({
    super.key,
    required this.post,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Image.file(
            File(post.cover.path!),
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 145,
                    child: Center(child: Text('Published: ${post.day}')),
                  ),
                  SizedBox(
                      height: 50,
                      width: 65,
                      child: Center(
                        child: Row(
                          children: [
                            const Text('Color: '),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 13, 0, 10),
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: post.theme),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: Text(
            post.caption,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(
                    'Delete Post?',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'NO',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: onPressed,
                      child: Text(
                        'YES',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete_forever_rounded),
          ),
        )
      ],
    );
  }
}
