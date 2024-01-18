import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat('dd-MM-yyyy');

enum Category { food, travel, education, work, leisure }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.travel_explore,
  Category.education: Icons.school_rounded,
  Category.work: Icons.work,
  Category.leisure: Icons.movie_creation_outlined,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id, title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expensesList});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expensesList = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expensesList;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expensesList) {
      sum += expense.amount;
    }

    return sum;
  }
}
