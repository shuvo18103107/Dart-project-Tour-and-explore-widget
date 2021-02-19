import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Myfriends> friends = [
    Myfriends(name: 'Shuvo', color: 0xff738f66),
    Myfriends(name: 'Rahim', color: 0xff5e5e5e),
    Myfriends(name: 'James', color: 0xffff9190),
    Myfriends(name: 'Jack', color: 0xff738f67),
    Myfriends(name: 'Robert', color: 0xff738f69),
    Myfriends(name: 'Maxewell', color: 0xff738f80),
  ];

  @override
  Widget build(BuildContext context) {
    print(Random().nextDouble());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Color Changer App',
        theme: ThemeData(
            primarySwatch: Colors.amber,
            primaryColor: Colors.blue,
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'Color game using forEach method',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Task:Click on the button to change the background color randomly',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: friends.length,
                    itemBuilder: (context, int index) {
                      return Container(
                        color: Color(
                          friends[index].color,
                        ),
                        child: ListTile(title: Text(friends[index].name)),
                      );
                    },
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.color_lens),
                onPressed: () {
                  friends.forEach((item) => item.color =
                      (Random().nextDouble() * 0xFFFFFFFF).toInt());

                  setState(() {});
                })));
  }
}

class Myfriends {
  String name;
  int color;
  Myfriends({this.name, this.color});
}
