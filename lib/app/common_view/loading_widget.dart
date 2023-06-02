import 'package:assarickym/app/resource/color_manager.dart';
import 'package:flutter/material.dart';

import '../resource/value_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: milkColor,
              strokeWidth: AppSize.s5,
            ),
          ],
        ),
      ],
    );
  }
}
