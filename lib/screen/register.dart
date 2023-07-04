import 'package:flutter/material.dart';
import 'package:flutter_mountrip/screen/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Signin());
}

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          // Tambahkan SingleChildScrollView di sini
          child: Padding(
            padding: EdgeInsets.only(left: 33, right: 40, top: 187),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'Mountrip',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff284677),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Center(
                  child: Text(
                    'Explore a Wonderful Indonesia',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff284677),
                    ),
                  ),
                ),
                SizedBox(
                  height: 66,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Color(0xff6787BC),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Color(0xff6787BC),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Color(0xff6787BC),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 24.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginApp(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 54,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff274674),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Center(
                      child: Image.asset(
                    'assets/mountain2.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
