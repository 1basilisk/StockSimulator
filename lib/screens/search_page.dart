// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, unnecessary_import, implementation_imports, unused_import

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stockez_app/services/api_service.dart';

import '../model/stock_model.dart';
import 'home_page.dart';
import 'portfolio_page.dart';
import 'records_page.dart';
import 'yourAcc_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Color blueBg = Color.fromRGBO(69, 7, 132, 1);
  Color roseLight = Color.fromRGBO(253, 176, 150, 1);
  Color roseDark = Color.fromRGBO(229, 149, 142, 1);
  Color goldAcc = Color.fromRGBO(255, 185, 2, 1);
  final double _iconSize = 30;
  String sym = "fb";
  bool click = false;
  Future<Stock> search(String sym) {
    Future<Stock> stock = fetchStock(sym);
    setState(() {
      stock = stock;
    });
    return stock;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueBg,
        resizeToAvoidBottomInset: false,
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchPage()));
              } else if (index == 2) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RecordsPage()));
              } else {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PortfolioPage()));
              }
            }),
        appBar: AppBar(
          backgroundColor: roseLight,
          title: const Text('Search Stock'),
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
        body: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 500,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          sym = value;
                        });
                      },
                      decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ), // icon is 48px widget.
                          ),
                          labelText: "Enter stock name here...",
                          labelStyle: TextStyle(color: goldAcc),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0))),
                    ),
                  ),
                  // SizedBox(
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.green,
                  //     ),
                  //     child: const Text(
                  //       "Search",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 30,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  FutureBuilder<Stock>(
                    future: fetchStock(sym), // Use any user ID you want
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Stock stock = snapshot.data!;
                        return Container(
                         
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Stock Details", style: TextStyle(
                                    color: Color(0xFFFFBA00),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'DancingScript',
                                    fontSize: 35),),
                              Text("Name: "+
                                stock.name,
                                style: TextStyle(
                                    color: Color(0xFFFFBA00),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'DancingScript',
                                    fontSize: 20),
                              ),
                              Text("Symbol: "+
                                stock.symbol,
                                style: TextStyle(
                                    color: Color(0xFFFFBA00),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'DancingScript',
                                    fontSize: 20),
                              ),
                              Text("Price: \$ "+
                                stock.price.toString(),
                                style: TextStyle(
                                    color: Color(0xFFFFBA00),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'DancingScript',
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error');
                      }
                      return CircularProgressIndicator();
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
