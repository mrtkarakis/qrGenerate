import 'package:flutter/material.dart';
import 'package:qr_generate/global.dart';

import 'pages/mainPages/main_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qr Generate',
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade200),
        // theme: ThemeData.dark().copyWith(
        //   backgroundColor: Colors.blue.shade900,
        //   scaffoldBackgroundColor: Colors.blue.shade900,
        //   textTheme: TextTheme(
        //       bodyMedium:
        //           TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(primary: Colors.purple.shade400),
        //   ),
        // ),
        home: const MyHomePage(),
      ),
    );
  }
}
