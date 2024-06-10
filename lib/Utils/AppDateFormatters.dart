import 'package:intl/intl.dart';

class AppDateFormatters{

  static String formatYYYYMMDD(DateTime date){
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter. format(date);
    return formatted;
  }

  static String formatDDMMMYYYY(String date) {
    /// 1. provide datetime formate in format variable
    /// 2. which formate of date or time get use formatter variable
    DateFormat format = DateFormat("EEEE, dd MMM yyyy");
    DateTime convertedDate = format.parse(date);
    DateFormat formatter =  DateFormat('dd MMM. yyyy');
    String finalDate = formatter.format(convertedDate);
    return finalDate;
  }

  static String formatHHMM(String time) {
    /// 1. provide datetime formate in format variable
    /// 2. which formate of date or time get use formatter variable
    DateFormat format = DateFormat("EEEE, dd MMM yyyy");
    DateTime convertedTime = format.parse(time);
    DateFormat formatter =  DateFormat('dd MMM. yyyy');
    formatter = DateFormat.jm();
    String finalTime = formatter.format(convertedTime);
    return finalTime;
  }

}