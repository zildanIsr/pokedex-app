import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DetailPokemonController extends GetxController {
  var pokeDetail = {}.obs;
  final dio = Dio();

  void fetchDetailPokeSpecies(String url) async {
    try {
      final response = await dio.get(url);
      pokeDetail.value = response.data;
    } catch (e) {
      rethrow;
    }
  }
}
