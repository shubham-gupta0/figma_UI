import 'package:get/get.dart';
import 'package:webui/app/routes/app_routes.dart';
import '../modules/feedback/feedback_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.feedback, page: () => FeedbackView()),
  ];
}
