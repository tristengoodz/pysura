import 'package:get/get.dart';

class MainPageController extends GetxController {
  final _title = 'Main Page'.obs;

  String get title => _title.value;

  set title(String value) => _title.value = value;
}