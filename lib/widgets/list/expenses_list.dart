import 'package:expense_app/models/expense.dart';
import 'package:expense_app/widgets/list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ExpensesItem(expenses: expenses[index]),
      itemCount: expenses.length,
    );
  }
}
