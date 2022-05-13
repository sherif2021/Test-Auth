import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_auth/app/core/routes/app_pages.dart';

class AuthHomeView extends StatelessWidget {
  const AuthHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/logo.jpg',
              height: 150,
              width: 150,
            ),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Let\'s Share your talent with the world',
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: () => Get.toNamed(Routes.LOGIN),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75),
                child: Text(
                  'Sign in with Email',
                  style: Get.theme.textTheme.bodyMedium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: .7,
                    ),
                  ),
                  Text('OR'),
                  Expanded(
                    child: Divider(
                      thickness: .7,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: OutlinedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Sign up with Google',
                      style: Get.theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: OutlinedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/facebook.png',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Sign up with Facebook',
                      style: Get.theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account? '),
                TextButton(
                    onPressed: () => Get.toNamed(Routes.REGISTER),
                    child: const Text('Sign up')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
