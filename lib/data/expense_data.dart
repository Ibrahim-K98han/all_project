import 'package:flutter/material.dart';

import '../models/expense_item.dart';

class ExpenseData {
  //list of all expense
  List<ExpenseItem> overallExpenseList = [];

  //get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  //add new expense
  void addNewExpense(ExpenseItem newExpanse) {
    overallExpenseList.add(newExpanse);
  }

  //delete expense
  void deleteExpense(ExpenseItem expanse) {
    overallExpenseList.remove(expanse);
  }

  //get weekday (mon, tues, etc) from a dateTime object
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  //get the date for the start of the week (sunday)
  DateTime startOfWeekDate(){
    DateTime? startOfWeek;

    //get todays date
    DateTime today = DateTime.now();

    //go backwards from today to find sunday
    for(int i=0; i<7; i++){
      if(getDayName(today.subtract(Duration(days: i))) == 'Sun'){
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  Map<String, double>calculateDailyExpenseSummary(){
    Map<String, double>dailyExpenseSummary = {

    };
  }
}
