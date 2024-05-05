// import 'package:flutter/material.dart';
// import 'package:nour_app/generated/l10n.dart';
// import 'package:nour_app/widgets/localization_icon.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   late TextEditingController _emailController;
//   late TextEditingController _passwordController;

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//   }

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
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   S.of(context).sign_in,
//                   style: const TextStyle(
//                     fontSize: 40,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.surface,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: TextField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       hintText: 'Email',
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.surface,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: TextField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     String email = _emailController.text;
//                     String password = _passwordController.text;
//                     // Implement your sign-in functionality here
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     fixedSize: const Size(166, 50),
//                     backgroundColor: Theme.of(context).colorScheme.surface,
//                   ),
//                   child: Text(
//                     S.of(context).confirm,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       color: Color.fromARGB(255, 255, 251, 251),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:nour_app/generated/l10n.dart';
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
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 135, 110, 136),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 135, 110, 136),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        // back
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
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
      ),
    );
  }
}
