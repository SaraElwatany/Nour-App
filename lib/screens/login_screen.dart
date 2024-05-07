// import 'package:flutter/material.dart';
// import 'package:nour_app/generated/l10n.dart';
// import 'package:nour_app/widgets/localization_icon.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const LocalizationIcon(),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Theme.of(context).colorScheme.primary,
//               Theme.of(context).colorScheme.secondary,
//             ],
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     S.of(context).sign_in,
//                     style: const TextStyle(
//                       fontSize: 40,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 135, 110, 136),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         hintText: S.of(context).email,
//                         border: InputBorder.none,
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 135, 110, 136),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         hintText: S.of(context).password,
//                         border: InputBorder.none,
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         String email = _emailController.text;
//                         String password = _passwordController.text;
//                         // back
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       fixedSize: const Size(128, 55),
//                       backgroundColor: Theme.of(context).colorScheme.surface,
//                     ),
//                     child: Text(
//                       S.of(context).confirm,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 255, 251, 251),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:nour_app/generated/l10n.dart';
import 'package:nour_app/apis/apis.dart';
import 'package:nour_app/screens/hopeful_and_calm.dart';
import 'package:nour_app/widgets/localization_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Send data & then wait for the response either to go to main page or try again
      String response = await sendData(email, password);

      if (response == 'Access Allowed') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const HopefulAndCalm()));
      } else if (response == 'Access Denied') {
        login_warning(context);
      }
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
                    S.of(context).sign_in,
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
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: S.of(context).email,
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).email_validation;
                          }
                          email = value;
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
                          if (value == null || value.isEmpty) {
                            return S.of(context).password_validation;
                          }
                        password = value;
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveItem,
                    /*onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        email = _emailController.text;
                        password = _passwordController.text;
                        // back
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
