import 'package:get/get.dart';

import 'package:dio/dio.dart';

class ListPokemonController extends GetxController {
  RxBool isLoading = false.obs;
  String baseURL = 'https://pokeapi.co/api/v2/';
  List pokedex = [];

  final dio = Dio();

  Future<void> fetchDataPokemon() async {
    isLoading(true);
    try {
      for (int i = 1; i <= 100; i++) {
        final response = await dio.get('${baseURL}pokemon/$i');
        var data = response.data;
        pokedex.add(data);
      }

      isLoading(false);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  @override
  void onInit() {
    fetchDataPokemon();

    super.onInit();
  }

  @override
  void onReady() {
    print('onReade');
    super.onReady();
  }

  @override
  void onClose() {
    print('onclose');
    super.onClose();
  }
}
