import 'package:get/get.dart';

import '../controllers/detail_pokemon_controller.dart';

class DetailPokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPokemonController>(
      () => DetailPokemonController(),
    );
  }
}
