import 'dart:convert';

import 'package:flutter/material.dart';

import 'dynamic_form/dynamic_form.dart';

void main() => runApp(JsonToFormsSample());

class JsonToFormsSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Form Sample',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Dynamic Forms Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();
  bool autoValidateForm = false;
  dynamic formResponse;
  String simpleInputExample = json.encode([
    {
      "type": "Input",
      "id" : "252io5yu4i",
      "title": "Assunto",
      "style": {
        "placeholder": "Campo",
        "helperText" : "Capo de exemplo",
        "helperTextColor": "#000000",
        "requiredText" : "Campo obrigatório",
        "minimumRequiredText" : "Minimo 10 caracteres"
      },
      "validation": {
        "required" : true,
        "minimumRequired" : 5,
        "maxLength" : 10,
      },
    },
    {
      "type": "Input",
      "id": "252io5yu4i",
      "title": "Assunto 2",
      "style": {
        "placeholder": "Campo",
        "helperText": "Capo de exemplo",
        "helperTextColor": "#000000",
        "requiredText": "Campo obrigatório",
        "minimumRequiredText": "Minimo 10 caracteres"
      },
      "validation": {
        "required": true,
        "minimumRequired": 8,
      }
    }
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                child: Text("Demonstração da biblioteca que desenvolvi para trabalhar com formulários dinâmicos, provenientes de JSONs de WebAPIs\n\n\nOs campos abaixo foram gerados a partir de um JSON:"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: DynamicForm(
                  formKey: _formKey,
                  form: simpleInputExample,
                  autoValidate: autoValidateForm,
                  padding: 10,
                  onChanged: (dynamic response) {
                    this.formResponse = response;
                  },
                ),
              ),
              RaisedButton(
                child: Text("Validar e 'Enviar'"),
                onPressed: (){
                  setState(() {
                    autoValidateForm = true;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
