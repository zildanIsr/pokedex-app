import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travell_apps/app/data/colors_poke.dart';
import 'package:travell_apps/app/modules/detail_pokemon/views/type_row_list_widget.dart';
import 'package:travell_apps/app/routes/app_pages.dart';

import '../controllers/search_pokemon_controller.dart';
import 'debouncer.dart';

class SearchPokemonView extends StatefulWidget {
  const SearchPokemonView({super.key});

  @override
  State<SearchPokemonView> createState() => _SearchPokemonViewState();
}

class _SearchPokemonViewState extends State<SearchPokemonView> {
  TextEditingController ctrForm = TextEditingController();
  final debouncer = Debouncer(milliseconds: 500);

  SearchPokemonController getSearch = Get.put(SearchPokemonController());

  _fetch(e) {
    getSearch.fetchQueryPokemon(e);
  }

  @override
  void dispose() {
    getSearch.dispose();
    ctrForm.dispose();
    debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: TextFormField(
            controller: ctrForm,
            onChanged: (value) {
              if (value != '') {
                debouncer.run(() {
                  _fetch(value);
                });
              }
            },
            autofocus: true,
            decoration: InputDecoration(
                hintText: 'Enter a pokemon name',
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                suffixIcon: IconButton.filled(
                    onPressed: ctrForm.clear, icon: const Icon(Icons.close)),
                border: InputBorder.none),
          ),
        ),
        body: Obx(
          () => getSearch.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : getSearch.pokemon['name'] == null
                  ? const Center(
                      child: Text('Pokemon tidak ditemukan'),
                    )
                  : Card(
                      key: ValueKey(getSearch.pokemon['id']),
                      color: ColorsPoke.getColors(
                          getSearch.pokemon['types'][0]['type']['name']),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_POKEMON,
                              arguments: getSearch.pokemon);
                        },
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          leading: CachedNetworkImage(
                            imageUrl:
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${getSearch.pokemon['id']}.png',
                            fit: BoxFit.cover,
                            height: 70,
                            width: 70,
                          ),
                          title: Text(
                            getSearch.pokemon['name'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TypeListRowWidget(
                                  types: getSearch.pokemon['types'])),
                        ),
                      ),
                    ),
        ));
  }
}
