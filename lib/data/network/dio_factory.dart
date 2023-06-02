import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/utils/constant.dart';

@LazySingleton(order: DiOrder.dioFactory)
class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    final Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: Constant.baseURL,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}
