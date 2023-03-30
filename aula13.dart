// pubspec.yaml: assets > - assets/
// terminal: flutter pub add google_fonts
// https://pub.dev/packages/google_fonts
// ***atualizar pubspec.yaml: flutter pub get***
// ***analysis_options.yaml: # include: package:flutter_lints/flutter.yaml***

///////////////////////////////////////////// main.dart //////////////////////////////////////////////////
import 'package:api/api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyApi(),
    );
  }
}

/////////////////////////////////////// (new file) api.dart //////////////////////////////////////////////
import 'package:api/widgets/mybody.dart';
import 'package:api/widgets/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApi extends StatefulWidget {
  const MyApi({super.key});

  @override
  State<MyApi> createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "API",
          style: GoogleFonts.kiteOne(),
        ),
      ),
      drawer: Drawer(
        child: MyDrawer(),
      ),
      body: MyBody(),
    );
  }
}

/////////////////////////// (new folder) lib: widgets > (new file) mydrawer.dart /////////////////////////
import 'package:api/widgets/myalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: () => showDialog(
            context: context,
            builder: ((context) => MyAlert())
          ),
          leading: Icon(Icons.arrow_forward),
          title: Text(
            "Abrir caixa de alerta",
            style: GoogleFonts.kiteOne(
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}

////////////////////////////////// lib: widgets > (new file) myalert.dart ////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAlert extends StatefulWidget {
  const MyAlert({super.key});

  @override
  State<MyAlert> createState() => _MyAlertState();
}

class _MyAlertState extends State<MyAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Caixa de diálogo",
        style: GoogleFonts.kiteOne(),
      ),
      content: Text(
        "Este é um exemplo de AlertDialog: uma caixa de diálogo amplamente usada nas mais diversas aplicações."
      ),
      actions: [
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.fingerprint)
        )
      ],
    );
  }
}

/////////////////////////////////// lib: widgets > (new file) mybody.dart ////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  TextEditingController _cep = TextEditingController();
  String _cepRecebido = "";

  void _retornaCep() async {
    try {
      String urlJson = "https://viacep.com.br/ws/"+ _cep.text +"/json/";
      Http.Response response = await Http.get(Uri.parse(urlJson));

      Map site = json.decode(response.body);
    
      String ruaJson = site["logradouro"];
      String cidadeJson = site["localidade"];
      String bairroJson = site["bairro"];
      String ufJson = site["uf"];

      setState(() {
        _cepRecebido = ruaJson + "\n" + cidadeJson + "\n" + bairroJson + "\n" + ufJson;
        print(ruaJson + "\n" + cidadeJson + "\n" + bairroJson + "\n" + ufJson);
      });

    } catch(erro) {
      setState(() {
        _cepRecebido = "Cep não encontrado!";
      });
    }    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 100, right: 100, bottom: 50),
              child: TextField(
                controller: _cep,
                maxLength: 8,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  hintText: "Digite um cep",
                ),
              ),
            ),

            ElevatedButton(
              onPressed: _retornaCep,
              child: Text("BUSCAR CEP")
            ),

            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                _cepRecebido,
                style: GoogleFonts.actor(
                    fontSize: 20,
                  )
                ),
              )
          ],
        ),
      ),
    );
  }
