import 'package:flutter/material.dart';
import  'package:learnig_project1/MyHomePage.dart';

class ThemeSelectionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Theme')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to MyHomePage with Theme 1
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home Page', themeData: ThemeData.light())));
              },
              child: Text('Light Theme'),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Navigate to MyHomePage with Theme 2
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home Page', themeData: ThemeData.dark())));
              },
              child: Text('Dark Theme'),
            ),
          ],
        ),
      ),
    );
  }

}