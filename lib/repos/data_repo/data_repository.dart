import 'package:dio/dio.dart';

import '../../models/common_models/base_response.dart';
import '../../models/task_models/task.dart';
import 'base_repository.dart';

class DataRepository {
  static final BaseRepository _baseRepository = BaseRepository();
  static final Dio _api = _baseRepository.api;

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
