import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stockez_app/keys/variables.dart';
import 'package:stockez_app/screens/portfolio_page.dart';

import 'home_page.dart';
import 'records_page.dart';
import 'search_page.dart';
import '../keys/variables.dart';

class YourAccountPage extends StatefulWidget {
  const YourAccountPage({super.key});

  @override
  State<YourAccountPage> createState() => _YourAccountPageState();
}

class _YourAccountPageState extends State<YourAccountPage> {
  final unameC = TextEditingController();
  final emailC = TextEditingController();
  final uidC = TextEditingController();

  final double _iconSize = 30;
  final double _heightNew = 10;
  final Color blueBg = Color.fromRGBO(69, 7, 132, 1);
  final Color roseLight = Color.fromRGBO(253, 176, 150, 1);
  final Color roseDark = Color.fromRGBO(229, 149, 142, 1);
  final Color goldAcc = Color.fromRGBO(255, 185, 2, 1);
  @override
  Widget build(BuildContext context) {
    unameC.text = UInfo.userName!;
    emailC.text = UInfo.email!;
    uidC.text = UInfo.u_Id;
    return Scaffold(
      backgroundColor: blueBg,
      //BottomNavBar
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: blueBg,
          color: blueBg,
          animationDuration: const Duration(milliseconds: 300),
          items: <Widget>[
            Icon(
              Icons.home,
              color: Colors.white,
              size: _iconSize,
            ),
            Icon(
              Icons.search,
              color: Colors.white,
              size: _iconSize,
            ),
            Icon(
              Icons.history,
              color: Colors.white,
              size: _iconSize,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
              size: _iconSize,
            ),
          ],
          onTap: (index) {
            print(index);

            if (index == 0) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            } else if (index == 1) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage()));
            } else if (index == 2) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => RecordsPage()));
            } else {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PortfolioPage()));
            }
          }),

      appBar: AppBar(
        backgroundColor: roseLight,
        title: const Text('Account Details'),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     //Sign Out Code
          //   },
          //   icon: Icon(Icons.star), //star==app logo
          // ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              //Sign out code here
            },
            child: const Text(
              "Sign Out",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),

      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: const Icon(
                  Icons.account_circle,
                  size: 90,
                  color: Colors.amber,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: uidC,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 185, 2, 1),
                      ),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          labelText: "Username",
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(255, 185, 2, 1),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 185, 2, 1),
                                  width: 2.0))),
                    ),
                    SizedBox(
                      height: _heightNew,
                    ),
                    TextFormField(
                      controller: unameC,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 185, 2, 1),
                      ),
                      decoration: const InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(255, 185, 2, 1),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 185, 2, 1),
                                  width: 2.0))),
                    ),
                    SizedBox(
                      height: _heightNew,
                    ),
                    // TextFormField(
                    //   style: TextStyle(
                    //     color: Color.fromRGBO(255, 185, 2, 1),
                    //   ),
                    //   decoration: const InputDecoration(
                    //       labelText: "Phone Number",
                    //       labelStyle: TextStyle(
                    //         color: Color.fromRGBO(255, 185, 2, 1),
                    //       ),
                    //       fillColor: Colors.white,
                    //       focusedBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: Color.fromRGBO(255, 185, 2, 1),
                    //               width: 2.0))),
                    // ),
                    SizedBox(
                      height: _heightNew,
                    ),
                    TextFormField(
                      controller: emailC,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 185, 2, 1),
                      ),
                      decoration: const InputDecoration(
                          labelText: "Email Id",
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(255, 185, 2, 1),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 185, 2, 1),
                                  width: 2.0))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: goldAcc,
                          padding: EdgeInsets.all(20),
                        ),
                        child: const Text(
                          "SAVE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
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
}
