import 'package:dio/dio.dart';

class API {
  Dio dio = Dio();
  API() {
    dio.options.baseUrl = "https://countries.trevorblades.com/";
  }
}
