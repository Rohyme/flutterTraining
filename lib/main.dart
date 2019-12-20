
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeApp();
  }
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String _phoneNumber = "+01068505484";
  String _mail = "eng.mhmd.rohyme@gmail.com";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Gom3a recommendation app",
            style: TextStyle(color: Colors.yellow),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("images/rohyme.jpg"),
                radius: 50,
              ),
              Text(
                "MSR",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Senior Android Developer \n Flutter trainee \n Gom3a trainer",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: 20, letterSpacing: 2),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
                indent: 50,
                endIndent: 50,
                color: Colors.teal.shade100,
              ),
              GestureDetector(
                onTap: (){
                 _callNumber(_phoneNumber);
                },
                child: Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      _phoneNumber,
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  _sendMail(_mail);
                },
                child: Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 25,
                  ),
                  elevation: 10,
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.teal,
                    ),
                    title: Text(
                      _mail,
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }

  void _callNumber(String number) async{
    String toTel = "tel://"+ number;
    if(await canLaunch(toTel))
    await launch(toTel);
    }
  void _sendMail(String mail) async{
    String toMail = "mailto://"+ mail;
    if(await canLaunch(toMail))
    await launch(toMail);
    }


}
