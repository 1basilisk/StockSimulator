import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stockez_app/screens/home_page.dart';

import 'portfolio_page.dart';
import 'search_page.dart';
import 'yourAcc_page.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({super.key});

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {

  Color blueBg = Color.fromRGBO(69, 7, 132, 1);
  Color roseLight = Color.fromRGBO(253, 176, 150, 1);
  Color roseDark = Color.fromRGBO(229, 149, 142, 1);
  Color goldAcc = Color.fromRGBO(255, 185, 2, 1);
  final double _iconSize = 30;
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
        title: const Text('My Records'),
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
        child: Padding(padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
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
        headingRowColor: MaterialStateColor.resolveWith((states) => roseLight),
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
              'Amount',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            
          ),
           DataColumn(
            label: Text(
              'Type',
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
              DataCell(Text('Buy')),
            ],
          ),
           DataRow(
            cells: <DataCell>[
              DataCell(Text('Tesla')),
              DataCell(Text('10')),
              DataCell(Text('400')),
              DataCell(Text('Buy')),
            ],
          ),
           DataRow(
            cells: <DataCell>[
              DataCell(Text('Tesla')),
              DataCell(Text('10')),
              DataCell(Text('400')),
              DataCell(Text('Buy')),
            ],
          ),
           DataRow(
            cells: <DataCell>[
              DataCell(Text('Tesla')),
              DataCell(Text('10')),
              DataCell(Text('400')),
              DataCell(Text('Buy')),
            ],
          ),
           DataRow(
            cells: <DataCell>[
              DataCell(Text('Tesla')),
              DataCell(Text('10')),
              DataCell(Text('400')),
              DataCell(Text('Buy')),
            ],
          ),
           DataRow(
            cells: <DataCell>[
              DataCell(Text('Tesla')),
              DataCell(Text('10')),
              DataCell(Text('400')),
              DataCell(Text('Buy')),
            ],
          ),
           DataRow(
            cells: <DataCell>[
              DataCell(Text('Tesla')),
              DataCell(Text('10')),
              DataCell(Text('400')),
              DataCell(Text('Buy')),
            ],
          ),
           DataRow(
            cells: <DataCell>[
              DataCell(Text('Tesla')),
              DataCell(Text('10')),
              DataCell(Text('400')),
              DataCell(Text('Buy')),
            ],
          ),
           DataRow(
            cells: <DataCell>[
              DataCell(Text('Tesla')),
              DataCell(Text('10')),
              DataCell(Text('400')),
              DataCell(Text('Buy')),
            ],
          ),
           DataRow(
            cells: <DataCell>[
              DataCell(Text('Tesla')),
              DataCell(Text('10')),
              DataCell(Text('400')),
              DataCell(Text('Buy')),
            ],
          ),
           DataRow(
            cells: <DataCell>[
              DataCell(Text('Tesla')),
              DataCell(Text('10')),
              DataCell(Text('400')),
              DataCell(Text('Buy')),
            ],
          ),
          
              ],
          
           ),
           
              
        
      ),
 
    ),
          ),
        ),
        ),

    ));
  }
}