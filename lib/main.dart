import 'package:address_book_practice/data/expense_data.dart';
import 'package:address_book_practice/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  //initial hive
  await Hive.initFlutter();

  //open a hive box
  await Hive.openBox('expense_database');
  runApp(ExpenseApps());
}

class ExpenseApps extends StatefulWidget {
  const ExpenseApps({Key? key}) : super(key: key);

  @override
  State<ExpenseApps> createState() => _ExpenseAppsState();
}

class _ExpenseAppsState extends State<ExpenseApps> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Address book',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
      ),
    );
  }
}
