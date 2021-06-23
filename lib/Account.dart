import 'package:authentication/Address.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'Address.dart';




class Account extends StatefulWidget {

  final Address value;

Account( {Key key,this.value}):super(key:key);
 

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {




final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }
@override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }


  @override
  Widget build(BuildContext context) {
    
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Welcome',
          home: Scaffold(
            backgroundColor: Colors.red,
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:(){Navigator.pop(context);}),
              
              centerTitle: true,
            backgroundColor: Colors.redAccent,
              title: const Text('Accounts'),
            ),
            body: Column(
             
              children: [
                Image.network('https://www.wozur.com/wozur/public/user_files/images/Login.png',width:300,height: 300),
                Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.person_pin,
                  color: Colors.teal,
                ),
                title: Text(
                  '${user.displayName}',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontSize: 20.0,


                  ),

                ),
              ),
            ),
                  Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  '${user.email}',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontSize: 15.0,


                  ),

                ),
              ),
            ),
                  ElevatedButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context){return Address();}));}, child:Text("add address")),

                  
                ],

                
            )
              
        
      ),
    );
  }
}