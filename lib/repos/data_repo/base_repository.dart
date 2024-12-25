import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseRepository {
  // static const String baseUrlApi = '$endpoint/api/';
  late final Dio api;

  BaseRepository() {
    api = Dio(
        // BaseOptions(
        //   baseUrl: baseUrlApi,
        // ),
        );

    api.interceptors.addAll(
      [
        PrettyDioLogger(
          requestBody: true,
          logPrint: (value) {
            if (kDebugMode) {
              print('$value');
            }
          },
        ),
      ],
    );
  }
}
