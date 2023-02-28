import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stockez_app/keys/variables.dart';
import 'package:stockez_app/screens/portfolio_page.dart';
import 'package:stockez_app/services/firebaseFunctions.dart';

import '../services/api_service2.dart';
import 'home_page.dart';
import 'records_page.dart';
import 'search_page.dart';
import 'yourAcc_page.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
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

  String stock = '';
  String _myActivityResult = '';
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    stock = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _myActivityResult = stock;
      });
    }
  }
  Color blueBg = Color.fromRGBO(69, 7, 132, 1);
  Color roseLight = Color.fromRGBO(253, 176, 150, 1);
  Color roseDark = Color.fromRGBO(229, 149, 142, 1);
  Color goldAcc = Color.fromRGBO(255, 185, 2, 1);
  final double _iconSize = 30;

  @override
  Widget build(BuildContext context) {
    Map<String, String> availableStocks = {
      "tesla": "tsla",
      "google": "googl",
      "facebook": "fb",
    };
    //code to generate list of ooptions from key value pairs of stock
    List<Map<String, String>> options = [];
    availableStocks.forEach((name, symbol) {
      Map<String, String> op = {"display": name, "value": symbol};
      options.add(op);
    });

    int num = 0;
    sym_controller.text = "";
    num_controller.text = "";
    String sym = "";
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
        title: const Text('Sell Stocks'),
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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: DropDownFormField(
                    titleText: 'My Stock',
                    hintText: 'Please choose one',
                    value: stock,
                    onSaved: (value) {
                      setState(() {
                        stock = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        stock = value;
                      });
                    },
                    dataSource: options,
                    textField: 'display',
                    valueField: 'value',
                  ),
                ),
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
                      num = int.tryParse(num_controller.text) ?? 0;
                      sell(stock, num);
                      _saveForm();
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 235, 77, 66),
                    padding: EdgeInsets.all(20),
                  ),
                    
                    child: const Text(
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                      'SELL'
                    ),
                    
                  ),
                ),
                
                Container(
                  child: Text(" $_myActivityResult sold!"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sell(String stock, int num) async {
    //fetch user data
    //fetch stock data
    Future<Map<String, dynamic>> futurestockJson = getStockJson(stock);
    Map<String, dynamic> stockJson = await futurestockJson;
    double price = stockJson["previousClose"];
    double cost = num * price;
    String name = stockJson["companyName"];
    String symbol = stockJson["symbol"];
    print("Name: $name");
    print("Price: $price");
    print("Cost: $cost");

    UInfo.u_balance = (UInfo.u_balance! + cost);
    //update stocks in db
    FirestoreServices.savePortfolio(symbol, name, num);
    FirestoreServices.saveHistory("Sell", UInfo.u_Id, symbol, name, cost, num);
    //deduct money
    //redirect
  }
}
