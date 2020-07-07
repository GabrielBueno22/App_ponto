import 'package:intl/intl.dart';

class StringUtil {
  static String convertDateWithTime(DateTime date) {
    final f = DateFormat('dd/MM/yyyy HH:mm');

    return f.format(date).toString();
  }

  static String convertDate(DateTime date) {
    final f = DateFormat('dd/MM/yyyy');

    return f.format(date).toString();
  }

  static String convertDate2(DateTime date) {
    final f = DateFormat('yyyy-MM-dd');

    return f.format(date).toString();
  }

  static String convertDate3(String date){
    List<String> list = date.split("/");
    return "${list[2]}-${list[1]}-${list[0]}";
  }

  static String convertDate4(String date){
    List<String> list = date.split("-");
    return "${list[2]}/${list[1]}/${list[0]}";
  }

  static String convertTime(DateTime date) {
    final f = DateFormat('HH:mm');

    return f.format(date).toString();
  }


  static String convertMoneyString(double d) {
    if (d == 0.0) {
      final currency = NumberFormat("0.00", "pt_BR");
      return currency.format(d);
    }
    final currency = NumberFormat("##0.00", "pt_BR");
    return currency.format(d);
  }

  static String convertWeightString(double d){
    if (d == 0.0) {
      final currency = NumberFormat("0", "pt_BR");
      return currency.format(d);
    }
    final kg = NumberFormat("##0.000", "pt_BR");
    return kg.format(d);
  }
}
