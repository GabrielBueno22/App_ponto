import 'package:dio/dio.dart';
import 'package:flutter_mobile/data/data_manager.dart';
import 'package:flutter_mobile/data/model/login.dart';
import 'package:flutter_mobile/util/validateUtil.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;


enum LoginState {IDLE, LOADING, SUCCESS, FAIL}

abstract class _LoginControllerBase with Store {
  var login = Login();

  @observable
  LoginState stateLogin = LoginState.IDLE;
  @action
  setStateLogin(LoginState state) => stateLogin = state;

   @computed
  bool get isValid => validatePwd == null && validateUser == null;

  @computed
  String get validateUser{
    if(login.user == null || login.user.isEmpty){
      return 'error_user_empty';
    }else if (login.user.length < 3){
      return 'error_user_short';
    }
    return null;
  }

  @computed
  String get validateEmail{
    if(!ValidateUtil.validarEmail(login.user)){
      return 'error_user_wrong_email';
    }
    return null;
  }

  @computed
  String get validateCPF{
    if(!ValidateUtil.validarCPF(login.user)){
      return 'error_user_wrong_cpf';
    }
    return null;
  }

  @computed
  String get validatePwd{
    if(login.pwd == null || login.pwd.isEmpty){
      return 'error_pwd_empty';
    }
    return null;
  }
  
  Future postLogin(){
    setStateLogin(LoginState.LOADING);
    return DataManager.instance.postLogin(login).then((response) async {
      print(response);
      if (response != null && response is Response) {
      
      }else {
        DioError e = response;
        if (e.response != null) {
          print(e.response.data);
          //e.response.data["chave"]
          print(e.response.headers);
          print(e.response.request);
          return e.response.data['message'];
        } else {
          print(e.request);
          print(e.message);
          return e.message;
        }
      }
      login.setUser(null);
      login.setPwd(null);
      //tratar o resultado
      await new Future.delayed(const Duration(seconds: 3));
      setStateLogin(LoginState.SUCCESS);
      return true;
    });
  }


  
}