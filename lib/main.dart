import 'package:appimc/calculadoraimc.dart';
import 'package:appimc/classes/Pessoa.dart';
import 'package:appimc/classes/people_list.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PessoaAdapter());
  runApp(const MaterialApp(home: IMCCalculator()));
}

class IMCCalculator extends StatefulWidget {
  const IMCCalculator({super.key});

  @override
  IMCCalculatorState createState() => IMCCalculatorState();
}

class IMCCalculatorState extends State<IMCCalculator> {
  double peso = 0.0;
  double altura = 0.0;
  String imc = "";
  String nome = "";
  var peopleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('Informe seu nome:'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  setState(() {
                    nome = value;
                  });
                },
              ),
            ),
            const Text('Informe seu peso (kg):'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    peso = double.parse(value);
                  });
                },
              ),
            ),
            const Text('Informe sua altura (m):'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    altura = double.parse(value);
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                validate();
              },
              child: const Text('Calcular IMC'),
            ),
            Text(imc),
            PeopleList(peopleList),
          ],
        ),
      ),
    );
  }

  Future<void> validate() async {
    if (peso <= 0 || altura <= 0) {
      throw "Peso e altura devem ser maiores que zero.";
    }
    var box = await Hive.openBox('myBox');
    Pessoa pessoa = Pessoa(nome, peso, altura, "");
    peso = pessoa.getPeso();
    altura = pessoa.getAltura();
    pessoa.setIMC(calculateIMC(nome, altura, peso));

    setState(() {
      imc = pessoa.getIMC();
    });
    await box.add(pessoa);
    peopleList = box.values.toList();
  }
}
