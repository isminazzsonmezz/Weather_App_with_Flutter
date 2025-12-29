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
import 'package:weather_app_with_flutter/model/WeatherModel.dart';

class ApiServiceWeather {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
      queryParameters: {
        "appid": '21f39ab17c3d8087f9aca769d8abdf28',
        "lang": 'tr',
        "units": 'metric',
      },
    ),
  );

  Future<WeatherApp> fetchUsers(String city) async {
    final response = await dio.get('/weather', queryParameters: {"q": city});
    // debugPrint(response.data.toString());

    var model = WeatherApp.fromJson(response.data);
    // debugPrint(model.main?.temp.toString());

    return model;
  }
}
