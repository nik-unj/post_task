import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:post/constant/app_constant.dart';
import 'package:post/constant/app_style.dart';
import 'package:post/feature/home/controller/home_controller.dart';
import 'package:post/feature/home/widget/post_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: AppBar(
        backgroundColor: AppStyle.primary,
        title: Text(
          AppString.post,
          style: AppStyle.headingStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppStyle.smallInsets),
        child: Obx(() {
          if (homeController.initialStatus.value.isInProgress) {
            return onLoadingList();
          } else if (homeController.initialStatus.value.isFailure) {
            return onErrorList();
          } else {
            return onSuccessList();
          }
        }),
      ),
    );
  }

  //Widget when state is loading
  Widget onLoadingList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Skeletonizer(
          child: PostTile(post: AppConstant.dummyPost),
        );
      },
    );
  }

  //Widget when error getting data from network
  Widget onErrorList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            homeController.errorMessage.value,
            style: AppStyle.errorStyle(),
          ),
        ),
        const SizedBox(height: AppStyle.mediumInsets),
        GestureDetector(
          onTap: () {
            homeController.getPosts();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                AppString.retry,
                style: AppStyle.noramlStyle(),
              ),
              const SizedBox(width: AppStyle.smallInsets),
              const Icon(
                Icons.replay_outlined,
                size: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }

  //Widget when data is received from network call
  Widget onSuccessList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            itemCount: homeController.postList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return PostTile(post: homeController.postList[index]);
            },
          ),
          const SizedBox(height: AppStyle.largeInsets),
        ],
      ),
    );
  }
}
