import 'package:dio/dio.dart';
import 'package:test_task/data/model/image_model/image_model.dart';

import '../model/response_data/response.dart';
import '../model/user_model/userModel.dart';
import 'api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllImage() async {
    MyResponse myResponse= MyResponse(error: "");
    try {
      print("Keldi");
      Response response =
      await dio.get("${dio.options.baseUrl}/photos");
      if (response.statusCode == 200) {
        myResponse.data = response.data.map((e) => ImageModel.fromJson(e)).toList();
        print("Respons zzz");
      }
    } catch (e) {
      myResponse.error = e.toString();
      print(e.toString());
    }
    return myResponse;
  }
  Future<MyResponse> getAllUser() async {
    MyResponse myResponse= MyResponse(error: "");
    try {
      print("Keldi user");
      Response response =
      await dio.get("${dio.options.baseUrl}/users");
      if (response.statusCode == 200) {
        myResponse.data = response.data.map((e) => UserModel.fromJson(e)).toList();
        print("Respons zzz user");
      }
    } catch (e) {
      myResponse.error = e.toString();
      print(e.toString());
    }
    return myResponse;
  }
}