import 'package:flutter/material.dart';
import 'package:sproteste/app/characters/characters_page.dart';
import 'package:sproteste/app/characters/model/character.dart';
import 'package:sproteste/app/characters/single_character_page.dart';
import 'package:sproteste/app/home/home_page.dart';
import 'package:sproteste/theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPRO Teste',
      theme: CustomTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        late Widget page;
        if (settings.name == "/") {
          page = const HomePage();
        } else if (settings.name == "/characters") {
          page = const CharactersPage();
        } else if (settings.name == "/singlecharacter") {
          page =
              SingleCharacterPage(character: settings.arguments as Character);
        }
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
            transitionDuration: const Duration(milliseconds: 600));
      },
    );
  }
}
