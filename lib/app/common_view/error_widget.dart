import 'package:flutter/material.dart';

import '../resource/font_manager.dart';
import '../resource/value_manager.dart';

class ErrorStateWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback buttonOnClick;

  const ErrorStateWidget({
    super.key,
    required this.errorMessage,
    required this.buttonOnClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.red,
              size: AppSize.s100,
            ),
          ],
        ),
        const SizedBox(
          height: AppSize.s10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppSize.s12,
          ),
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: FontSize.s18,
              color: Colors.red,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
        ),
        const SizedBox(
          height: AppSize.s18,
        ),
        Row(
          children: [
            const SizedBox(
              width: AppSize.s22,
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                ),
                onPressed: buttonOnClick,
                child: const Text('error'),
              ),
            ),
            const SizedBox(
              width: AppSize.s22,
            ),
          ],
        )
      ],
    );
  }
}
