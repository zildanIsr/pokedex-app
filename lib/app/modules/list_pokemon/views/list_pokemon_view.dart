import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travell_apps/app/data/colors_poke.dart';
import 'package:travell_apps/app/routes/app_pages.dart';

import '../controllers/list_pokemon_controller.dart';
import 'types_list_widget.dart';

class ListPokemonView extends GetView<ListPokemonController> {
  const ListPokemonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0.0,
                    automaticallyImplyLeading: false,
                    title: const Text('Pokedex'),
                    snap: true,
                    floating: true,
                    actions: [
                      IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.SEARCH_POKEMON);
                          },
                          icon: const Icon(Icons.search_outlined))
                    ],
                  ),
                  Obx(() => controller.isLoading.value
                      ? const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        )
                      : SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.4,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_POKEMON,
                                      arguments: controller.pokedex[index]);
                                },
                                child: Card(
                                    color: ColorsPoke.getColors(controller
                                        .pokedex[index]['types'][0]['type']
                                            ['name']
                                        .toString()),
                                    //argin: const EdgeInsets.all(8.0),
                                    key: ValueKey(
                                        controller.pokedex[index]['id']),
                                    // generate blues with random shades
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            bottom: -10,
                                            right: -10,
                                            child: Opacity(
                                              opacity: .3,
                                              child: Image.asset(
                                                'public/assets/images/poke-ball.png',
                                                scale: 5,
                                              ),
                                            )),
                                        Positioned(
                                          right: 0,
                                          bottom: 5,
                                          child: Hero(
                                            tag:
                                                'image-poke${controller.pokedex[index]['id']}',
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${controller.pokedex[index]['id']}.png',
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 10,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 4.0),
                                                child: Text(
                                                  controller.pokedex[index]
                                                      ['name'],
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .titleMedium,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4.0),
                                                child: TypeListWidget(
                                                  types: controller
                                                      .pokedex[index]['types'],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            },
                            childCount: controller.pokedex.length,
                          ),
                        ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
