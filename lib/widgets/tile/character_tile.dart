import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sproteste/app/characters/model/character.dart';
import 'package:sproteste/utils/decoration_utils.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  final Function() onTap;
  const CharacterTile({Key? key, required this.character, required this.onTap})
      : super(key: key);

  _characterImage() {
    return Hero(
      tag: character.id,
      child: Material(
        elevation: 8,
        borderRadius: DecorationUtils.defaultBorderRadius,
        child: ClipRRect(
          borderRadius: DecorationUtils.defaultBorderRadius,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: character.imageUrl,
            width: 100,
          ),
        ),
      ),
    );
  }

  _getTextColor() {
    Color textColor;
    switch (character.status) {
      case "Alive":
        textColor = Colors.green;
        break;
      case "Dead":
        textColor = Colors.red;
        break;
      default:
        textColor = Colors.black;
        break;
    }
    return textColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed("/singlecharacter", arguments: character),
      child: SizedBox(
          height: 120,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: DecorationUtils.defaultBorderRadius),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(character.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              Text(character.species,
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              const SizedBox(height: 10),
                              Text(character.status,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(color: _getTextColor()))
                            ],
                          ),
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 32,
                            color: Colors.black,
                          )
                        ],
                      ),
                    )),
              ),
              Positioned(
                top: 0,
                left: 10,
                child: _characterImage(),
              ),
            ],
          )),
    );
  }
}
