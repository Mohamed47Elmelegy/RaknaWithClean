import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:clean_rakna/core/services/bloc_observer_service.dart';
import 'package:clean_rakna/core/services/shared_preferences_sengltion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/routes/routes/page_routes_name.dart';
import 'core/routes/routes/routes.dart';
import 'core/services/get_it_services.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserverService();
  await Firebase.initializeApp();
  await Prefs.init();
  getItSetup();
  runApp(const Rakna());
}

class Rakna extends StatelessWidget {
  const Rakna({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Clean Rakna',
      navigatorKey: navigatorKey,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: PageRoutesName.initial,
    );
  }
}
