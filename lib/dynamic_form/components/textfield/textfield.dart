import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_helper/icons_helper.dart';

import 'subtype/input_textfield.dart';


enum CFTextFieldType {
 password,
 email,
 input,
 textArea,
 date,
}

class CFTextField extends StatefulWidget {

  final String title;
  final String labelText;
  final int maxLines;
  final int maxLength;
  final Function onSaved;
  final bool obscureText;
  final bool validate;
  final String validatorText;
  final String helperText;
  final String helperTextColor;
  final CFTextFieldType type;
  final bool extraPadding;
  final String prefixIcon;
  final dynamic validations;
  final dynamic style;


  CFTextField({Key key, this.title, this.labelText, this.maxLines, this.onSaved, this.obscureText,
    this.validate = true, this.validatorText = "", this.helperText = '', this.helperTextColor = "#000000",
    this.type, this.maxLength, this.extraPadding, this.prefixIcon, this.validations, this.style,
  });

  @override
  _CFTextFieldState createState() => _CFTextFieldState();
}

class _CFTextFieldState extends State<CFTextField> {

  TextEditingController teController = new TextEditingController();

//  DateTextInputFormatter date = new DateTextInputFormatter();

  DateTime selectedDate = DateTime.now();

  String formatZero(int value){
    return value<10?"0"+value.toString():value.toString();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1801, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        teController.text = formatZero(picked.day)+"/"
            +formatZero(picked.month)+"/"
            +picked.year.toString();
      });
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  IconData stringToIcon(String iconName){
    return getIconGuessFavorMaterial(name: iconName);
  }

  Widget dateAction(){
    return new IconButton(
      icon: new Icon(Icons.today),
      onPressed: (){
        _selectDate(context);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    switch(widget.type){
      case CFTextFieldType.input:
        return InputTextField(
          type: widget.type,
          title: widget.title,
          style: widget.style,
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon,
          extraPadding: widget.extraPadding,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          helperText: widget.helperText,
          helperTextColor: widget.helperTextColor,
          validations: widget.validations,
        );
        break;
      case CFTextFieldType.email:
        //Implementado porém não publicado nessa versão de demonstração
        break;
      case CFTextFieldType.password:
        //Implementado porém não publicado nessa versão de demonstração
        break;
      case CFTextFieldType.date:
        //Implementado porém não publicado nessa versão de demonstração
        break;
      case CFTextFieldType.textArea:
        //Implementado porém não publicado nessa versão de demonstração
        break;
      default:
        return Container();
        break;
    }
    return Container();
  }
}