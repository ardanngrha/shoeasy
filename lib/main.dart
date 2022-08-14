import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeasy/pages/cart_page.dart';
import 'package:shoeasy/pages/checkout_page.dart';
import 'package:shoeasy/pages/checkout_success_page.dart';
import 'package:shoeasy/pages/detail_chat_page.dart';
import 'package:shoeasy/pages/edit_profile_page.dart';
import 'package:shoeasy/pages/home/main_page.dart';
import 'package:shoeasy/pages/sign_in_page.dart';
import 'package:shoeasy/pages/splash_page.dart';
import 'package:shoeasy/pages/sign_up_page.dart';
import 'package:shoeasy/providers/auth_provider.dart';
import 'package:shoeasy/providers/cart_provider.dart';
import 'package:shoeasy/providers/product_provider.dart';
import 'package:shoeasy/providers/transaction_provider.dart';
import 'package:shoeasy/providers/wishlist_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChatPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
      ),
    );
  }
}
