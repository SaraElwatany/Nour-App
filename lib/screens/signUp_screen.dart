// import 'package:flutter/material.dart';
// import 'package:nour_app/generated/l10n.dart';
// import 'package:nour_app/widgets/localization_icon.dart';

// class NewAccount extends StatefulWidget {
//   const NewAccount({Key? key}) : super(key: key);

//   @override
//   State<NewAccount> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<NewAccount> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//     _ageController.dispose();
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
//                     S.of(context).new_account,
//                     style: const TextStyle(
//                       fontSize: 40,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 266,
//                     height: 55,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 135, 110, 136),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: TextFormField(
//                         controller: _nameController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           hintText: S.of(context).name,
//                           border: InputBorder.none,
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return S.of(context).name_validation;
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 266,
//                     height: 55,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 135, 110, 136),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: TextFormField(
//                         controller: _ageController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           hintText: S.of(context).age,
//                           border: InputBorder.none,
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return S.of(context).age_validation;
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 266,
//                     height: 55,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 135, 110, 136),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: TextFormField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           hintText: S.of(context).email,
//                           border: InputBorder.none,
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return S.of(context).email_validation;
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 266,
//                     height: 55,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 135, 110, 136),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: TextFormField(
//                         controller: _passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           hintText: S.of(context).password,
//                           border: InputBorder.none,
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return S.of(context).password_validation;
//                           }
//                           return null;
//                         },
//                       ),
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
import 'package:nour_app/widgets/localization_icon.dart';

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
                          if (value == null || value.isEmpty) {
                            return S.of(context).email_validation;
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
                          if (value == null || value.isEmpty) {
                            return S.of(context).password_validation;
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        // Handle form submission
                      }
                    },
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
