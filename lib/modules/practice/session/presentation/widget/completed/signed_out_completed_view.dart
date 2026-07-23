import 'package:dhyana/model/session.dart';
import 'package:flutter/material.dart';

import 'session_result.dart';

class SignedOutCompletedView extends StatelessWidget {

  final Session session;

  const SignedOutCompletedView({
    required this.session,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SessionResult(
          session: session,
        )
      ],
    );
  }

}
