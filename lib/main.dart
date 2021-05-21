import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Firstpage(),
    );
  }
}

class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  // const OpenUrlExample({Key key}) : super(Key: key);

  _launchURL() async {
    const url = 'https://flutter.dev';
    await launch(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'url cannot be launch $url';
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sparkflow',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Color(0xFF7807F0),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => setState(() {
                      _launchInBrowser('https://flutter.dev');
                    }),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: new Image.asset('assets/a.png'),
                        title: Text('AL spares'),
                        subtitle: Text('TOC requirements'),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
