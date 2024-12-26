import 'package:dio/dio.dart';

import '../generated/l10n.dart';
import '../models/common_models/base_response.dart';

extension DioExceptionX on DioException {
  String get text {
    try {
      switch (type) {
        case DioExceptionType.badResponse:
          if (response != null && response!.statusCode! < 500) {
            final BaseResponse baseResponse = BaseResponse.fromJson(
              response!.data,
              (json) => json,
            );

            if (baseResponse.data is Map) {
              final Map<String, dynamic> data = baseResponse.data;
              final MapEntry<String, dynamic> entry = data.entries.first;

              if (entry.value is List) {
                return '${entry.value.first}';
              } else {
                return '${entry.value}';
              }
            }

            if (baseResponse.data is List) {
              final List<String> data = baseResponse.data;
              return data.first;
            }

            if (baseResponse.data is String) {
              final String data = baseResponse.data;
              return data;
            }

            return baseResponse.message;
          } else {
            return '$message';
          }
        default:
          return S.current.unknownError;
      }
    } catch (_) {
      return S.current.unknownError;
    }
  }
}
