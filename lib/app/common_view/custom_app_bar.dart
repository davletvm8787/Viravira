import 'package:assarickym/app/resource/assets_manager.dart';
import 'package:assarickym/app/resource/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends AppBar {
  final String appBarTitle;
  final VoidCallback? backOnClick;
  final BuildContext context;

  CustomAppBar(
    this.context, {
    super.key,
    required this.appBarTitle,
    this.backOnClick,
  });

  @override
  Widget? get leading => SvgPicture.asset(
        SvgAssets.backIcon,
      );

  @override
  Widget? get title => SvgPicture.asset(
        SvgAssets.logoIcon,
      );

  @override
  bool? get centerTitle => true;

  @override
  Color? get backgroundColor => context.customColors.whiteCColor;
}
