import 'package:flutter/material.dart';
import 'package:fluttersnips/services/Datafetch/firebaseRepository.dart';

import '../../../Constants/AppColors.dart';

class MyCustomDialog extends StatefulWidget {
  const MyCustomDialog({Key? key}) : super(key: key);

  @override
  State<MyCustomDialog> createState() => _MyCustomDialogState();
}

class _MyCustomDialogState extends State<MyCustomDialog> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _widNameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String _selectedClass = 'Card';
  final List<String> _classOptions = ['Card', 'AnimatedContainer', 'ListView'];
  bool _isFormValid = false;

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    _widNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Details', style: TextStyle(color: primaryColor)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _widNameController,
            decoration: const InputDecoration(
              labelText: 'Widget Name',
              fillColor: primaryColor,
            ),
            onChanged: (_) => _validateForm(),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              fillColor: primaryColor,
            ),
            onChanged: (_) => _validateForm(),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: TextField(
                controller: _codeController,
                decoration: const InputDecoration(
                  labelText: 'Code',
                  fillColor: primaryColor,
                ),
                maxLines: null,
                onChanged: (_) => _validateForm(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedClass,
            items: _classOptions.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedClass = newValue!;
                _validateForm();
              });
            },
            decoration: const InputDecoration(
              labelText: 'Class',
              fillColor: primaryColor,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel', style: TextStyle(color: primaryColor)),
        ),
        ElevatedButton(
          onPressed: _isFormValid ? _submitForm : null,
          child: const Text('Submit', style: TextStyle(color: primaryColor)),
        ),
      ],
      // Disable the dialog's close button
      // barrierDismissible: false,
    );
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _widNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _codeController.text.isNotEmpty;
    });
  }

  void _submitForm() {
    final String email = _emailController.text;
    final String code = _codeController.text;
    final String classT = _selectedClass;
    final String widName = _widNameController.text;

    FirebaseRepository().saveCode(widName, email, code, classT);

     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You code has been submitted")));
    // Perform your desired action with the entered data

    Navigator.of(context).pop();
  }
}
