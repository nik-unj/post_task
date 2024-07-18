import 'package:flutter/material.dart';
import 'package:post/constant/app_style.dart';
import 'package:post/feature/home/model/post.dart';

class PostTile extends StatelessWidget {
  final Post post;
  const PostTile({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppStyle.largeInsets,
        right: AppStyle.smallInsets,
        left: AppStyle.smallInsets,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppStyle.white,
          boxShadow: const [
            BoxShadow(
              color: AppStyle.grey,
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppStyle.mediumInsets),
          child: Text(
            post.title,
            style: AppStyle.titleStyle(),
          ),
        ),
      ),
    );
  }
}
