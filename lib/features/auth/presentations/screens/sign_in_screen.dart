import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/features/auth/presentations/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 120),
                AppLogo(width: 100),
                const SizedBox(height: 24),
                Text('Welcome back',style: textTheme.titleLarge,),
                Text('Please enter your email and password',style: textTheme.bodySmall,),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',

                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {},
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
