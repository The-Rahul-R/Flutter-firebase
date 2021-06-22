import 'package:authentication/Address.dart';
import 'package:flutter/material.dart';

import 'Address.dart';




class seeaddress extends StatefulWidget {

  final Address value;

seeaddress( {Key key,this.value}):super(key:key);
 

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<seeaddress> {





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
                

                  Container(child: Text("The address is ${widget.value.hno},${widget.value.hname},${widget.value.loc},${widget.value.city},${widget.value.pin}"))
                ],

                
            )
              
        
      ),
    );
  }
}