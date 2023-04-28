import 'package:address_book_practice/components/expense_summary.dart';
import 'package:address_book_practice/components/expense_tile.dart';
import 'package:address_book_practice/data/expense_data.dart';
import 'package:address_book_practice/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controllers
  final newExpenseNameController = TextEditingController();
  final newExpenseDollarController = TextEditingController();
  final newExpenseCentsController = TextEditingController();

  @override
  void initState() {
   Provider.of<ExpenseData>(context, listen: false).prepareData();
    super.initState();
  }

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
                    decoration: InputDecoration(
                      hintText: 'Expense Name'
                    ),
                  ),
                  Row(
                    children: [
                      //dollers
                      Expanded(
                        child: TextField(
                          controller: newExpenseDollarController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Dollars'
                          ),
                        ),
                      ),

                      //cents
                      Expanded(
                        child: TextField(
                          controller: newExpenseCentsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Cents'
                          ),
                        ),
                      )
                    ],
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
  void save() {
    //put dollars and cents together
    String amount = '${newExpenseDollarController.text}.${newExpenseCentsController.text}';
    //create expense item
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: amount,
      dateTime: DateTime.now(),
    );
    //add the new expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
    Navigator.pop(context);
    clear();
  }

  //cancel
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  //clear controller
  void clear() {
    newExpenseNameController.clear();
    newExpenseDollarController.clear();
    newExpenseCentsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(builder: (context, value, child) {
      return Scaffold(
          backgroundColor: Colors.grey[300],
          floatingActionButton: FloatingActionButton(
            onPressed: addNewExpense,
            backgroundColor: Colors.black,
            child: Icon(Icons.add),
          ),
          body: ListView(
            children: [
              //weekly summary
              ExpenseSummary(startOfWeek: value.startOfWeekDate()),
              SizedBox(height: 20,),
              //expense list
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: value.getAllExpenseList().length,
                itemBuilder: (context, index) {
                  return ExpenseTile(
                      name: value.getAllExpenseList()[index].name,
                      amount: value.getAllExpenseList()[index].amount,
                      dateTime: value.getAllExpenseList()[index].dateTime);
                },
              ),
            ],
          )
      );
    });
  }
}
