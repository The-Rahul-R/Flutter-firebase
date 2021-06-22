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

  get email => null;
  get displayName=>null;

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
  Widget build(BuildContext context) {
    
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Welcome',
          home: Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:(){Navigator.pop(context);}),
              
              centerTitle: true,
            backgroundColor: Colors.amber,
              title: const Text('Accounts'),
            ),
            body: Column(
             
              children: [
                Image.network('https://www.wozur.com/wozur/public/user_files/images/Login.png',width:100,height: 200),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
              
             decoration: InputDecoration(
               border : UnderlineInputBorder(),
               labelText: ' rahulr12@gmail.com'
               
               ),
               
              
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
              
             decoration: InputDecoration(
               border : UnderlineInputBorder(),
               labelText: ' Rahul'
               
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