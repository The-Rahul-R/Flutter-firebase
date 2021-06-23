import 'package:authentication/seeaddress.dart';
import 'package:flutter/material.dart';


import 'global.dart' as global;


class Address extends StatefulWidget {
 final String hno,hname,loc,city,pin;
  Address({this.city,this.hname,this.hno,this.loc,this.pin});

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
var hnocontroller = new TextEditingController(text:"");
var hnamecontroller = new TextEditingController(text:"");
var loccontroller = new TextEditingController(text:"");
var pincontroller = new TextEditingController(text:"");
var citycontroller = new TextEditingController(text:"");


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
                      controller: hnocontroller,
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
                      controller: hnamecontroller,
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
                      controller: loccontroller,
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
                      controller: citycontroller,
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
                      controller: pincontroller,
                      onChanged:(value){setState(() {
                        global.pincode=value;
                      });} ,
               decoration: InputDecoration(
               border : UnderlineInputBorder(),
               hintText: 'pin'
               ),
               ),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => seeaddress(value:Address(hno:hnocontroller.text.toString(),hname:hnamecontroller.text.toString(),
              loc:loccontroller.text.toString(),city:citycontroller.text.toString(),pin: pincontroller.text.toString(),) ),
              ),
            );
                  }, child: Text("add"))

                 
                ],
            )
            
              
        
      ),
    );
  }
}

