import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DetailPokemonController extends GetxController {
  var pokeDetail = {}.obs;
  var isLoading = false.obs;
  final dio = Dio();

  fetchDetailPokeSpecies(String url) async {
    isLoading(true);
    try {
      final response = await dio.get(url);
      pokeDetail.value = response.data;

      isLoading(false);
    } catch (e) {
      rethrow;
    }
  }
}
