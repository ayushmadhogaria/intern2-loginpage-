import 'package:flutter/material.dart';
import 'package:intern/register.dart';
import 'email.dart';
import 'CurvePath.dart';
import 'LoginButton.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: MyCustomForm(),
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String displayEmail = "";
  String displayPass = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const CurvePath(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, right: 10, left: 10),
            child: Email(emailController: _emailController),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: TextFormField(
              controller: _passwordController,
              obscureText: isHiddenPassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
                prefixIcon: const Icon(Icons.password),
                suffixIcon: InkWell(
                  onTap: _togglePasswordView,
                  child: const Icon(
                    Icons.visibility,
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: (String passValue) {},
              validator: (String? passValue) {
                if (passValue != null && passValue.isEmpty) {
                  return "Password can't be empty";
                } else if (passValue!.length < 6) {
                  return "Password must be atleast 6 digit long.";
                } else {
                  return null;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: LoginButton(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HaventRegistered(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: const Text(
                "Haven't registerted? Sign Up",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
