import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Local Host For ios Emulator => http://127.0.0.1:19999
// Local Host For Android Emulator => http://10.0.2.2:19999
// Local Host For Windows => http://127.0.0.1:19999
// Local Host For Chrome => http://localhost:58931  120.0.6099.111
// https://nour-app-cllt.onrender.com

// Function that sends the username and password to the flask backend (return type as future object with no value == The function completes without returning any value)
Future<String> sendData(String email, String password) async {
  String url = 'https://nour-app-cllt.onrender.com/login';
  var request = await http.post(Uri.parse(url), body: {
    'email': email,
    'password': password,
  });

  if (request.statusCode == 200 ||
      request.statusCode == 201 ||
      request.statusCode == 204) {
    print(
        'Received a successful response (Status Code: ${request.statusCode})');

    // Request successful, handle the response (valid http response was received == okay statement for http)
    final responseData = jsonDecode(request.body);
    final responseMessage = responseData['response'];

    print('Received response: $responseMessage');

    if (responseMessage == 'Access Allowed') {
      /* userId = responseData['user_id'];
      print('User ID from Login Route: $userId');
      UserProfession = responseData['user_profession'];*/

      print('Login successful');
      // print('Profession: $UserProfession');

      return 'Access Allowed';
    } else {
      print('Login Failed due to incorrect email or password');
      return 'Access Denied';
    }
  } else if (request.statusCode == 400) {
    // Bad Request
    print(
        'Bad Request: The server could not understand the request (Status Code: 400)');
    print('Response Body: ${request.body}');
    return 'Access Denied';
  } else if (request.statusCode == 401) {
    // Unauthorized
    print(
        'Unauthorized: The request requires user authentication (Status Code: 401)');
    print('Response Body: ${request.body}');
    return 'Access Denied';
  } else if (request.statusCode == 403) {
    // Forbidden
    print(
        'Forbidden: The server understood the request but refuses to authorize it (Status Code: 403)');
    print('Response Body: ${request.body}');
    return 'Access Denied';
  } else if (request.statusCode == 404) {
    // Not Found
    print(
        'Not Found: The requested resource could not be found (Status Code: 404)');
    print('Response Body: ${request.body}');
    return 'Access Denied';
  } else if (request.statusCode == 500) {
    // Internal Server Error
    print(
        'Internal Server Error: A generic error occurred on the server (Status Code: 500)');
    print('Response Body: ${request.body}');
    return 'Access Denied';
  } else {
    // Request failed, handle the error
    print('Login failed due to failed request');
    print('Response Body: ${request.body}');
    // Other status codes
    print(
        'Received an unexpected response with status code: ${request.statusCode}');
    return 'Access Denied';
  }
}

// Function to pop up a warning whenever the user enters wrong login information
void login_warning(context) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: const Text('Invalid Input'),
            content: const Text(
              'Please Enter a valid username or password',
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

// Function to sign up an account
Future<String> signUp(String username, String email, String password,
    String age, String gender) async {
  var url = 'https://nour-app-cllt.onrender.com/signup'; //

  print('Before Request');
  print('Email: ${email}');
  print('Age: ${age}');
  print('Gender: ${gender}');
  print('Password: ${password}');

  var request = await http.post(Uri.parse(url), body: {
    'username': username,
    'email': email,
    'password': password,
    'gender': gender,
    'age': age,
  });
  print('After Request');

  if (request.statusCode == 200 ||
      request.statusCode == 201 ||
      request.statusCode == 204) {
    print(
        'Received a successful response (Status Code: ${request.statusCode})');

    // Request successful, handle the response (valid http response was received == okay statement for http)
    var responseData = jsonDecode(request.body);
    var responseMessage = responseData['response'];
    print('Received response: $responseMessage');

    if (responseMessage == 'Failed Password and Email') {
      print('Sign up Failed due to wrong password and email');
      return 'Sign up Denied due to password & email';
    } else if (responseMessage == 'Failed Password') {
      print('Sign up Failed due to wrong password');
      return 'Sign up Denied due to password';
    } else if (responseMessage == 'Failed Email') {
      print('Sign up Failed due to wrong email format');
      return 'Sign up Denied due to email';
    } else if (responseMessage == 'Failed: Email already exists') {
      print('Sign up failed, an account with this email already exists');
      return 'Sign up Denied due to duplicate email';
    } else {
      // Request was successful, and the info was correct => Sign Up
      print('Sign up was successful');
      return 'Sign up Allowed';
    }
  } else if (request.statusCode == 400) {
    // Bad Request
    print(
        'Bad Request: The server could not understand the request (Status Code: 400)');
    print('Response Body: ${request.body}');
    return 'Access Denied';
  } else if (request.statusCode == 401) {
    // Unauthorized
    print(
        'Unauthorized: The request requires user authentication (Status Code: 401)');
    print('Response Body: ${request.body}');
    return 'Access Denied';
  } else if (request.statusCode == 403) {
    // Forbidden
    print(
        'Forbidden: The server understood the request but refuses to authorize it (Status Code: 403)');
    print('Response Body: ${request.body}');
    return 'Access Denied';
  } else if (request.statusCode == 404) {
    // Not Found
    print(
        'Not Found: The requested resource could not be found (Status Code: 404)');
    print('Response Body: ${request.body}');
    return 'Access Denied';
  } else if (request.statusCode == 500) {
    // Internal Server Error
    print(
        'Internal Server Error: A generic error occurred on the server (Status Code: 500)');
    print('Response Body: ${request.body}');
    return 'Access Denied';
  } else {
    // Request failed, handle the error
    print('Sign up failed due to failed request');
    print('Response Body: ${request.body}');
    // Other status codes
    print(
        'Received an unexpected response with status code: ${request.statusCode}');
    return 'Sign up Failed';
  }
}

// Future<String> obtainScores(List<String> selected_options) async {
//   String url = 'https://nour-app-cllt.onrender.com/quiz';
//   List<String> options;
//   options = selected_options;

//   // Get the scores from the selected options (list of strings/options)

//   int score = 67; // placeholder for the to-be computed score
//   var request = await http.post(Uri.parse(url), body: {
//     'score': score,
//     // 'password': password,
//   });

//   if (request.statusCode == 200 ||
//       request.statusCode == 201 ||
//       request.statusCode == 204) {
//     print(
//         'Received a successful response (Status Code: ${request.statusCode})');

//     // Request successful, handle the response (valid http response was received == okay statement for http)
//     final responseData = jsonDecode(request.body);
//     final responseMessage = responseData['response'];

//     print('Received response: $responseMessage');

//     // Ensure that a value is always returned
//     return 'Access Allowed';
//   } else if (request.statusCode == 400) {
//     // Bad Request
//     print(
//         'Bad Request: The server could not understand the request (Status Code: 400)');
//     print('Response Body: ${request.body}');
//     return 'Access Denied';
//   } else if (request.statusCode == 401) {
//     // Unauthorized
//     print(
//         'Unauthorized: The request requires user authentication (Status Code: 401)');
//     print('Response Body: ${request.body}');
//     return 'Access Denied';
//   } else if (request.statusCode == 403) {
//     // Forbidden
//     print(
//         'Forbidden: The server understood the request but refuses to authorize it (Status Code: 403)');
//     print('Response Body: ${request.body}');
//     return 'Access Denied';
//   } else if (request.statusCode == 404) {
//     // Not Found
//     print(
//         'Not Found: The requested resource could not be found (Status Code: 404)');
//     print('Response Body: ${request.body}');
//     return 'Access Denied';
//   } else if (request.statusCode == 500) {
//     // Internal Server Error
//     print(
//         'Internal Server Error: A generic error occurred on the server (Status Code: 500)');
//     print('Response Body: ${request.body}');
//     return 'Access Denied';
//   } else {
//     // Request failed, handle the error
//     print('Loading Quiz Output failed due to failed request');
//     print('Response Body: ${request.body}');
//     // Other status codes
//     print(
//         'Received an unexpected response with status code: ${request.statusCode}');
//     return 'Access Denied';
//   }
// }

// In apis.dart
Future<String> obtainScores(int score) async {
  String url = 'https://nour-app-cllt.onrender.com/quiz';

  var request = await http.post(Uri.parse(url), body: {
    'score': score.toString(),
  });

  print("Score: ${score.toString()}");

  if (request.statusCode == 200) {
    var responseData = jsonDecode(request.body);
    var responseMessage = responseData['message'];
    print('Received response: $responseMessage');

    return responseMessage;
  } else {
    print('Error: ${request.statusCode}, Body: ${request.body}');
    return 'Error: Status code ${request.statusCode}';
  }
}
