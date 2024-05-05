import 'package:flutter/material.dart';
import 'package:nour_app/generated/l10n.dart';
import 'package:nour_app/widgets/localization_icon.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  State<NewAccount> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<NewAccount> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            padding: const EdgeInsets.all(8.0),
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
                ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fixedSize: const Size(166, 50),
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
    );
  }
}
