import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/core/utils/app_styles.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody(
      {super.key, required this.imageLink, required this.content});
  final String imageLink;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imageLink))),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: AppStyles.style18SemiBold(context,
                      color: AppColors.textColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
