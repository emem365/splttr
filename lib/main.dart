import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'splttr',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.yellow,
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('SPLTTR'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: null),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text('Tab1')),
            Center(child: Text('Tab2')),
            Center(child: Text('Tab3')),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: null,
          label: Text('Add'),
          icon: Icon(Icons.add),
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.red,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}