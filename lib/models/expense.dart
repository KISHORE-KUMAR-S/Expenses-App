import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

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
