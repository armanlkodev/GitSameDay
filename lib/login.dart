import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:samedaypro/page/dashboard.dart';

class MyLogin extends StatefulWidget {
  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _isLoading = false;

  final TextEditingController UsernameController = new TextEditingController();
  final TextEditingController PasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> login() async {
      var token = "Eprg5Y7quYyq9JxiIJYaMYiDzPW3L_vajxu2-A5JWV8RonE46lhR1_9m-P__w2Tb8dLdVH7NnuzPVA0JddzCYQmicAQKD6rRfZsE9HkPnhFbydpyMe4hU4yQVzqoOdm5Om3masEYPj0WbD-9dLByhsHKX2bBoe7O8vlk4CSSIuHkOk7HEQtX_DvRoj_3rhmVVbYmrR9KLZ_OG3MyTZHj5beyIo3dnHX82WkjEdNol3_k4OeE-YNomCc3jmItdBIh";
      if (PasswordController.text.isNotEmpty &&
          UsernameController.text.isNotEmpty) {
        var response =
            await http.post(Uri.parse("https://localhost:44341/login"),
                encoding: Utf8Codec(),
                headers: {
                  "Content-Type": "application/json",
                  "Accept": "application/json",
                  "Access-Control_Allow_Origin": "true",
                  'Authorization': 'Bearer ${token}',
                  'Access-Control-Allow-Credentials': 'true',
                  'Access-Control-Allow-Headers': 'Content-Type',
                  'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
                },
                body: json.encode({
                  'username': UsernameController.text,
                  'password': PasswordController.text,
                  'grant_type': 'password',
                }));

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body.toString());
          print(data);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response.body)));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(" Please Enter your details")));
      }
    }

    // signIn(String Username, String Password) async {
    //
    //
    //   HttpOverrides.global = MyHttpOverrides();
    //   String baseUrl = "https://localhost:44341/login";
    //   var jsonResponse = null;
    //   Map body = {
    //     'username': Username,
    //     'password': Password,
    //   };
    //   var response = await http.post(Uri.parse(baseUrl),
    //     encoding:Utf8Codec(),
    //     headers:<String,String>{
    //       'Content-Type': "application/json",
    //       'Accept': 'application/json',
    //       'Access-Control-Allow-Origin': '*',
    //       'Access-Control-Allow-Credentials': 'true',
    //       'Access-Control-Allow-Headers': 'Content-Type',
    //       'Access-Control-Allow-Methods':
    //       'GET,PUT,POST,DELETE'
    //     },
    //   body: json.encode(body));
    //   if(response.statusCode == 200) {
    //     var data = jsonDecode(response.body.toString());
    //     print(data);
    //     jsonResponse = json.decode(response.body);
    //     if(jsonResponse != null) {
    //       setState(() {
    //         _isLoading = false;
    //       });
    //       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Dashboard()),
    //       (Route<dynamic> route) => false);
    //     }
    //   }
    //   else {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //     print(response.body);
    //   }
    // }

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Login1.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4,
                    right: 35,
                    left: 35),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: UsernameController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          prefixIcon: Icon(Icons.account_circle_outlined),
                          hintText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.orange,
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: PasswordController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          prefixIcon: Icon(Icons.lock_outline),
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.orange,
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'forgetpass');
                            },
                            child: Text(
                              'Forget Password',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                color: Colors.blue[300],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 55.99,
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          shadowColor: Colors.orange[500],
                          color: Colors.orange[500],
                          elevation: 7.0,
                          child: TextButton(
                            onPressed: () {
                              login();
                            },
                            child: const Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            child: Text(
                              'New User ? Sign Up',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                color: Colors.blue[300],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
