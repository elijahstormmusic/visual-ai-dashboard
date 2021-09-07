import 'display.dart';
import 'cache.dart';
import '../content.dart';


class StoreContent extends DashboardContent {
  StoreContent(Map<String, dynamic> input)
    : super(
      text: input['text'],
      caption: input['caption'],
      details: input['details'],
      cryptlink: input['cryptlink'],
    )
  { }

  StoreContentDisplayPage navigateTo() {
    return StoreContentDisplayPage(cryptlink);
  }
}
