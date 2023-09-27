import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:travell_apps/app/data/colors_poke.dart';

import '../controllers/detail_pokemon_controller.dart';
import 'stats_bar_indicator_widget.dart';
import 'type_row_list_widget.dart';

class DetailPokemonView extends GetView<DetailPokemonController> {
  const DetailPokemonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataPoke = Get.arguments;

    controller.fetchDetailPokeSpecies(dataPoke['species']['url']);

    double mediaHeight =
        MediaQuery.sizeOf(context).height - MediaQuery.of(context).padding.top;

    var appBarWidget = AppBar(
      elevation: 0.0,
      backgroundColor:
          ColorsPoke.getColors(dataPoke['types'][0]['type']['name']),
    );

    double acctualHeight = mediaHeight - appBarWidget.preferredSize.height;

    return Scaffold(
        backgroundColor:
            ColorsPoke.getColors(dataPoke['types'][0]['type']['name']),
        appBar: appBarWidget,
        body: Stack(
          children: [
            SlidingUpPanel(
                minHeight: acctualHeight * .65,
                maxHeight: acctualHeight * .65,
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                panel: Center(
                  child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        backgroundColor: Colors.white,
                        appBar: AppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.white,
                          elevation: 0.0,
                          bottom: const TabBar(
                            labelColor: Colors.black,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                            unselectedLabelColor: Colors.black26,
                            indicatorColor: Colors.indigo,
                            indicatorWeight: 3.0,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(text: 'About'),
                              Tab(text: 'Base Status'),
                            ],
                          ),
                        ),
                        body: TabBarView(
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(.5),
                                    2: FlexColumnWidth(1.5),
                                  },
                                  children: [
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 14.0),
                                        child: Text(
                                          'Height',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black38),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14.0),
                                        child: Text(
                                          '${dataPoke['height'].toString()} cm',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black87),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 14.0),
                                        child: Text(
                                          'Weight',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black38),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14.0),
                                        child: Text(
                                          '${dataPoke['weight']} kg',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black87),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 14.0),
                                        child: Text(
                                          'Abilities',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black38),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14.0),
                                          child: Wrap(
                                            children: [
                                              for (var i
                                                  in dataPoke['abilities'])
                                                Text(
                                                    '${i['ability']['name']}, ',
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black87))
                                            ],
                                          )),
                                    ]),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (var i in dataPoke['stats'])
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Text(
                                              i['stat']['name'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black38),
                                            ),
                                          )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (var i in dataPoke['stats'])
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Text(
                                              i['base_stat'].toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        for (var i in dataPoke['stats'])
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                .4,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18.5),
                                            child: StatIndicator(
                                              value: (i['base_stat'] / 100),
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                )),
                            const Icon(Icons.directions_bike),
                          ],
                        ),
                      )),
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            SizedBox(
              height: acctualHeight * .35,
              width: MediaQuery.sizeOf(context).width,
              //color: Colors.amber,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      bottom: 0,
                      right: -50,
                      child: Opacity(
                        opacity: .1,
                        child: Image.asset(
                          'public/assets/images/poke-ball.png',
                          scale: 2.5,
                        ),
                      )),
                  Positioned(
                    bottom: -30,
                    left: 0,
                    right: 0,
                    child: Hero(
                      tag: 'image-poke${dataPoke['id']}',
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${dataPoke['id']}.png',
                        height: acctualHeight * .35,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SizedBox(
                height: 100,
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dataPoke['name'],
                          style: GoogleFonts.poppins(
                              textStyle:
                                  Theme.of(context).textTheme.headlineMedium,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        TypeListRowWidget(
                          types: dataPoke['types'],
                        ),
                      ],
                    ),
                    Text(
                      '#${dataPoke['id']}',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
