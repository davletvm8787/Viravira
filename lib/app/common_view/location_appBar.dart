import 'package:assarickym/app/resource/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resource/assets_manager.dart';

class LocCustomAppBar extends AppBar {
  final String appBarTitle;
  final VoidCallback? backOnClick;
  final BuildContext context;

  LocCustomAppBar(
    this.context, {
    super.key,
    required this.appBarTitle,
    this.backOnClick,
  });

  @override
  Widget? get title => SvgPicture.asset(
        SvgAssets.logoIcon,
      );

  @override
  double? get toolbarHeight => 90.0;

  @override
  bool? get centerTitle => true;

  @override
  double? get elevation => 0.3;

  @override
  Color? get backgroundColor => context.customColors.whiteCColor;
}
