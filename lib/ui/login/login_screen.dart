import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/login_controller.dart';
import 'package:flutter_mobile/util/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = GetIt.I.get<LoginController>();

  _textField({String labelText, onChanged, String errorText}) {
    return TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Stack(

          
          children: <Widget>[
            Positioned.fill(
                bottom: -MediaQuery.of(context).viewInsets.bottom,
                child: Container()
                // child: Image(
                //   image: AssetImage('assets/bg.webp'),
                //   fit: BoxFit.cover,
                // ),
                ),
            Observer(
              builder: (_) {
                switch (controller.stateLogin) {
                  case LoginState.LOADING:
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.grey),
                      ),
                    );
                    break;
                  case LoginState.SUCCESS:
                  case LoginState.FAIL:
                  case LoginState.IDLE:
                  default:
                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(),
                        SingleChildScrollView(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              Observer(
                                builder: (_) {
                                  return _textField(
                                      errorText: AppLocalizations.of(context)
                                          .translate(controller.validateUser),
                                      labelText: AppLocalizations.of(context)
                                          .translate('tf_user'),
                                      onChanged: controller.login.setUser);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Observer(
                                builder: (_) {
                                  return _textField(
                                      errorText: AppLocalizations.of(context)
                                          .translate(controller.validatePwd),
                                      labelText: AppLocalizations.of(context)
                                          .translate('tf_pwd'),
                                      onChanged: controller.login.setPwd);
                                },
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Observer(
                                builder: (_) {
                                  return RaisedButton(
                                    onPressed: controller.isValid
                                        ? () {
                                            controller.postLogin().then((onValue){
                                              if(onValue is bool){
                                                //redireciona
                                              }else if(onValue is String){
                                                //mostra mensagem
                                              }
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate('bt_login'),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
