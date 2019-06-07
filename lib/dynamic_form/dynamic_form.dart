import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'components/textfield/textfield.dart';


class DynamicForm extends StatefulWidget {
  const DynamicForm({
    @required this.form,
    @required this.onChanged,
    @required this.formKey,
    @required this.autoValidate,
    this.padding,
    this.formMap,
  });

  final String form;
  final dynamic formMap;
  final double padding;
  final bool autoValidate;
  final formKey;
  final ValueChanged<dynamic> onChanged;

  @override
  _DynamicFormState createState() =>
      new _DynamicFormState(formMap ?? json.decode(form));
}

class _DynamicFormState extends State<DynamicForm> {

  final dynamic formItems;

  int radioValue;

  _DynamicFormState(this.formItems);

  List<Widget> jtf() {

    List<Widget> listWidget = new List<Widget>();

    for (var count = 0; count < formItems.length; count++) {
      Map item = formItems[count];

      print(item);
      if (item['type'] == "Input" ||
          item['type'] == "Password" ||
          item['type'] == "Email" ||
          item['type'] == "TextArea"||
          item['type'] == "Date") {

        CFTextFieldType type;

        switch(item['type']){
          case 'Input':
            type = CFTextFieldType.input;
            break;
          case 'Password':
            type = CFTextFieldType.password;
            break;
          case 'Email':
            type = CFTextFieldType.email;
            break;
          case 'TextArea':
            type = CFTextFieldType.textArea;
            break;
          case 'Date':
            type = CFTextFieldType.date;
            break;
          default:
            type = CFTextFieldType.input;
            break;
        }

        if(item['required'] != null){
          print(item['required']['if']);
          print(formItems[item['required']['if']]);
          if(formItems[item['required']['if']]['value'] == item['required']['equal']){
            listWidget.add(
              new CFTextField(
                title: item['title'],
                type: type,
                style: item['style'],
                extraPadding: item['style']['helperText']!=null||item['style']['maxLength']!=null,
                labelText: item['style']['placeholder'] ?? "",
                maxLines: item['type'] == "TextArea" ? 10 : 1,
                helperText: item['style']['helperText'] ?? "",
                helperTextColor: item['style']['helperTextColor'] ?? "#000000",
                validate: item['style']['validate'] ?? false,
                prefixIcon: item['style']['prefixIcon'] ?? null,
                validatorText: item['style']['validatorText'] ?? "",
                maxLength: type==CFTextFieldType.date?10:item['style']['maxLength'] ?? null,
                onSaved: (String value) {
                  formItems[count]['response'] = value;
                  _handleChanged();
                },
              )
            );
          }
        }else {
          listWidget.add(
            new CFTextField(
              title: item['title'],
              type: type,
              style: item['style'],
              extraPadding: item['style']['helperText']!=null||item['style']['maxLength']!=null,
              labelText: item['style']['placeholder'] ?? "",
              maxLines: item['type'] == "TextArea" ? 10 : 1,
              helperText: item['style']['helperText'] ?? "",
              helperTextColor: item['style']['helperTextColor'] ?? "#000000",
              validate: item['style']['validate'] ?? false,
              prefixIcon: item['style']['prefixIcon'] ?? null,
              validatorText: item['style']['validatorText'] ?? "",
              maxLength: type==CFTextFieldType.date?10:item['validation']!=null?item['validation']['maxLength'] ?? null:null,
              onSaved: (String value) {
                formItems[count]['response'] = value;
                _handleChanged();
              },
              validations: item['validation'],
            )
          );
        }
      }

      if (item['type'] == "RadioButton") {
        //Implementado porém não publicado nessa versão de demonstração
      }

      if (item['type'] == "Switch") {
        //Implementado porém não publicado nessa versão de demonstração
      }

      if (item['type'] == "Checkbox") {
        //Implementado porém não publicado nessa versão de demonstração
      }
    }
    return listWidget;
  }

  void _handleChanged() {
    widget.onChanged(formItems);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidate: widget.autoValidate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: jtf(),
      ),
    );
  }
}