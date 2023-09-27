import 'dart:ui';

import 'package:flutter/material.dart';

class TypeListWidget extends StatelessWidget {
  final List types;

  const TypeListWidget({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    List<Widget> listType = <Widget>[];

    for (var e in types) {
      listType.add(
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
                margin: const EdgeInsets.only(bottom: 6.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(.3),
                      Colors.white.withOpacity(.1),
                    ],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white.withOpacity(.2),
                  ),
                ),
                child: Text(
                  e['type']['name'],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                )),
          ),
        ),
      );
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: listType);
  }
}
