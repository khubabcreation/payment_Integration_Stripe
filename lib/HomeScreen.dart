// import 'package:flutter/material.dart';
// import 'package:stripe_payment/stripe_payment.dart';
//
// class StripePaymentScreen extends StatefulWidget {
//   @override
//   _StripePaymentScreenState createState() => _StripePaymentScreenState();
// }
//
// class _StripePaymentScreenState extends State<StripePaymentScreen> {
//   @override
//   void initState() {
//     super.initState();
//     StripePayment.setOptions(
//       StripeOptions(
//         publishableKey: "pk_test_51Nfdz6Ab1QtBJ3EgDqEZ5m7tuPTSC8VtOjM3KG8bOFRiqfxbRUgBNM8nvrRAdXHP5G9SNl74V13HFobzBI9b2GpP00ShTO6Jru",
//       ),
//     );
//   }
//
//   Future<void> _performStripePayment() async {
//     try {
//       PaymentMethod paymentMethod = await StripePayment.paymentRequestWithCardForm(
//         CardFormPaymentRequest(),
//       );
//
//       // Send paymentMethod.id to your server for further processing
//       // The server should use the secret key to process the payment
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Payment Successful')),
//       );
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Payment Error: $error')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stripe Payment Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _performStripePayment,
//           child: Text('Make Payment'),
//         ),
//       ),
//     );
//   }
// }
