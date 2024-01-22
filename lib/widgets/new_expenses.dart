import 'package:flutter/material.dart';
import 'package:expense_app/models/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1752),
      lastDate: DateTime.now(),

      //Custom theme for Date Picker

      // builder: (context, child) {
      //   return Theme(
      //     data: ThemeData.light().copyWith(
      //       primaryColor: Colors.deepPurple,
      //       colorScheme: const ColorScheme.light(primary: Colors.deepPurple),
      //       buttonTheme:
      //           const ButtonThemeData(textTheme: ButtonTextTheme.normal),
      //     ),
      //     child: child!,
      //   );
      // },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 16, 0, keyBoardSpace),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 45,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.currency_rupee_rounded),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Row(
                  children: [
                    Text(_selectedDate == null
                        ? 'No date selected'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Select Category'),
                const Spacer(),
                DropdownButton(
                  value: _selectedCategory,
                  icon: const Icon(Icons.arrow_downward_rounded),
                  elevation: 0,
                  underline: Container(
                    color: Colors.black,
                    height: 1,
                  ),
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
