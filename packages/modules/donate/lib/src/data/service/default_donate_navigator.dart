import 'package:core/core.dart';
import 'package:donate/donate.dart';

class DefaultDonateNavigator extends DonateNavigator {
   DefaultDonateNavigator(super.router);

   @override
   Future<void> navigateToDonateScreen({
     NavigationType type = NavigationType.push,
   }) async {
     await navigateTo(
       DonateRoute(),
       type: type,
     );
   }
}