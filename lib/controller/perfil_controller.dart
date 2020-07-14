import 'package:mobx/mobx.dart';
part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  @observable
  String nome = "Gabriel da Silva Bueno";

  String emailInicial = "email@email.com";

  String senhaInicial = "1234";

  bool checkInicial = true;

  @observable
  String email = "email@email.com";

  @observable
  String senha = "1234";

  @observable
  bool check = true;

  @action
  setNome(String n) => nome = n;

  @action
  setEmail(String e) => email = e;

  @action
  setSenha(String s) => senha = s;

  @action
  setCheck() {
    if (check) {
      check = false;
    } else {
      check = true;
    }
  }

  @computed
  bool get valoresAlterados {
    if (email != null &&
        email.isNotEmpty &&
        senha != null &&
        senha.isNotEmpty) {
      if (check != checkInicial ||
          email != emailInicial ||
          senha != senhaInicial) {
        return true;
      }
      return false;
    }
    return false;
  }
}
