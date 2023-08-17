import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:oppp/Home.dart';
import 'package:oppp/HomeScreen.dart';
import 'package:http/http.dart' as http;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
Stripe.publishableKey = "pk_test_51Nfdz6Ab1QtBJ3EgDqEZ5m7tuPTSC8VtOjM3KG8bOFRiqfxbRUgBNM8nvrRAdXHP5G9SNl74V13HFobzBI9b2GpP00ShTO6Jru";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
