import 'package:dhyana/core/domain/entity/session.dart';
import 'package:flutter/material.dart';

import 'session_result.dart';

class SignedOutCompletedView extends StatelessWidget {

  final AppSession session;

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
