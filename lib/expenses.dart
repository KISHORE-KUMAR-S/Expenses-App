import 'package:expense_app/expenses_list.dart';
import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<StatefulWidget> {
  final List<Expense> _expenses = [
    Expense(
        title: 'Snacks',
        amount: 20,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Bus Ticket',
        amount: 1153,
        date: DateTime.now(),
        category: Category.travel),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Chart'),
            Expanded(
              child: ExpensesList(
                  expenses: _expenses), //Must be expanded before building
            ),
          ],
        ),
      ),
    );
  }
}
