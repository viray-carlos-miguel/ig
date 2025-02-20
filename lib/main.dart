import 'package:flutter/cupertino.dart';
import 'package:ig/Homepage.dart';

void main() {
  runApp(CupertinoApp(
    theme: CupertinoThemeData(brightness: Brightness.dark),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool hidePassword = false;
  String error = "";

  bool isLogin(String username, String password) {
    if (username == "admin" && password == "123") {
      setState(() {
        _username.text = "";
        _password.text = "";
        error = "";
      });
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),

              // Logo Image
              Image.asset(
                "assets/img/iglogo.png", // Ensure this image exists in your assets folder
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 60),

              // Rounded Username TextField
              CupertinoTextField(
                controller: _username,
                placeholder: "Username, email or mobile number",
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.secondarySystemFill),
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              SizedBox(height: 10),

              // Rounded Password TextField
              CupertinoTextField(
                controller: _password,
                placeholder: "Password",
                padding: EdgeInsets.all(13),
                obscureText: hidePassword,
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemFill),
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(30),
                ),
                suffix: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    hidePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    size: 20,
                    color: CupertinoColors.systemGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },

                ),
              ),

              SizedBox(height: 20),

              // Rounded Login Button
              Container(
                width: double.maxFinite,
                child: CupertinoButton(
                  color: CupertinoColors.systemBlue,
                  borderRadius: BorderRadius.circular(30),
                  child: Text(
                    'Log in',
                    style: TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    isLogin(_username.text, _password.text)
                        ? Navigator.push(context, CupertinoPageRoute(builder: (context) => Homepage()))
                        : setState(() {
                      _password.text = "";
                      error = "Incorrect username or password";
                    });
                  },

                ),
              ),
              SizedBox(height: 20),
              Text("Forgot password?",
              style: TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Error Message
              Text(
                "$error",
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ),

              Spacer(), // Pushes the "Create New Account" button to the bottom

              // Create New Account Button (Border Only)
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemBlue, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 12), // Adjust padding
                  child: Text(
                    "Create New Account",
                    style: TextStyle(color: CupertinoColors.systemBlue, fontWeight: FontWeight.bold), // Green text
                  ),
                  onPressed: () {
                    // Navigate to Sign-Up Page
                  },
                  color: CupertinoColors.transparent, // No background color
                ),
              ),

              SizedBox(height: 30),
              Text('Meta',style: TextStyle(color: CupertinoColors.systemGrey,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
