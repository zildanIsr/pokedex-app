import 'package:get/get.dart';

import '../controllers/search_pokemon_controller.dart';

class SearchPokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchPokemonController>(
      () => SearchPokemonController(),
    );
  }
}
