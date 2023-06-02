import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/base/base_view.dart';
import '../../../app/common_view/card_widget.dart';
import '../../../app/common_view/location_appBar.dart';
import '../view_model/location_view_model.dart';

class LocationMobilePage extends StatefulWidget {
  const LocationMobilePage({super.key});

  @override
  State<LocationMobilePage> createState() => _LocationMobilePageState();
}

class _LocationMobilePageState extends State<LocationMobilePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return BaseView<LocationViewModel>(
      onViewModelReady: (watch, read) {
        read.getLocationList();
      },
      onPageBuild: (watch, read) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: LocCustomAppBar(
                context,
                appBarTitle: '',
                backOnClick: () {
                  Navigator.pop(context);
                },
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 95,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        itemCount: read.locationList.data?.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CharactersPage(
                                      //pageIndex: index,
                                      //storyModel: read.storyModel,
                                      ),
                                ),
                              );
                            },
                            child: PointsCardWidget(
                              title: 'asd',
                              typeText: 'Type',
                              dimensionText: 'Dimensoin',
                              residentCountText: 'Resident Count',
                              planetValue: watch.locationList.data![index].name,
                              dimensionValue:
                                  watch.locationList.data![index].dimension,
                              residentValue: watch.locationList.data![index].id,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
