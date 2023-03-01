import 'package:flutter/material.dart';
import 'package:forme/forme.dart';
import 'package:forme_base_fields/field/material/forme_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FormeKey _formKey = FormeKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Forme(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FormeTextField(
                name: "email",
                validator: FormeValidates.notEmpty(
                    errorText: 'Email should not empty'),
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              FormeTextField(
                name: "password",
                obscureText: true,
                validator: FormeValidates.notBlank(
                    errorText: 'Password should not empty'),
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: FormeValidationListener(
                  builder: (context, validation, child) {
                    return ElevatedButton(
                        onPressed: validation.isValid
                            ? () {
                                if (_formKey.validation.isValid) {
                                  var email = _formKey
                                      .field<FormeFieldState<String>>("email")
                                      .value;
                                  var password = _formKey
                                      .field<FormeFieldState<String>>(
                                          "password")
                                      .value;
                                  print(email);
                                  print(password);
                                }
                              }
                            : null,
                        child: Text("Submit"));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
