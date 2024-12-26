import 'package:dio/dio.dart';

import '../generated/l10n.dart';
import '../models/common_models/base_response.dart';

extension DioExceptionX on DioException {
  String get text {
    try {
      switch (type) {
        case DioExceptionType.badResponse:
          if (response != null) {
            final BaseResponse baseResponse = BaseResponse.fromJson(
              response!.data,
              (json) => json,
            );

            if (baseResponse.error) {
              return baseResponse.message;
            } else {
              return S.current.unknownError;
            }
          } else {
            return '$message';
          }
        default:
          return type.name;
      }
    } catch (_) {
      return S.current.unknownError;
    }
  }
}
