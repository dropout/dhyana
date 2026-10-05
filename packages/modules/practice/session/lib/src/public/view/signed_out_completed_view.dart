import 'package:session/src/public/model/session.dart';
import 'package:material_ui/material_ui.dart';

import 'package:session/src/public/view/session_result.dart';


class const SignedOutCompletedView({
  required final Session session,
  super.key,
}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SessionResult(
        session: session,
      ),
    );
  }

}
