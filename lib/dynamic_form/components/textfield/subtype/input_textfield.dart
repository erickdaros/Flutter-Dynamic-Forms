import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_json_to_forms_sample/dynamic_form/utils/textfield_validations.dart';
import 'package:flutter_json_to_forms_sample/themes/MainTheme.dart';
import 'package:icons_helper/icons_helper.dart';

import '../textfield.dart';


class InputTextField extends StatefulWidget {
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

  InputTextField({
    Key key,
    this.title,
    this.labelText,
    this.maxLines,
    this.onSaved,
    this.obscureText,
    this.validate = true,
    this.validatorText = "",
    this.helperText = '',
    this.helperTextColor = "#000000",
    this.type,
    this.maxLength,
    this.extraPadding,
    this.prefixIcon,
    this.validations,
    this.style,
  });

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  TextEditingController teController = new TextEditingController();

  DateTime selectedDate = DateTime.now();

  String formatZero(int value) {
    return value < 10 ? "0" + value.toString() : value.toString();
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
        teController.text = formatZero(picked.day) +
            "/" +
            formatZero(picked.month) +
            "/" +
            picked.year.toString();
      });
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  IconData stringToIcon(String iconName) {
    return getIconGuessFavorMaterial(name: iconName);
  }

  Widget dateAction() {
    return new IconButton(
      icon: new Icon(Icons.today),
      onPressed: () {
        _selectDate(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("TextFiels: "+widget.style.toString());
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Material(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.only(
              left: 15, right: 15, top: 3, bottom: widget.extraPadding ? 7 : 0),
          child: Column(
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.only(top: 7, bottom: 6.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    widget.title,
                    style: new TextStyle(
//                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: MainTheme.accent,
                    primaryColorDark: MainTheme.accent,
                  ),
                  child: new TextFormField(
                    cursorColor: MainTheme.accent,
                    controller: teController,
                    decoration: new InputDecoration(
                      prefixIcon: widget.prefixIcon == null
                          ? null
                          : new Icon(stringToIcon(widget.prefixIcon)),
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: widget.labelText,
                      helperText: widget.helperText,
                      helperStyle: TextStyle(
                        color: hexToColor(widget.helperTextColor),
                      ),
                    ),
                    maxLines: widget.maxLines,
                    maxLength: widget.maxLength,
                    onSaved: widget.onSaved,
                    obscureText: widget.type == CFTextFieldType.password,
                    validator: (value) {
                      return TextFieldValidations.getValidation(widget.validations, widget.style, value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
