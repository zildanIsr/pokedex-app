import 'package:get/get.dart';

import '../controllers/list_pokemon_controller.dart';

class ListPokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPokemonController>(
      () => ListPokemonController(),
    );
  }
}
