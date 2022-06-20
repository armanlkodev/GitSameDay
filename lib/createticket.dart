import 'package:flutter/material.dart';
import 'package:samedaypro/setting.dart';

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
                padding: EdgeInsets.only(left: 16, top: 150, right: 16),
                child: Column(
                  children: [
                   Card(
                     child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Please enter your order ID',
                                labelText: 'Order ID',
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
                            decoration: InputDecoration(
                              hintText: 'Please enter your issue',
                              labelText: 'Description',
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
                       SizedBox(height: 50,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Setting()),
                            );
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
              )

        ),
      ),
    );
  }
}
