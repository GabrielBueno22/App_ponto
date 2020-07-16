import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/justificar_falta_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:flutter_mobile/ui/widgets/text_form.dart';
import 'package:flutter_mobile/ui/widgets/text_form_selector.dart';
import 'package:flutter_mobile/util/stringUtil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class JustificarFaltaScreen extends StatefulWidget {
  @override
  _JustificarFaltaScreenState createState() => _JustificarFaltaScreenState();
}

class _JustificarFaltaScreenState extends State<JustificarFaltaScreen> {
  final controller = GetIt.I.get<JustificarFaltaController>();
  final navigator = GetIt.I.get<NavigationService>();
  DateTime selectedDate = DateTime.now();
  var txt = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        txt.text = StringUtil.convertDate(picked);
      });
      controller.setData(picked.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 5),
                child: TextFormField(
                  readOnly: true,
                  controller: txt,
                  onTap: () {
                    _selectDate(context);
                  },
                  //initialValue: StringUtil.convertDate(DateTime.now()),
                  textInputAction: TextInputAction.continueAction,

                  //controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Data",
                      hintText: "Escolha uma data",
                      //prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(5.0)))),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 5),
                child: Row(
                  children: <Widget>[
                    Observer(builder: (_) {
                      return Checkbox(
                        value: controller.diaTodo,
                        onChanged: (bool value) {
                          controller.setDiaTodo();
                          setState(() {});
                          print(controller.diaTodo);
                        },
                        checkColor: Colors.orange,
                      );
                    }),
                    Text("Dia todo")
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 5),
                child: Observer(builder: (_) {
                  return WidgetTextForm(
                    value: controller.duracao != null
                        ? controller.duracao.toString()
                        : "",
                    //error: controller.telefoneVazio,
                    text: "Duracao em horas",
                    numero: true,
                    enabled: controller.isChecked ? false : true,
                    onChanged: (value) {
                      controller.setDuracao(double.parse(value));
                    },
                    icon: null,
                  );
                }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 5),
                child: Observer(builder: (_) {
                  return TextFormSelector(
                    onChanged: controller.setRepetirPor,
                    enabled: true,
                    initialValue: controller.repetirPor,
                    selections: [
                      "Apenas um dia",
                      "2 dias",
                      "3 dias",
                      "4 dias",
                      "5 dias",
                      "6 dias",
                      "7 dias",
                      "8 dias",
                      "9 dias",
                      "10 dias",
                      "11 dias",
                      "12 dias",
                      "13 dias",
                      "14dias"
                    ],
                    text: "Repetir por:",
                  );
                }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 5),
                child: Observer(builder: (_) {
                  return WidgetTextForm(
                    value: controller.descricao,
                    //error: controller.telefoneVazio,
                    text: "Descrição",
                    numero: false,
                    enabled: true,
                    onChanged: (value) {
                      controller.setDescricao(value);
                    },
                    icon: null,
                  );
                }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Observer(builder: (_) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: controller.validarValores
                        ? const Color(0xFFfa7d09)
                        : Colors.grey[600],
                  ),
                  child: FlatButton(
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                          color: controller.validarValores
                              ? Colors.white
                              : Colors.grey),
                    ),
                    onPressed: controller.validarValores
                        ? () {
                            navigator.navigateTo('/tabBar');
                          }
                        : null,
                  ),
                );
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
