import 'display.dart';
import 'cache.dart';
import '../content.dart';


class NotificationContent extends DashboardContent {
  NotificationContent(Map<String, dynamic> input)
    : super(
      text: input['text'],
      caption: input['caption'],
      details: input['details'],
      cryptlink: input['cryptlink'],
    )
  { }

  NotificationContentDisplayPage navigateTo() {
    return NotificationContentDisplayPage(cryptlink);
  }
}
