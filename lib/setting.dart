import 'package:flutter/material.dart';
import 'package:samedaypro/alert_dialog.dart';
import 'package:samedaypro/loginhome.dart';
import 'alert_dialog.dart';
import 'editprofile.dart';
import 'helpdesk.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  String title = 'AlertDialog';
  bool tappedYes = false;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/profile.png'),
              fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              'Profile Page',
            ),
          ),
          automaticallyImplyLeading: false, //back Button
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.only(left: 0, top: 30),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      child: Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        color: Colors.orange,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SettingsUI()),
                            );
                          },
                          title: Center(
                            child: Text(
                              "Arman Shaikh",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/img.jpg'),

                            ),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 10,
                      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: SizedBox(
                        //height: 500,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              title: Text("Email"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                //email opem
                              },
                            ),
                            _buildDivider(),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.phone_iphone,
                                color: Colors.blue,
                              ),
                              title: Text("Mobile No"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                //open change password
                              },
                            ),
                            _buildDivider(),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.lock_outline,
                                color: Colors.blue,
                              ),
                              title: Text("Change Password"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                //open change password
                              },
                            ),
                            _buildDivider(),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.help_center,
                                color: Colors.blue,
                              ),
                              title: Text("HelpDesk"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {

                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => HelpDesk()
                                    )
                                );//open change password
                              },
                            ),
                            _buildDivider(),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.account_balance_wallet,
                                color: Colors.blue,
                              ),
                              title: Text("Wallet"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                //open change language
                              },
                            ),
                            _buildDivider(),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.star_rate,
                                color: Colors.blue,
                              ),
                              title: Text("Rating"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                //open change location
                              },
                            ),
                            _buildDivider(),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              ),
                              title: Text("Location"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                //open change location
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Center(
                          child: RaisedButton(
                            onPressed: () async {
                              final action = await AlertDialogs.yesCancelDialog(
                                  context, 'Logout', 'Are you sure?');
                              if (action == DialogsAction.yes) {
                                setState(() => tappedYes = true);
                                {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => LoginHome()),
                                  );
                                }
                              }
                            },
                            color: Colors.orange,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Logout'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
