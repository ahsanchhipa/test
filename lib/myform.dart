// import 'package:flutter/material.dart';
//
// import 'form.dart';
// import 'details.dart';
//
//
// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }
//
// class _MyFormState extends State<MyForm> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Registration'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   // You can add more validation for email format here
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   // You can add more validation for email format here
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   // You can add more validation for email format here
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Form is valid, process the data
//                     String name = _nameController.text;
//                     String email = _emailController.text;
//                     // You can now process the form data, e.g., submit to an API
//                     // or show a success message
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text('Registration Successful'),
//                           content: Text('Name: $name\nEmail: $email'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('Close'),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  // Define a list of random questions with their corresponding answers
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is your favorite color?',
      'answers': ['Red', 'Blue', 'Green', 'Yellow'],
    },
    {
      'question': 'What is your favorite animal?',
      'answers': ['Dog', 'Cat', 'Bird', 'Fish'],
    },
    {
      'question': 'What is your favorite food?',
      'answers': ['Pizza', 'Burger', 'Pasta', 'Sushi'],
    },
  ];

  // Variables to store selected answers
  Map<String, dynamic> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more validation for email format here
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              // Generate radio buttons for each question
              for (int i = 0; i < questions.length; i++) ...[
                Text(questions[i]['question']),
                Column(
                  children: [
                    for (int j = 0; j < questions[i]['answers'].length; j++)
                      RadioListTile(
                        title: Text(questions[i]['answers'][j]),
                        value: questions[i]['answers'][j],
                        groupValue: selectedAnswers[questions[i]['question']],
                        onChanged: (value) {
                          setState(() {
                            selectedAnswers[questions[i]['question']] = value;
                          });
                        },
                      ),
                  ],
                ),
              ],
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, process the data
                    String name = _nameController.text;
                    String email = _emailController.text;
                    // You can now process the form data, e.g., submit to an API
                    // or show a success message
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Registration Successful'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Name: $name\nEmail: $email'),
                              for (var entry in selectedAnswers.entries)
                                Text('${entry.key}: ${entry.value}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}










