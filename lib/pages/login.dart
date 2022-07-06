import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/User.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  GlobalKey<FormState>? _key;

  // var isFirstHover = false,isSecondHover = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _key = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) =>
                    value!.isEmpty ? "This field is required" : null,
                keyboardType: TextInputType.text,
                // inputFormatters: <TextInputFormatter>[
                //   FilteringTextInputFormatter.allow(RegExp(r'^\w+@\w+.com$')),
                // ],
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'Email',
                  icon: const Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value) =>
                    value!.isEmpty ? "This field is required" : null,
                keyboardType: TextInputType.text,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'Password',
                  icon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: login,
                child: const Text('L O G I N'),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 40),
                child: Column(
                  children: [
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              print('Forgot Clicked');
                            },
                            child: const Text(
                              'Forgot your password?',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              print('Create New Clicked');
                            },
                            child: const Text(
                              'Create new',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 120,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                onPressed: () {
                  //Navigate back to splashy
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.settings_backup_restore_sharp),
                    Text(
                      'Back to Splashy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    //TODO: how to use a RegExp pattern in FLutter
    //TODO: how to make password hiddable text
    //Check if all are valid
    if (_key!.currentState!.validate()) {
      //all inputs are filled correctly

      var email = _emailController!.value.text;
      var password = _passwordController!.value.text;
      User user = User(email: email, password: password);

      //TODO: It should check for the user credentials but skip for now

      SharedPreferences? prefs;
      //Save in sharedPrefs
      SharedPreferences.getInstance().then((value) {
        print('Just for debugging');

        prefs = value;
        prefs!.setString('USER', user.toJson().toString());
        prefs!.setBool('IS_LOGGED_IN', true);

        Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
        // Navigator.pushNamed(context, '/home', arguments: user);
      });
    }
  }
}
