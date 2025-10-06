import 'package:intl/intl.dart';

class NumberFormatter {
  static String number(double number) {
    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    ).format(int.parse(number.toString().replaceAll('.', '')));
  }

  static String formatDate(String date) {
    final DateTime dt = DateTime.parse(date);
    return DateFormat('MMM dd, yyyy').format(dt);
  }
}
