import 'package:post/feature/home/model/post.dart';

class AppConstant {
  static Post dummyPost = Post(
    userId: 1,
    id: 1,
    title:
        'This is the title of the dummy post.This is used to show the dummy verion of the data.',
    body: 'This is the body of the dummy post.',
  );
}

class AppString {
  static const String wentWrong = 'Something went wrong';
  static const String settingUp = 'Setting things up';
  static const String post = 'Post';
  static const String retry = 'Retry';
}
