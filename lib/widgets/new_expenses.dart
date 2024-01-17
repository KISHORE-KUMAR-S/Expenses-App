import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<StatefulWidget> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? selectedDate;

  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1752),
      lastDate: DateTime.now(),
      switchToInputEntryModeIcon: const Icon(Icons.edit_calendar_sharp),
    );

    setState(() {
      selectedDate = pickedDate!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextField(
          controller: _titleController,
          maxLength: 45,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelText: 'Title',
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
                  prefixIcon: Icon(Icons.currency_rupee_rounded),
                ),
              ),
            ),
            Row(
              children: [
                Text(selectedDate == null
                    ? 'No date selected'
                    : formatter.format(selectedDate!)),
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
              onPressed: () {},
              child: const Text('Save'),
            ),
          ],
        )
      ],
    );
  }
}
