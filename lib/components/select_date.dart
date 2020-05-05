import 'package:flutter/material.dart';

DateTime datePicked;
DateTime selectDate;
DateTime currentDate = DateTime.now();

Future<DateTime> selectedDate(BuildContext context) async {
  datePicked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030));

  return datePicked;
}