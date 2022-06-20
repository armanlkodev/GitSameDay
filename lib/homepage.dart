import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SameDayHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
          ),
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.account_circle,
                          size: 40,
                          color: Colors.orange[500],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(190, 0, 10, 0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              size: 40,
                              color: Colors.orange[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            size: 40,
                            color: Colors.orange[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 90,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    prefix: const Icon(
                      Icons.search_sharp,
                      color: Colors.orange,
                    ),
                    suffixIcon: const Icon(
                      Icons.mic_none_outlined,
                      color: Colors.orange,
                    ),
                    hintText: 'Search By Keyword Or By Product ID',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.blue))),
              ),
            ),
          ),

          //      Padding(
          //
          // padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
          //         child: Container(
          //
          //           child: Column(
          //
          //             children: [
          //
          //               const Text(
          //                 'Add Delivery Location To Get Extra Discount',
          //                 style: TextStyle(
          //                   height: 4,
          //                   letterSpacing: 2,
          //                   fontWeight: FontWeight.w500,
          //                   backgroundColor: Colors.blue,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
            child: Divider(
              height: 2,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: SvgPicture.asset(
                            'assets/comrep.svg',
                          ),

                          onPressed: () {},
                          //do something,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: [
                            SizedBox(

                              height: 70,
                              width: 70,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/comrep.svg',
                                ),
                                onPressed: () {}, //do something,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: [
                            SizedBox(

                              height: 70,
                              width: 70,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/comrep.svg',
                                ),
                                onPressed: () {}, //do something,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: [
                            SizedBox(

                              height: 70,
                              width: 70,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/comrep.svg',
                                ),
                                onPressed: () {}, //do something,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              height: 280,
              width: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/home.png'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
