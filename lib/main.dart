import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  String _result = "Informe seus dados!";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      ageController.text = "";
      genderController.text = "";
      _result = "Informe seus dados!";
    });
  }

  void _calcular() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    int idade = int.parse(ageController.text);
    int type = int.parse(genderController.text);
    double resultImc = weight / (height * height);
    double metabolismoBasal;

    if (type == 0) {
      metabolismoBasal = (66 +
          ((13.7 * weight) +
              (5 * double.parse(heightController.text)) -
              (6.8 * idade)));
    } else if (type == 1) {
      metabolismoBasal = (655 +
          ((9.6 * weight) +
              (1.8 * double.parse(heightController.text)) -
              (4.7 * idade)));
    }

    setState(() {
      if (resultImc < 18.6) {
        _result = "Abaixo do Peso (${resultImc.toStringAsPrecision(4)})";
        _result += " TMB(${metabolismoBasal.toStringAsPrecision(4)}) ";
      } else if (resultImc > 18.6 && resultImc < 25) {
        _result = "Peso Ideal (${resultImc.toStringAsPrecision(4)})";
        _result += " TMB(${metabolismoBasal.toStringAsPrecision(4)}) ";
      } else if (resultImc > 25 && resultImc < 30) {
        _result =
            "Levemente Acima do Peso (${resultImc.toStringAsPrecision(4)})";
        _result += " TMB(${metabolismoBasal.toStringAsPrecision(4)}) ";
      } else if (resultImc > 25 && resultImc < 30) {
        _result = "Obesidade Nivel 1 (${resultImc.toStringAsPrecision(4)})";
        _result += " TMB(${metabolismoBasal.toStringAsPrecision(4)}) ";
      } else if (resultImc > 30 && resultImc < 35) {
        _result = "Obesidade Nivel 1 (${resultImc.toStringAsPrecision(4)})";
        _result += " TMB(${metabolismoBasal.toStringAsPrecision(4)}) ";
      } else if (resultImc > 35 && resultImc < 40) {
        _result = "Obesidade Nivel 2 (${resultImc.toStringAsPrecision(4)})";
        _result += " TMB(${metabolismoBasal.toStringAsPrecision(4)}) ";
      } else if (resultImc > 40) {
        _result = "Obesidade Nivel 3 (${resultImc.toStringAsPrecision(4)})";
        _result += " TMB(${metabolismoBasal.toStringAsPrecision(4)}) ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.green,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "0 - Homem | 1 - Mulher",
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: genderController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Idade",
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: ageController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (Kg)",
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: weightController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: heightController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: _calcular,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                _result,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
              ),
            ],
          ),
        ));
  }
}
