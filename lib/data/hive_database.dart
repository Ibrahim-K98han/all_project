import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../models/expense_item.dart';

class HiveDatabase {
  //refresh your box
  final _myBox = Hive.box('expense_database');

  //write data
  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpenseFormatted = [];

    for (var expense in allExpense) {
      //convert each expenseItem into a list of storable types (strings, dateTime)
      List<dynamic> expenseFormtatted = [
        expense.name,
        expense.amount,
        expense.dateTime
      ];
      allExpenseFormatted.add(expenseFormtatted);
    }
    //finally lets store in our database
    _myBox.put('ALL_EXPENSES', allExpenseFormatted);
  }

  //read data
  List<ExpenseItem> readData() {
    List savedExpense = _myBox.get('ALL_EXPENSES') ?? [];
    List<ExpenseItem> allExpenses = [];

    for (int i = 0; i < savedExpense.length; i++) {
      //collect individual expense data
      String name = savedExpense[i][0];
      String amount = savedExpense[i][1];
      DateTime dateTime = savedExpense[i][2];

      //create expense item
      ExpenseItem expense =
          ExpenseItem(name: name, amount: amount, dateTime: dateTime);

      //add expense to overall list of expense
      allExpenses.add(expense);
    }
    return allExpenses;
  }
}
