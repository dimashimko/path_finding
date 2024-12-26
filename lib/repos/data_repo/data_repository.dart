import 'package:dio/dio.dart';

import '../../models/common_models/base_response.dart';
import '../../models/task_models/task.dart';
import '../../models/task_models/task_check_result.dart';
import '../../models/task_models/task_result.dart';
import '../../utils/constants.dart';
import 'base_repository.dart';

class DataRepository {
  static final BaseRepository _baseRepository = BaseRepository();
  static final Dio _api = _baseRepository.api;

  Future<BaseResponse<List<TaskCheckResult>>> sendResults({
    required List<TaskResult> resultList,
  }) async {
    List<Map<String, dynamic>> jsonResultList = resultList
        .map(
          (result) => result.toJson(),
        )
        .toList();

    Response response = await _api.post(
      '$kApiUrl/flutter/api',
      data: jsonResultList,
    );

    return BaseResponse.fromJson(
      response.data,
      (json) {
        return List.from(json as List)
            .map<TaskCheckResult>(
              (j) => TaskCheckResult.fromJson(j),
            )
            .toList();
      },
    );
  }

  Future<BaseResponse<List<Task>>> getTasks({
    required String url,
  }) async {
    Response response = await _api.get(
      url,
    );

    return BaseResponse.fromJson(
      response.data,
      (json) {
        return List.from(json as List)
            .map<Task>(
              (j) => Task.fromJson(j),
            )
            .toList();
      },
    );
  }
}
