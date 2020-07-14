import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetTextForm extends StatefulWidget {
  final String value;
  final bool numero;
  final String text;
  final Icon icon;
  final Function onChanged;
  final bool enabled;
  final bool error;

  const WidgetTextForm(
      {Key key,
      this.value,
      this.text,
      this.icon,
      this.onChanged,
      this.enabled,
      this.numero,
      this.error})
      : super(key: key);
  @override
  _WidgetTextFormState createState() => _WidgetTextFormState(
      this.value,
      this.text,
      this.icon,
      this.onChanged,
      this.enabled,
      this.numero,
      this.error);
}

class _WidgetTextFormState extends State<WidgetTextForm> {
  final String value;
  final bool numero;
  final String text;
  final Icon icon;
  final Function onChanged;
  final bool enabled;
  final bool error;

  _WidgetTextFormState(this.value, this.text, this.icon, this.onChanged,
      this.enabled, this.numero, this.error);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,

      decoration: InputDecoration(
          errorText: (error == null || !error)
              ? null
              : "As informações devem ser preenchidas",
          icon: icon,
          //hintText: 'What do people call you?',
          labelText: text),
      onChanged: onChanged,
      keyboardType: numero ? TextInputType.number : null,
      enabled: enabled,
      onSaved: (String value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      //validator: (String value) {
      //return value.contains('@') ? 'Do not use the @ char.' : null;
      //}
    );
  }
}
