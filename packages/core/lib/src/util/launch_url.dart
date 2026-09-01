import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {

  const UrlLauncher();

  Future<bool> launchInAppWebView(String url) {
    return launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    );
  }

}
