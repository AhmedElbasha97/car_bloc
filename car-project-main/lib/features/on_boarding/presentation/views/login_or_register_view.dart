import 'package:flutter/material.dart';

import 'widgets/login_or_register_view_body.dart';

class LoginOrRegisterView extends StatelessWidget {
  const LoginOrRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: LoginOrRegisterViewBody(),
      ),
    );
  }
}
