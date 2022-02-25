import 'package:flutter/material.dart';
import 'package:sproteste/app/characters/model/character.dart';
import 'package:sproteste/utils/decoration_utils.dart';
import 'package:transparent_image/transparent_image.dart';

class FlexibleAppBar extends StatelessWidget {
  final Character character;
  FlexibleAppBar({required this.character});

  double topHeight = 0.0;

  _buildImageHeader() {
    return Hero(
      tag: character.id,
      transitionOnUserGestures: true,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: DecorationUtils.defaultBorderRadius.bottomLeft,
            bottomRight: DecorationUtils.defaultBorderRadius.bottomRight),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: character.imageUrl,
          fit: BoxFit.cover,
          height: 300,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      expandedHeight: 300,
      pinned: true,
      stretch: true,
      leading: Container(
          margin: const EdgeInsets.only(left: 15, top: 10),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          child: const BackButton(color: Colors.white)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: DecorationUtils.defaultBorderRadius.bottomLeft,
              bottomRight: DecorationUtils.defaultBorderRadius.bottomRight)),
      flexibleSpace: LayoutBuilder(
        builder: (_, constraints) {
          topHeight = constraints.biggest.height;

          return FlexibleSpaceBar(
              centerTitle: true,
              background: _buildImageHeader(),
              stretchModes: const [StretchMode.zoomBackground],
              title: null);
        },
      ),
    );
  }
}
