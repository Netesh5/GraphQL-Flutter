import 'package:dio/dio.dart';
import 'package:graphqldemo/feature/homepage/data/data_providers/api.dart';
import 'package:graphqldemo/feature/homepage/data/model/geo_model.dart';

class GeoRepo {
  API api = API();

  Future<List<GeoModel>> fetchData() async {
    try {
      Response response = await api.dio.get(api.dio.options.baseUrl);
      List<dynamic> result = response.data;
      return result.map((e) => GeoModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
