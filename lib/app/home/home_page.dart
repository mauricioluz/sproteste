import 'package:flutter/material.dart';
import 'package:sproteste/widgets/appbar/custom_app_bar.dart';
import 'package:sproteste/widgets/button/custom_elevated_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "SPRO Teste"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  "Bem-vindo ao app de teste SPRO, desenvolvido por Mauricio Barros",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20),
              CustomElevatedButton(
                  text: "Começar",
                  onPressed: () {
                    Navigator.of(context).pushNamed("/characters");
                  })
            ]),
      ),
    );
  }
}
