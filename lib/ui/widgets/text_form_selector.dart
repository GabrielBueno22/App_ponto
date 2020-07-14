import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormSelector extends StatefulWidget {
  final List<String> selections;
  final Function onChanged;
  final String text;
  final String initialValue;
  final bool enabled;

  const TextFormSelector(
      {Key key,
      this.selections,
      this.onChanged,
      this.text,
      this.initialValue,
      this.enabled})
      : super(key: key);

  @override
  _TextFormSelectorState createState() => _TextFormSelectorState(
      this.selections,
      this.onChanged,
      this.text,
      this.initialValue,
      this.enabled);
}

class _TextFormSelectorState extends State<TextFormSelector> {
  final List<String> selections;
  String selectedValue;
  final Function onChanged;
  final String text;
  final String initialValue;
  final bool enabled;

  _TextFormSelectorState(this.selections, this.onChanged, this.text,
      this.initialValue, this.enabled);
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
              //labelStyle: textStyle,
              enabled: enabled,
              labelText: text,
              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
              hintText: 'Selecione a opção',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          isEmpty: selectedValue == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue == null ? initialValue : selectedValue,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  onChanged(newValue);
                  selectedValue = newValue;
                  state.didChange(newValue);
                });
              },
              items: selections.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
