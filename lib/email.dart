import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  const Email({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Email',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
      validator: (emailValue) {
        if (emailValue == null || emailValue.isEmpty) {
          return 'Email is compulsary.';
        }
        return null;
      },
    );
  }
}
