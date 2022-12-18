import 'package:flutter/material.dart';
import 'login.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, bottom: 7),
      child: SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        login(_emailController.text, _passwordController.text),
                  ));
            }
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.blue),
          ),
          child: const Text(
            'Log In',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
