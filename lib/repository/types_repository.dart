import 'package:desafio_pokemon/models/types/all_types.dart';
import 'package:desafio_pokemon/settings.dart';
import 'package:dio/dio.dart';

class TypesRepository {
  Future<AllTypesResult> getAllTypes() async {
    var dio = Dio();

    var url = '${Settings.apiUrl}/type/';

    var response = await dio.get(url,
        options: Options(
            headers: {Headers.contentTypeHeader: Headers.jsonContentType}));

    return AllTypesResult.fromJson(response.data);
  }
}
