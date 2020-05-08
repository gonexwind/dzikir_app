import 'package:dzikir/src/model/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: SingleChildScrollView(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        data[_id]['content'],
                        style: TextStyle(fontSize: 35.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildIconButton(Icons.menu, _showMenu),
                  _buildIconButton(Icons.navigate_before, _prev),
                  Text(
                    data[_id]['id'],
                    style: TextStyle(fontSize: 25.0),
                  ),
                  _buildIconButton(Icons.navigate_next, _next),
                  _buildIconButton(Icons.info, _showInfo),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconButton _buildIconButton(IconData icon, Function onTap) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 30.0,
      ),
    );
  }

  int _id = 0;

  void _next() {
    setState(() {
      if (_id < data.length - 1) _id++;
    });
  }

  void _prev() {
    setState(() {
      if (_id > 0) _id--;
    });
  }

  void _showInfo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Info'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Text(data[_id]['info'])],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  void _showAbout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Info'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Dibuat oleh Fikky Ardianto'),
              Text('Sumber: nu.or.id'),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  void _showMenu() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Menu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('About'),
                onTap: _showAbout,
              ),
              ListTile(
                title: Text('Exit App'),
                onTap: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
