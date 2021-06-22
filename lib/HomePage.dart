


import 'Account.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'Address.dart';
import 'Start.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Razorpay _razorpay;

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
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIos: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIos: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }


  void callRazorpay() async {
    var options = {
      'key': 'rzp_test_H0ha5f5mkLPsup',
      'amount': 10000,
      'name': 'Rahul',
      'description': 'for Payment',
      'prefill': {'contact': '9927281912', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };



    try{
      _razorpay.open(options);
    }
    catch(msg){
      print(msg);

    }

  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text('hello'),
        
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
        children:<Widget> [
            DrawerHeader(
              
            decoration: BoxDecoration(
          color: Colors.green,
          
            
          ),
           child: Text("Hello  ${user.displayName}",style: TextStyle(fontSize: 20,color: Colors.white,),textAlign: TextAlign.center,),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Account"),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){return Account();}));
            },
          ),
          ListTile(
            leading: Icon(Icons.home_sharp),
            title: Text("add address"),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){return Address();}));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: (){
              showDialog(context: context, builder:(BuildContext context)=>AlertDialog(title: Text("log out"),content: Text("sure?"),
              actions: [
               ElevatedButton(onPressed:(){Navigator.pop(context);}, child: Text("yes")),
               ElevatedButton(onPressed:(){Navigator.pop(context);}, child: Text("No")),

              ],
              ),
              );
            },
          ),
          
        ],  
        ),
        ),
        








        body: Center(
          child: Container(
      child: !isloggedin
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  SizedBox(height: 40.0),
                  Container(
                    height: 300,
                    child: Image(
                      image: AssetImage("images/eagle1.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                        child: Text(
                          "Hello ${user.displayName} . You are Logged in as ${user.email}",
                          style:
                              TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,color: Colors.red),
                        ),
                      ),
                      ElevatedButton(onPressed: (){
                        callRazorpay();
                      }, child:Text("razorpay"))

                   
                  ],
              ),
              
    ),
        ),
    );
  }
}
