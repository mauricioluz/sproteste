import 'package:flutter/material.dart';
import 'package:sproteste/app/characters/controller/character_controller.dart';
import 'package:sproteste/app/characters/model/character.dart';
import 'package:sproteste/services/models/result_response.dart';
import 'package:sproteste/widgets/appbar/custom_app_bar.dart';
import 'package:sproteste/widgets/tile/character_tile.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final CharacterController _controller = CharacterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Characters"),
      body: FutureBuilder<ResultResponse>(
        future: _controller.fetchCharacters(),
        builder: ((_, snapshot) {
          if (snapshot.hasData) {
            List<Character> characters = snapshot.data!.data;

            return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: characters.length,
                itemBuilder: (_, index) {
                  Character character = characters[index];
                  return CharacterTile(character: character, onTap: () {});
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor));
          }
        }),
      ),
    );
  }
}
