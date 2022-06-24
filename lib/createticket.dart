import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'helpdesk.dart';


class CreateTicket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Create Ticket",
      home: CreateTicketPage(),
    );
  }
}

class CreateTicketPage extends StatefulWidget {
  @override
  _CreateTicketPage createState() => _CreateTicketPage();
}

class _CreateTicketPage extends State<CreateTicketPage> {

  bool _isLoading = false;

  final TextEditingController OrderIdController = new TextEditingController();
  final TextEditingController SubjectController = new TextEditingController();
  final TextEditingController MobileNoController = new TextEditingController();
  final TextEditingController DiscriptionController = new TextEditingController();

    // signIn(String OrderId, Subject,MobileNo,Discription) async {
    //   HttpOverrides.global = MyHttpOverrides();
    //   String baseUrl = "https://localhost:44341/SaveTicket";
    //   var jsonResponse = null;
    //   Map body = {
    //     'OrderId': OrderId,
    //     'Subject': Subject,
    //     'MobileNo': MobileNo,
    //     'Discription': Discription,
    //   };
    //   print('1');
    //   var response = await http.post(Uri.parse(baseUrl),
    //       encoding:Utf8Codec(),
    //       body: body);
    //
    //   if(response.statusCode == 200) {
    //     jsonResponse = json.decode(response.body);
    //     if(jsonResponse != null) {
    //       setState(() {
    //         _isLoading = false;
    //       });
    //       // sharedPreferences.setString("token", jsonResponse['token']);
    //       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Dashboard()), (Route<dynamic> route) => false);
    //     }
    //   }
    //   else {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //     print(response.body);
    //   }
    //   print('2');
    //   @override
    //   void dispose() {
    //     OrderIdController.dispose();
    //     SubjectController.dispose();
    //     MobileNoController.dispose();
    //     DiscriptionController.dispose();
    //     super.dispose();
    //   }
    //
    // }

  Future<void> createTicket() async {
    var token = "wHlnEuo21mWeuJjmwKniY9GIJvls-gKa_SCZBg-_3nCw3_u-OMa6oQeszSiwOcMDDlie6I2w6xC3JaxeYTu5HIrtDJe9ABfGEFUzZMKUsvmrJKAe__BYau6lpFeUN9cITZuYS9c2aPv2hDRyXcge6a7xvbP99vj065ZDq2KggvfKpdC1cqMzGhdQbnfoc95OcpNtDBoOLYcadiPhbhrYAVD147U7svt88eLKnYWzwvXYG3V8p_e5xL4Lov2Dcinl";
    if (OrderIdController.text.isNotEmpty &&
        SubjectController.text.isNotEmpty && MobileNoController.text.isNotEmpty && DiscriptionController.text.isNotEmpty ) {
      var response =
      await http.post(Uri.parse("https://localhost:44341/SaveTicket"),
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
            'OrderId': OrderIdController.text,
            'Subject': SubjectController.text,
            'MobileNo': MobileNoController.text,
            'Discription': DiscriptionController.text,
            'grant_type': 'password',
          }));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        // Navigator.push(
        // context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response.body)));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(" Please fill the details")));
    }
  }



  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/tkt1.png'), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          leading: Card(
            elevation:30,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios_sharp),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HelpDesk()),
                  );
                }),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              'Create Ticket',
              style: TextStyle(color: Colors.black),
            ),

          ),
          automaticallyImplyLeading: false, //back Button
        ),
        body: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 50, right: 16),
                child: Form(
                  child: Column(
                    children: [
                     Card(
                       child: Column(
                            children: [
                              TextField(
                             controller: OrderIdController,
                                decoration: InputDecoration(
                                  hintText: 'Please enter your order ID',
                                  labelText: 'Order ID',
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: SubjectController,
                                      decoration: InputDecoration(
                                        hintText: 'Please enter your issue',
                                        labelText: 'Subject',
                                        labelStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: MobileNoController,
                                      decoration: InputDecoration(
                                        hintText: 'MobileNo',
                                        labelText: 'MobileNo',
                                        labelStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: DiscriptionController,

                                      decoration: InputDecoration(
                                        hintText: 'Discription',
                                        labelText: 'Discription',
                                        labelStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                     ),


                         SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              createTicket();
                            },

                            color: Colors.orange,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}