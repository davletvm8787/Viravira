import 'package:assarickym/presentation/characters/view_model/characters_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../app/base/base_view.dart';
import '../../../app/common_view/custom_app_bar.dart';
import '../../../app/common_view/error_widget.dart';
import '../../../app/resource/color_manager.dart';
import '../../../app/resource/font_manager.dart';

class CampaignsDetailPage extends StatelessWidget {
  int campaignId;
  CampaignsDetailPage({super.key, required this.campaignId});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return BaseView<CharactersViewModel>(
      onViewModelReady: (watch, read) {
        read.getCharacterList();
      },
      onPageBuild: (watch, read) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: whiteColor,
          child: Scaffold(
            backgroundColor: context.customColors.backgroundColor8,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
              context,
              appBarTitle: AppStrings.campaignDetail.tr(),
              backOnClick: () {
                Navigator.pop(context);
              },
            ),
            body: _body(watch, read),
          ),
        ),
      ),
    );
  }

  Widget _body(CharactersViewModel watch, CharactersViewModel read) {
    return watch.getCharacterList.getScreenWidget(
      errorWidget: (failure) => ErrorStateWidget(
        errorMessage: failure.serverMessage ?? failure.message.tr(),
        buttonOnClick: () {
          read.setLoadingState();
          read.getCharacterList();
        },
      ),
      okWidget: (data) => _bodyContent(watch, read, data: data),
    );
  }

  SingleChildScrollView _bodyContent(
      CharactersViewModel watch, CharactersViewModel read,
      {required Characters data}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: AppSize.s15,
          ),
          // İmage
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppMargin.m16,
            ),
            child: _image(data.images?[0].url ?? Constant.defaultImage),
          ),
          const SizedBox(
            height: AppSize.s30,
          ),
          // Content
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppMargin.m32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dateTimeText(
                    "${AppStrings.lastDay.tr()} ${DateTimeExtension.apiStringToDateTime(data.endDate!).toDateString}"),
                const SizedBox(
                  height: AppSize.s6,
                ),
                _titleText(data.title ?? ""),
                const SizedBox(
                  height: AppSize.s10,
                ),
                _contentText(data.content ?? ""),
              ],
            ),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          // Conditions
          if (conditionsShowing)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.customColors.backgroundColor3,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(AppSize.s25),
                  topLeft: Radius.circular(AppSize.s25),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: AppSize.s19,
                    ),
                    _conditionsTitle(conditionsTitle),
                    const SizedBox(
                      height: AppSize.s10,
                    ),
                    _conditionsContent(conditionsContent),
                    const SizedBox(
                      height: AppSize.s150,
                    )
                  ],
                ),
              ),
            )
          else
            const SizedBox(height: AppSize.s130)
        ],
      ),
    );
  }

  Widget _conditionsContent(String content) => Text(
        content,
        style: TextStyle(
          color: blackColor,
          fontSize: FontSize.s15,
          fontFamily: FontConstants.fontFamilyInter,
        ),
      );

  Widget _conditionsTitle(String title) => GradientText(
        title,
        style: const TextStyle(
          fontSize: FontSize.s20,
          fontFamily: FontConstants.fontFamilyInter,
          fontWeight: FontWeight.bold,
        ),
        colors: context.customColors.gradientColorList2,
      );

  Widget _contentText(String content) => Text(
        content,
        style: TextStyle(
            color: context.customColors.textColor1,
            fontSize: FontSize.s15,
            fontFamily: FontConstants.fontFamilyInter),
      );

  Widget _titleText(String title) => Text(
        title,
        style: TextStyle(
          color: context.customColors.textColor1,
          fontSize: FontSize.s20,
          fontFamily: FontConstants.fontFamilyInter,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _dateTimeText(String dateTimeS) => Text(
        dateTimeS,
        style: TextStyle(
          color: colorB3B3,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyInter,
          fontWeight: FontWeightManager.medium,
        ),
      );

  Widget _image(String imageUrl) => ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s12),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: AppSize.s170,
              color: Colors.grey[300]!,
            ),
          ),
          errorWidget: (context, url, error) => const SizedBox(
            height: AppSize.s170,
            child: Icon(
              Icons.error,
              size: AppSize.s50,
              color: Colors.red,
            ),
          ),
          imageBuilder: (context, imageProvider) => Image(
            image: imageProvider,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      );
}
