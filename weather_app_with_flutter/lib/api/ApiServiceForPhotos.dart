/*

- Dio, Flutter/Dart’ta kullanılan gelişmiş bir HTTP (API) istemci paketidir.

- Dio = API’ye istek at, veri al, hataları yönet, interceptor kullan.

🧠 Dio Ne İçin Kullanılır?

- REST API çağrıları (GET, POST, PUT, DELETE)
- JSON veri alma / gönderme
- Header, token (JWT) yönetimi
- Error handling
- Interceptor (request–response yakalama)
- Dosya upload / download
👉 * http paketine göre çok daha güçlüdür.

*/

import 'package:dio/dio.dart';
import 'package:weather_app_with_flutter/model/PhotosModel.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<MyPhotosModel>> fetchUsers() async {
    try {
      var url = 'https://jsonplaceholder.typicode.com/photos'; // istek atacağımız url..
      final response = await dio.get(url);

      final List list =
          response.data; // response.data → Dio JSON’u otomatik parse eder

      return list.map((e) => MyPhotosModel.fromJson(e)).toList();

    } on DioException catch (e) {
      return Future.error(e);
    }
  }
}
