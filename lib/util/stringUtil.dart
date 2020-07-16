import 'package:intl/intl.dart';

class StringUtil {
  static String getWeekDay(int i) {
    switch (i) {
      case 1:
        return "Segunda";
        break;
      case 2:
        return "Terça";
        break;
      case 3:
        return "Quarta";
        break;
      case 4:
        return "Quinta";
        break;
      case 5:
        return "Sexta";
        break;
      case 6:
        return "Sabádo";
        break;
      case 7:
        return "Domingo";
        break;
      default:
    }
  }

  static String getMonth(int i) {
    switch (i) {
      case 1:
        return "Janeiro";
        break;
      case 2:
        return "Fevereiro";
        break;
      case 3:
        return "Março";
        break;
      case 4:
        return "Abril";
        break;
      case 5:
        return "Maio";
        break;
      case 6:
        return "Junho";
        break;
      case 7:
        return "Julho";
        break;
      case 8:
        return "Agosto";
        break;
      case 9:
        return "Setembro";
        break;
      case 10:
        return "Outubro";
        break;
      case 11:
        return "Novembro";
        break;
      case 12:
        return "Dezembro";
        break;
      default:
    }
  }

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

  static String convertDate3(String date) {
    List<String> list = date.split("/");
    return "${list[2]}-${list[1]}-${list[0]}";
  }

  static String convertDate4(String date) {
    List<String> list = date.split("-");
    return "${list[2]}/${list[1]}/${list[0]}";
  }

  static String convertTime(DateTime date) {
    final f = DateFormat('HH:mm');

    return f.format(date).toString();
  }

  static String compare(DateTime dateTime1, DateTime dateTime2) {
    Duration dif = dateTime1.toUtc().difference(dateTime2.toUtc());
    int min = dif.inMinutes;
    print(min);
    double hour = min / 60.0;
    print(hour);
    min = min - hour.floor() * 60;
    String hours = hour.floor().toString();
    String minutes = min.toString();
    if (min < 10) {
      minutes = "0" + minutes;
    }
    if (hour < 10) {
      hours = "0" + hours;
    }
    return hours + ":" + minutes;
  }

  static String convertMoneyString(double d) {
    if (d == 0.0) {
      final currency = NumberFormat("0.00", "pt_BR");
      return currency.format(d);
    }
    final currency = NumberFormat("##0.00", "pt_BR");
    return currency.format(d);
  }

  static String convertWeightString(double d) {
    if (d == 0.0) {
      final currency = NumberFormat("0", "pt_BR");
      return currency.format(d);
    }
    final kg = NumberFormat("##0.000", "pt_BR");
    return kg.format(d);
  }

  static DateTime nextDay(DateTime current) {
    if (current.day == DateTime.now().day) {
      return DateTime.now();
    } else {
      return current.add(new Duration(days: 1));
    }
  }

  static DateTime previousDay(DateTime current) {
    return current.subtract(new Duration(days: 1));
  }

  static List<String> convertHour(String hour) {
    List<String> list = hour.split(":");
    return list;
  }
}
