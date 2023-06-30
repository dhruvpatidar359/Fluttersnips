import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttersnips/services/Datafetch/firebaseRepository.dart';
import 'package:fluttersnips/services/auth/AuthRepository.dart';

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
  final List<String> _classOptions = [ 'Container',
  'Row',
  'Column',
  'Text',
  'TextField',
  'Button',
  'TextButton',
  'ElevatedButton',
  'IconButton',
  'AppBar',
  'Image',
  'ListView',
  'GridView',
  'Card',
  'ExpansionPanel',
  'AlertDialog',
  'BottomSheet',
  'Drawer',
  'SnackBar',
  'CircularProgressIndicator',
  'LinearProgressIndicator',
  'Checkbox',
  'Radio',
  'Switch',
  'DropdownButton',
  'Slider',
  'DatePicker',
  'TimePicker',
  'Stack',
  'Positioned',
  'Align',
  'Wrap',
  'Spacer',
  'InkWell',
  'GestureDetector',
  'Opacity',
  'AnimatedContainer',
  'Hero',
  'ClipRRect',
  'IndexedStack',
  'PageView',
  'Tooltip',
  'RichText',
  'DataTable',
  'Stepper',
  'TabBar',
  'SnackBar',
  'WebView',
  'VideoPlayer',];
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
            width: MediaQuery.of(context).size.width * (3 / 4),
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

  void _submitForm() async {
    final String email = _emailController.text;
    final String code = _codeController.text;
    final String classT = _selectedClass;
    final String widName = _widNameController.text;

    FirebaseRepository().saveCode(widName, email, code, classT);
    if(authRepositoryInstance.name != null) {
       await authRepositoryInstance
        .increaseContriCount(authRepositoryInstance.uid.toString());

    }
   
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,

      behavior: SnackBarBehavior.fixed,

      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'YAY,Contributed!',
        message: 'You code has been submitted!',
        messageFontSize: 15,
        titleFontSize: 20,
        color: Colors.green.shade700,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);

    // Perform your desired action with the entered data

    Navigator.of(context).pop();
  }
}
