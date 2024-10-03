import 'package:exp_yabets/widget/chart/chart.dart';
import 'package:exp_yabets/widget/expenses_list/expenses_list.dart';
import 'package:exp_yabets/widget/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:exp_yabets/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'flutter course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'cinema',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];
// this showmodal makes a modal page apear
  void _openaddExpense() {
    showModalBottomSheet(
      //usesafearea make user our ui is set in inspect of the device hardware like the camera position and stuff
      //but scafolld usesafearea by default
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(
      () {
        _registeredExpenses.remove(expense);
      },
    );
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // it clears the pop undo message instantly
// this scaffold messanger shows message or a simple notification it also takes the action property to add buttons
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex,
                  expense); // the list we are undoing and the list item we want back
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Widget maincontent = const Center(
      child: Text('No expenses so far'),
    );
    if (_registeredExpenses.isNotEmpty) {
      maincontent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Yabx Expense Tracker')),
          actions: [
            IconButton(
              onPressed: _openaddExpense,
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: width < 600
            ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(child: maincontent)
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Chart(expenses: _registeredExpenses),
                  ),
                  Expanded(child: maincontent)
                ],
              ));
  }
}
