import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:post/constant/app_constant.dart';
import 'package:post/feature/home/model/post.dart';
import 'package:post/feature/home/service/home_service.dart';

class HomeController extends GetxController {
  Rx<FormzSubmissionStatus> initialStatus = FormzSubmissionStatus.initial.obs;
  RxString errorMessage = ''.obs;
  RxList<Post> postList = RxList();

  Future<void> getPosts() async {
    try {
      initialStatus.value = FormzSubmissionStatus.inProgress;
      var response = await HomeService.getPost();
      if (response != null) {
        for (var singlePost in response) {
          Post post = Post.fromMap(singlePost);
          postList.add(post);
        }
        initialStatus.value = FormzSubmissionStatus.success;
      } else {
        errorMessage.value = AppString.wentWrong;
        initialStatus.value = FormzSubmissionStatus.failure;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      initialStatus.value = FormzSubmissionStatus.failure;
    }
  }
}
