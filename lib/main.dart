import 'package:window_manager/window_manager.dart';

import 'UI/Screens/add_card_screen.dart';
import 'UI/Screens/add_upi.dart';
import 'UI/Screens/declined_request.dart';
import 'UI/Screens/failed_result.dart';
import 'UI/Screens/initial_screen.dart';
import 'UI/Screens/loan_agreement_screen.dart';
import 'UI/Screens/payment_screen.dart';
import 'UI/Screens/paymentinfo_screen.dart';
import 'UI/Screens/select_upi.dart';
import 'UI/Screens/signup_screen.dart';
import 'UI/Screens/success_request.dart.dart';
import 'UI/Screens/success_result.dart';
import 'UI/Screens/upi_payment_screen.dart';
import 'UI/Screens/verification_screen.dart';
import 'provider/loan_provider.dart';
import 'provider/upiID_provider.dart';
import 'provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(650, 750),
    center: true,
    minimumSize: Size(400, 690),
    maximumSize: Size(607, 874)
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoansProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpiIDProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0xFF17BA4D),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const InitialScreen(),
          'login_signup': (_) => const SignUpScreen(),
          'verification_screen': (_) => const VerificationScreen(),
          'loan_agreement': (_) => const LoanAgreementScreen(),
          'home_screen': (_) => const PaymentInfoScreen(),
          'success_result': (_) => const SuccessResultScreen(),
          'success_request': (_) => const SuccessRequestScreen(),
          'failed_result': (_) => const FailedResultScreen(),
          'declined_request': (_) => const DeclinedRequestScreen(),
          'payment_method': (_) => const PaymentScreen(),
          'upi_payment': (_) => const UpiPaymentScreen(),
          'add_card': (_) => const AddCardScreen(),
          'select_upi': (_) => const SelectUpiScreen(),
          'add_upi': (_) => const AddUpiIdScreen(),
        },
      ),
    );
  }
}
