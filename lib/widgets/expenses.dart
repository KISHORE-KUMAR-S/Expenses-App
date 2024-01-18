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
    // Expense(
    //     title: 'Snacks',
    //     amount: 20,
    //     date: DateTime.now(),
    //     category: Category.food),
    // Expense(
    //     title: 'Bus Ticket',
    //     amount: 1153,
    //     date: DateTime.now(),
    //     category: Category.travel),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builderontext) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: NewExpense(onAddExpense: _addExpense),
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _expenses.indexOf(expense);
    setState(() {
      _expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense removed'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => setState(() {
            _expenses.insert(expenseIndex, expense);
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        'No expenses found. \nStart adding some!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );

    if (_expenses.isNotEmpty) {
      mainContent = Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(
              expenses: _expenses,
              onRemoveExpense: _removeExpense,
            ), //Must be expanded before building
          ),
        ],
      );
    }

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
      body: mainContent,
    );
  }
}
