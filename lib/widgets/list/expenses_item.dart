import 'package:expense_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expenses});

  final Expense expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenses.title,
              // style: Theme.of(context)
              //     .textTheme
              //     .titleLarge
              //     ?.copyWith(color: Colors.black),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                const Icon(Icons.currency_rupee, size: 15.0),
                Text(expenses.amount.toStringAsFixed(2)),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expenses.category]),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      expenses.formattedDate,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
