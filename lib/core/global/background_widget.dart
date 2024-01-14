import 'package:flutter/material.dart';
import 'package:golden_soft_test/core/app_manager/color_manager/color_manager.dart';
import 'package:golden_soft_test/core/constant/assets.dart';
import 'package:golden_soft_test/core/extention/context_extension.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Assets.backgroundImage),
          SizedBox(
            height: context.height(0.2),
          ),
          Align(
              alignment: Alignment.centerRight,

              child: Image.asset(Assets.backgroundSmallRightImage)),
          SizedBox(
            height: context.height(0.1),
          ),
          Image.asset(Assets.backgroundSmallLeftImage),

          Align(
              alignment: Alignment.bottomRight,
              child: Stack(
                alignment: Alignment.bottomRight,

                children: [
                  Image.asset(Assets.backgroundImageRightIn, width: context.width(0.35),),

                  Image.asset(Assets.backgroundImageRight),
                ],
              )),


        ],
      ),
    );
  }
}
