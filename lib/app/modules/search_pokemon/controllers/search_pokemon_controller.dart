import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SearchPokemonController extends GetxController {
  final pokemon = {}.obs;
  var isLoading = false.obs;
  String baseURL = 'https://pokeapi.co/api/v2/pokemon';

  final dio = Dio();

  fetchQueryPokemon(String name) async {
    isLoading(true);
    try {
      final response = await dio.get('$baseURL/$name');
      if (response.data != null) {
        pokemon.value = response.data;
        isLoading(false);
      } else {
        throw Error();
      }

      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
  }
}
