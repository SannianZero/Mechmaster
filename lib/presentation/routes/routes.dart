import 'package:get/get.dart';
import '../views/welcome.dart';
import '../views/loggin/loggin.dart';
import '../views/loggin/create_account.dart';
import '../views/home.dart';


class Routes {
  static const String home = '/home';
  static const String login = '/login';
  static const String welcome = '/welcome';
  static const String createAccount = '/createAccount';

  static final List<GetPage> pages = [
    GetPage(name: welcome, page: () => WelcomeView()),
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: home, page: () => HomeView()),
    GetPage(name: createAccount, page: () => CreateAccount()),
  ];
}
