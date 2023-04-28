import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controllers
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  //add new expense
  void addNewExpense() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Add new expense'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //expense name
                  TextField(
                    controller: newExpenseNameController,
                  ),

                  //expense amount
                  TextField(
                    controller: newExpenseAmountController,
                  )
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: save,
                  child: Text('SAVE'),
                ),
                MaterialButton(
                  onPressed: cancel,
                  child: Text('CANCEL'),
                )
              ],
            ));
  }

  //save
  void save(){}

  //cancel
  void cancel(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        child: Icon(Icons.add),
      ),
    );
  }
}
