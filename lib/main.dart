import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> countries = [
    'Germany',
    'Bangladesh',
    'Bulgaria',
    'franch',
    'netharland',
    'Pakistan',
    'India',
    'Afganistan',
    'England',
    'Australia'
  ];

  List<String> updatedList;
  @override
  void initState() {
    updatedList = countries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List.where() method'),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(32)),
              child: TextFormField(
                onChanged: (value) {
                  updatedList = countries.where((item) {
                    return item.contains(value);
                  }).toList();
                  setState(() {});
                },
                cursorColor: Colors.grey,
                // keyboardType: TextInputType.,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 17),
                  hintText: 'Search your trips',
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(18),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 5,
                      child: ListTile(leading: Text(updatedList[index])));
                },
                itemCount: updatedList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
