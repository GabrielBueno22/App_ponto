import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/pedido_hora_extra_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:flutter_mobile/ui/widgets/text_form_selector.dart';
import 'package:flutter_mobile/util/stringUtil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:numberpicker/numberpicker.dart';

class PedidoHoraExtraScreen extends StatefulWidget {
  @override
  _PedidoHoraExtraScreenState createState() => _PedidoHoraExtraScreenState();
}

class _PedidoHoraExtraScreenState extends State<PedidoHoraExtraScreen> {
  final controller = GetIt.I.get<PedidoHoraExtraController>();
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
        title: Text("Hora extra"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
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
                        borderRadius: BorderRadius.all(Radius.circular(5.0)))),
              ),
              Container(
                child: Text(
                  "Selecione quantas horas irá realizar:",
                ),
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blueGrey),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Horas",
                          ),
                          //alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02),
                        ),
                        Observer(builder: (_) {
                          return NumberPicker.integer(
                              initialValue: controller.horas,
                              minValue: 0,
                              maxValue: 12,
                              onChanged: (value) {
                                controller.setHoras(value);
                              });
                        }),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Minutos",
                          ),
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02),
                        ),
                        Observer(builder: (_) {
                          return NumberPicker.integer(
                              initialValue: controller.minutos,
                              minValue: 0,
                              maxValue: 59,
                              onChanged: (value) {
                                controller.setMinutos(value);
                                print(controller.minutos);
                              });
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextFormField(
                onChanged: (value) {
                  controller.setDescricao(value);
                },
                minLines: 1,
                maxLines: 3,
                keyboardType: TextInputType.text,
                //controller: editingController,
                decoration: InputDecoration(
                    labelText: "Descrição",
                    hintText: "Descreva seu pedido de hora extra",
                    //prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: controller.canSave
                      ? const Color(0xFFfa7d09)
                      : Colors.grey[600],
                ),
                child: FlatButton(
                    onPressed: controller.canSave ? () {} : null,
                    child: Text("Salvar",
                        style: TextStyle(
                          color: controller.canSave
                              ? Colors.white
                              : Colors.blueGrey[100],
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
