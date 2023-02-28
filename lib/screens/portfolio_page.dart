// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockez_app/screens/recharge.dart';
import 'package:stockez_app/screens/yourAcc_page.dart';
import 'package:stockez_app/services/firebaseFunctions.dart';
import '../keys/variables.dart';
import '/screens/home_page.dart';
import 'records_page.dart';
import 'search_page.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
    Color blueBg = Color.fromRGBO(69, 7, 132, 1);
  Color roseLight = Color.fromRGBO(253, 176, 150, 1);
  Color roseDark = Color.fromRGBO(229, 149, 142, 1);
  Color goldAcc = Color.fromRGBO(255, 185, 2, 1);
  final double _iconSize = 30;
  @override
  Widget build(BuildContext context) {
    FirestoreServices.fetchPortfolio(UInfo.u_Id)
        .then((List<DocumentSnapshot> userSnapshots) {
      // Handle the user data
      userSnapshots.forEach((DocumentSnapshot userSnapshot) {
        Map<String, dynamic>? portfolio =
            userSnapshot.data() as Map<String, dynamic>?;
        UInfo.u_portfolio!.add(portfolio!);
      });
    }).catchError((error) {
      // Handle any errors
      print('Error getting user data: $error');
    });
   
      print(UInfo.u_portfolio);
    

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
        title: const Text('My Portfolio'),
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
          child: Padding(padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            children: <Widget>[
              //DataTable Container
              Container(
            height: 300,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  dataTextStyle: TextStyle(color: goldAcc),
                // dataRowColor: MaterialStateColor.resolveWith((states) => Colors.amberAccent),
                border: TableBorder.all(width: 1, color: Colors.red),
                  headingRowHeight: 50,
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => roseLight),
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Stock',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Quantity',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Price',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),

                    DataColumn(
                      label: Text(
                        'Value',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                   
                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Tesla')),
                        DataCell(Text('10')),
                        DataCell(Text('400')),
                        DataCell(Text('4000')), 
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Tesla')),
                        DataCell(Text('10')),
                        DataCell(Text('400')),
                        DataCell(Text('4000')), 
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Tesla')),
                        DataCell(Text('10')),
                        DataCell(Text('400')),
                        DataCell(Text('4000')), 
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Tesla')),
                        DataCell(Text('10')),
                        DataCell(Text('400')),
                        DataCell(Text('4000')), 
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Tesla')),
                        DataCell(Text('10')),
                        DataCell(Text('400')),
                        DataCell(Text('4000')), 
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Tesla')),
                        DataCell(Text('10')),
                        DataCell(Text('400')),
                        DataCell(Text('4000')), 
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Tesla')),
                        DataCell(Text('10')),
                        DataCell(Text('400')),
                        DataCell(Text('4000')), 
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Tesla')),
                        DataCell(Text('10')),
                        DataCell(Text('400')),
                        DataCell(Text('4000')), 
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Tesla')),
                        DataCell(Text('10')),
                        DataCell(Text('400')),
                        DataCell(Text('4000')), 
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Tesla')),
                        DataCell(Text('10')),
                        DataCell(Text('400')),
                        DataCell(Text('4000')), 
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Tesla')),
                        DataCell(Text('10')),
                        DataCell(Text('400')),
                        DataCell(Text('4000')), 
                      ],
                    ),
                    
                    
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            width: 40,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                SizedBox(
                  width: 40,
                ),
          

          //Display the total and cash balance using these fields
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Cash Balance: ",
                style: GoogleFonts.montserrat(
                fontSize:  17,
                fontWeight:  FontWeight.normal,
                height:  1.6356666088,
                letterSpacing:  -0.3000000119,
                color:  goldAcc,
              ),
                ),
                  Text("\$ 420.69",
                  style: GoogleFonts.montserrat(
                    fontSize:  16,
                    fontWeight:  FontWeight.w600,
                    height:  1.6356666088,
                    letterSpacing:  -0.3000000119,
                    color:  goldAcc,
                  ),
                  ),
                // ),
                
                
              ],
            ),
          
          
          
          

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text("Total: "),
          //     SizedBox(
          //       width: 300,
          //       child: TextFormField(
          //         decoration: const InputDecoration(
          //             labelText: " ",
          //             fillColor: Colors.white,
          //             focusedBorder: OutlineInputBorder(
          //                 borderSide:
          //                     BorderSide(color: Colors.blue, width: 2.0))),
          //       ),
          //     ),
              
          //   ],
            
          // ),


            
          
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Total: ",
              style: GoogleFonts.montserrat(
              fontSize:  17,
              fontWeight:  FontWeight.normal,
              height:  1.6356666088,
              letterSpacing:  -0.3000000119,
              color:  goldAcc,
            ),
              ),
              
                Text("\$ 420.69",
                style: GoogleFonts.montserrat(
                  fontSize:  16,
                  fontWeight:  FontWeight.w600,
                  height:  1.6356666088,
                  letterSpacing:  -0.3000000119,
                  color:  goldAcc,
                ),
                ),
              // ),
              
              
            ],
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => RechargePage()));
          }, 
          style: ElevatedButton.styleFrom(
                    backgroundColor: roseDark,
                    padding: EdgeInsets.all(25),  
          ),
          child: Text("Recharge",)
          
          )

          ]
              
          ), //Second COlumn
          
          ), //Container of second column

          
          


            ],
          ), //Main Column
          ),
        ),
      ),
      ),
      
    );
  }
}