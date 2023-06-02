import 'package:assarickym/app/common_view/custom_app_bar.dart';
import 'package:assarickym/app/resource/string_manager.dart';
import 'package:assarickym/app/resource/theme_manager.dart';
import 'package:flutter/material.dart';

class LocationWebPage extends StatefulWidget {
  const LocationWebPage({super.key});

  @override
  _LocationWebPageState createState() => _LocationWebPageState();
}

class _LocationWebPageState extends State<LocationWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customColors.whiteCColor,
      body: _body(context),
      appBar: CustomAppBar(context, appBarTitle: AppStrings.success,
          backOnClick: () {
        Navigator.pop(context);
      }),
    );
  }

  Widget _body(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(45),
      ),
      child: Column(),
    );
  }
}
