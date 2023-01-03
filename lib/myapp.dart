import 'package:flutter/material.dart';
import 'package:qr_generate/core/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  static final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        title: 'Qr Generate',
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: .3,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style:
                ElevatedButton.styleFrom(primary: Colors.white.withOpacity(.9)),
          ),
        ),
      ),
    );
  }
}
