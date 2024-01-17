import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const TextField(
          maxLength: 45,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'Title',
            prefixIcon: Icon(Icons.title),
          ),
        ),
        Row(
          children: [
            const Spacer(),
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
