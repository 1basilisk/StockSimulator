import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockez_app/keys/variables.dart';
import 'home_page.dart';
import 'records_page.dart';
import 'search_page.dart';
import 'yourAcc_page.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({super.key});

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  Color blueBg = const Color.fromRGBO(69, 7, 132, 1);
  Color roseLight = const Color.fromRGBO(253, 176, 150, 1);
  Color roseDark = const Color.fromRGBO(229, 149, 142, 1);
  Color goldAcc = const Color.fromRGBO(255, 185, 2, 1);
  final amtC = TextEditingController();

  int decrementCounter() {
    int quan = int.tryParse(amtC.text) ?? 0;
    quan--;
    if (quan < 0) {
      quan = 0;
    }
    return quan;
  }

  int incrementCounter() {
    int quan = int.tryParse(amtC.text) ?? 0;
    quan++;
    return quan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueBg,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: blueBg,
          color: blueBg,
          animationDuration: const Duration(milliseconds: 300),
          items: <Widget>[
            const Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
            const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            const Icon(
              Icons.history,
              color: Colors.white,
              size: 30,
            ),
            const Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
          ],
          onTap: (index) {
            print(index);
            if (index == 0) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            } else if (index == 1) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SearchPage()));
            } else if (index == 2) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const RecordsPage()));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const YourAccountPage()));
            }
          }),
      appBar: AppBar(
        backgroundColor: roseLight,
        title: const Text('Recharge'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const YourAccountPage()));
            },
            icon: const Icon(
              Icons.account_circle,
              size: 30,
            ), //star==app logo
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      iconSize: 50,
                      icon: const Icon(
                        Icons.remove,
                        color: Color.fromRGBO(229, 149, 142, 1),
                      ),
                      onPressed: () {
                        amtC.text = decrementCounter().toString();
                      },
                    ),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: amtC,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d*')),
                        ],
                        style: TextStyle(color: goldAcc),
                        decoration: InputDecoration(
                            labelText: "Amount to rechage",
                            labelStyle: TextStyle(color: goldAcc),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: roseDark, width: 2.0))),
                      ),
                    ),
                    IconButton(
                      iconSize: 50,
                      icon: const Icon(
                        Icons.add,
                        color: Color.fromRGBO(229, 149, 142, 1),
                      ),
                      onPressed: () {
                        amtC.text = incrementCounter().toString();
                      },
                    ),
                  ],
                ),
              ),
              // SizedBox(width: 30,),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    double val = double.tryParse(amtC.text) ?? 0;
                    UInfo.u_balance = UInfo.u_balance! + val;
                    amtC.text = "DONE";
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: roseDark,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Text(
                    "Recharge Amount",
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
    );
  }
}
