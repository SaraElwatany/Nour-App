import 'package:flutter/material.dart';
import 'package:nour_app/generated/l10n.dart';
import 'package:nour_app/widgets/localization_icon.dart';

import 'package:nour_app/screens/hopeful_and_calm.dart';
import 'package:nour_app/apis/apis.dart';

String username = '';
String email = '';
String password = '';
String gender = '';
String age = '';
var output = '';

class NewAccount extends StatefulWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  State<NewAccount> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<NewAccount> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender;

  void _saveItem() async {
    print('Entered SaveItem Function');
    output = await signUp(username, email, password, age, gender);

    if ((_formKey.currentState!.validate()) && (output == 'Sign up Allowed')) {
      _formKey.currentState!.save();

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const HopefulAndCalm()));
    } else {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                  'Please fill in all required fields correctly',
                ),
                backgroundColor: Colors.white,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: Text(
                      'Okay',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LocalizationIcon(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).new_account,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 266,
                    height: 55,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 135, 110, 136),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _nameController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: S.of(context).name,
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).name_validation;
                          }
                          username = value;
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 266,
                    height: 55,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 135, 110, 136),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _ageController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: S.of(context).age,
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).age_validation;
                          }
                          age = value;
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 266,
                    height: 55,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 135, 110, 136),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: S.of(context).email,
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          email = _emailController.text;
                          if (value == null || value.isEmpty) {
                            return S.of(context).email_validation;
                          }
                          if (output == 'Sign up Denied due to email') {
                            return 'Please enter a valid Email';
                          }
                          if (output ==
                              'Sign up Denied due to password & email') {
                            return 'Please enter a valid Email';
                          }
                          if (output ==
                              'Sign up Denied due to duplicate email') {
                            return 'An account with this Email already exist';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 266,
                    height: 55,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 135, 110, 136),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: S.of(context).password,
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          password = _passwordController.text;
                          if (value == null || value.isEmpty) {
                            return S.of(context).password_validation;
                          }

                          if (output == 'Sign up Denied due to password') {
                            return 'Please Enter a Valid Password Format';
                          }

                          if (output ==
                              'Sign up Denied due to password & email') {
                            return 'Please Enter a Valid Password Format';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 266,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ToggleButtons(
                      isSelected: [
                        _selectedGender == 'Male',
                        _selectedGender == 'Female',
                      ],
                      onPressed: (int newIndex) {
                        setState(() {
                          _selectedGender = newIndex == 0 ? 'Male' : 'Female';
                        });
                        gender = _selectedGender.toString();
                      },
                      selectedColor: Colors.white, // Color for selected option
                      color: Colors.white, // Color for unselected options
                      fillColor: Colors
                          .transparent, // Color behind the selected options
                      borderRadius: BorderRadius.circular(20),
                      children: [
                        Container(
                          width: 130,
                          height: 55,
                          color: _selectedGender == 'Male'
                              ? const Color.fromARGB(255, 112, 79, 111)
                              : const Color.fromARGB(255, 135, 110, 136),
                          child: Center(child: Text(S.of(context).male)),
                        ),
                        Container(
                          width: 133,
                          height: 55,
                          color: _selectedGender == 'Female'
                              ? const Color.fromARGB(255, 112, 79, 111)
                              : const Color.fromARGB(255, 135, 110, 136),
                          child: Center(child: Text(S.of(context).female)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveItem,
                    /*onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        email = _emailController.text;
                        password = _passwordController.text;
                        // Handle form submission
                        print('First Flag');
                        _saveItem;
                      }
                    },*/
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(128, 55),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    ),
                    child: Text(
                      S.of(context).confirm,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 251, 251),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
