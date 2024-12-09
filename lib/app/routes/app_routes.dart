import 'package:ecorevadmin/app/pages/login/login_page.dart';
import 'package:get/get.dart';


class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => LoginPage()),
  ];
}
