import 'package:flutter/material.dart';
import '../resource/value_manager.dart';

class PointsCardWidget extends StatelessWidget {
  const PointsCardWidget({
    super.key,
    required this.title,
    this.borderRadius = 15,
    required this.typeText,
    required this.dimensionText,
    required this.residentCountText,
    required this.planetValue,
    required this.dimensionValue,
    required this.residentValue,
    //required this.onClick,
  });

  final String title;
  final String typeText;
  final String dimensionText;
  final String residentCountText;
  final String planetValue;
  final String? dimensionValue;
  final int residentValue;
  //final VoidCallback onClick;

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          const BoxConstraints(minHeight: AppSize.s130, maxWidth: 320.0),
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s30, vertical: AppSize.s15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   width: AppSize.s15,
              // ),

              // const SizedBox(
              //   width: AppSize.s10,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(typeText),
                  Text(dimensionText),
                  Text(residentCountText),
                ],
              ),

              const SizedBox(
                width: AppSize.s60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(planetValue),
                  Text(dimensionValue!),
                  Text('$residentValue'),
                ],
              ),
            ],
          ),

          // Expanded(
          //   child: Text(
          //     '234',
          //     style: TextStyle(
          //       fontSize: FontSize.s16,
          //       fontWeight: FontWeightManager.regular,
          //       fontFamily: FontConstants.fontFamilyPoppins,
          //       color: blackColor,
          //     ),
          //   ),
          // ),

          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 10.0, bottom: 5),
          //     child: Text(
          //       title,
          //       style: const TextStyle(
          //         fontSize: FontSize.s12,
          //         fontWeight: FontWeightManager.regular,
          //         color: Colors.yellow,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
