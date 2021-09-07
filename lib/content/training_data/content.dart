import 'display.dart';
import 'cache.dart';
import '../content.dart';


class TrainingDataContent extends DashboardContent {
  TrainingDataContent(Map<String, dynamic> input)
    : super(
      text: input['text'],
      caption: input['caption'],
      details: input['details'],
      cryptlink: input['cryptlink'],
    )
  { }

  TrainingDataContentDisplayPage navigateTo() {
    return TrainingDataContentDisplayPage(cryptlink);
  }
}
