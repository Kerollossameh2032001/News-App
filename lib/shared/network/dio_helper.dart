import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
//https://newsdata.io/api/1/news?apikey=YOUR_API_KEY&domain=indiatoday&category=technology
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
