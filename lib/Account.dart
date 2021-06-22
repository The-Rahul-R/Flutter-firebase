import 'package:authentication/Address.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'global.dart' as global;


class Account extends StatefulWidget {
 

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {



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
               labelText: ' name'
               
               ),
               
              
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
              
             decoration: InputDecoration(
               border : UnderlineInputBorder(),
               labelText: ' email'
               
               ),
               
              
                ),
                  ),
                  ElevatedButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context){return Address();}));}, child:Text("add address")),

                  Container(child: Text("The address is ${global.housenumber},${global.housename},${global.locality},${global.city},${global.pincode}"))
                ],

                
            )
              
        
      ),
    );
  }
}