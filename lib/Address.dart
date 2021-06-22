import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'global.dart' as global;


class Address extends StatefulWidget {
 

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {



  @override
  Widget build(BuildContext context) {
    
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Address',
          home: Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:(){Navigator.pop(context);}),
              
              centerTitle: true,
            backgroundColor: Colors.amber,
              title: const Text('Add address'),
            ),
            body: Column(
             
              children: [
               



                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      onSaved:(value){setState(() {
                        global.housenumber=value;
                      });} ,
                      onChanged:(value){setState(() {
                        global.housenumber=value;
                      });} ,
               decoration: InputDecoration(
               border : UnderlineInputBorder(),
               hintText: 'house no.'
               ),
               ),
                  ),




                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      onChanged:(value){setState(() {
                        global.housename=value;
                      });} ,
               decoration: InputDecoration(
               border : UnderlineInputBorder(),
               hintText: 'house name'
               ),
               ),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      onChanged:(value){setState(() {
                        global.locality=value;
                      });} ,
               decoration: InputDecoration(
               border : UnderlineInputBorder(),
               hintText: 'locality'
               ),
               ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      onChanged:(value){setState(() {
                        global.city=value;
                      });} ,
               decoration: InputDecoration(
               border : UnderlineInputBorder(),
               hintText: 'city'
               ),
               ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      onChanged:(value){setState(() {
                        global.pincode=value;
                      });} ,
               decoration: InputDecoration(
               border : UnderlineInputBorder(),
               hintText: 'pin'
               ),
               ),
                  ),

                  
                ],
            )
              
        
      ),
    );
  }
}