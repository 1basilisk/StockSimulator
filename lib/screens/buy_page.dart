// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, unnecessary_import, implementation_imports, unused_import

// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stockez_app/screens/portfolio_page.dart';
import 'package:stockez_app/services/api_service.dart';
import 'package:stockez_app/services/api_service2.dart';

import '../model/stock_model.dart';
import 'home_page.dart';
import 'records_page.dart';
import 'search_page.dart';
import 'yourAcc_page.dart';
import '../services/firebaseFunctions.dart';
import '../keys/variables.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  Color blueBg = Color.fromRGBO(69, 7, 132, 1);
  Color roseLight = Color.fromRGBO(253, 176, 150, 1);
  Color roseDark = Color.fromRGBO(229, 149, 142, 1);
  Color goldAcc = Color.fromRGBO(255, 185, 2, 1);
  final double _iconSize = 30;

  final num_controller = TextEditingController();
  final sym_controller = TextEditingController();

  int decrementCounter() {
    int quan = int.tryParse(num_controller.text) ?? 0;
    quan--;
    if (quan < 0) {
      quan = 0;
    }
    return quan;
  }

  int incrementCounter() {
    int quan = int.tryParse(num_controller.text) ?? 0;
    quan++;
    return quan;
  }

  @override
  Widget build(BuildContext context) {
    String sym = "";
    int num = 0;
    
    sym_controller.text = "";
    num_controller.text = "";

    return Scaffold(
       backgroundColor: blueBg,
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
        backgroundColor: roseDark,
        title: const Text('Buy Stocks'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => YourAccountPage()));
            },
            icon: Icon(
              Icons.account_circle,
              size: 40,
            ), //star==app logo
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
        child: Center(
          child : Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Container(
                child: TextFormField(
                  controller: sym_controller,
                  decoration: InputDecoration(
                      labelText: "Stock Symbol",
                      labelStyle: TextStyle(color: roseDark),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: goldAcc, width: 2.0))),
                ),
              ),

              SizedBox(height: 40,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.remove, color: roseLight,),
                      onPressed: () {
                        num_controller.text = decrementCounter().toString();
                      },
                    ),

                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: num_controller,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                        ],
                        decoration: InputDecoration(
                          labelText: "Number of stocks",
                          labelStyle: TextStyle(color: roseDark),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: goldAcc, width: 2.0))),
                    ),
                    ),
                    IconButton(
                     iconSize: 50,
                      icon: Icon(Icons.add, color: roseLight,),
                      onPressed: () {
                        num_controller.text = incrementCounter().toString();
                      },
                    ),
                  ],
                ),
              ),
               SizedBox(height: 40,),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    sym = sym_controller.text;
                    num = int.tryParse(num_controller.text) ?? 0;

                    print("on pressed num value: $num");

                    buy(sym, num);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.all(20),
                  ),
                  child: const Text(
                    "BUY",
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
        ),
      ),
      
      ),
      
    );
  }


  void buy(String sym, int num) async {
    //fetch user data
    //fetch stock
    Future<Map<String, dynamic>> futurestockJson = getStockJson(sym);
    Map<String, dynamic> stockJson = await futurestockJson;
    double price = stockJson["previousClose"];
    String symbol = stockJson["symbol"];
    double cost = num * price;
    String name = stockJson["companyName"];
    print("Name: $name");
    print("Price: $price");
    print("Cost: $cost");
    if (cost.toDouble() > UInfo.u_balance!) {
      print("Not enough money");
    } else {
      setState(() {
        UInfo.u_balance = (UInfo.u_balance! - cost);
      });
      print(UInfo.u_balance.toString());
      FirestoreServices.saveHistory(
        "Buy",
        UInfo.u_Id, symbol, name, cost, num
      );
      FirestoreServices.savePortfolio(symbol, name, num);
    }

    // UInfo.u_portfolio = FirestoreServices.fetchPortfolio(UInfo.u_Id);
    // UInfo.u_portfolio?.forEach((element) {
    //   print(element.entries);
    // });
    // ignore: use_build_context_synchronously

    Navigator.of(context as BuildContext )
        .push(MaterialPageRoute(builder: (context) => RecordsPage()));

    // }
  }
}
