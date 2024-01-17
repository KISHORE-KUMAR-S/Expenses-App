import 'package:expense_app/widgets/list/expenses_list.dart';
import 'package:expense_app/models/expense.dart';
import 'package:expense_app/widgets/new_expenses.dart';
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (builderontext) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: NewExpense(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          ),
        ],
        title: const Text('Expense Tracker'),
        elevation: 0.5,
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(
                expenses: _expenses), //Must be expanded before building
          ),
        ],
      ),
    );
  }
}
