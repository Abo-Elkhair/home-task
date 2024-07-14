import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/core/bloc_observer.dart';
import 'package:task3/core/network/cache_service.dart';
import 'package:task3/core/network/dio_service.dart';
import 'package:task3/core/utils/app_constants.dart';
import 'package:task3/features/home/presentation/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioService.init();
  CacheService.init();
  Bloc.observer = MyBlocObserver();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const Wasit());
}

class Wasit extends StatelessWidget {
  const Wasit({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: AppConstants.defaultFont,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
