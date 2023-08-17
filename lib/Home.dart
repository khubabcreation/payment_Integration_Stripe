import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? paymentIntent;

    void displayPaymentSheet()async {
      try{
        await Stripe.instance.presentPaymentSheet();
        print('Done!!');

      }catch(e){
      print('Execution has been failed ::::: '+e.toString());
      }

    }

      createPayment() async {
      try {
        Map<String, dynamic> body = {"amount": "1000", "currency": "USD"};
        http.Response response = await http.post(
            Uri.parse("https://api.stripe.com/v1/payment_intents"),
            body: body,
            headers: {
              'Authorization':
                  'Bearer sk_test_51Nfdz6Ab1QtBJ3EgrtdpPw1ptSjnsOQDaIAH8wjCC4fRr2MZlr32DSj20TiE9S7T8WkyC4gYvWnaOqwmgVx4Pr1500QGGr11Wv',
              'Content-Type': 'application/x-www-form-urlencoded'
            });
        return jsonDecode(response.body);
      } catch (e) {
        print(
            'this is the Excaption which i caught by Khubaib ************************************************' +
                e.toString());
      }
    }

    makePayment()async{
      try{
        paymentIntent = await createPayment();
        var gpay = PaymentSheetGooglePay(merchantCountryCode: "US",
        currencyCode: "USD",
          testEnv: true,

        );
        /// idher ham stripe ko initiliaze karna laga han
    await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: "Khubaib",
          googlePay: gpay,
        ));
    displayPaymentSheet();
      }catch(e){
       print(e.toString());
      }

    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('Stripe payment integration'),
            ElevatedButton(onPressed: (){
              makePayment();
            }, child: Text('Paytem karo',style: TextStyle(fontWeight: FontWeight.bold),))
          ],),
        ),
      ),
    );
  }
}
