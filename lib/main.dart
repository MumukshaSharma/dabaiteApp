import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/student_plan_page.dart';
<<<<<<< HEAD
=======

>>>>>>> 26e948250eb83c3d590844c75650c2574a0fa7fb
const Color kelp = Color(0xFF242905);
const Color canary = Color(0xFFFFF95F);
const Color starkWhite = Color(0xFFF2ECDB);

void main() {
  runApp(const DabiteApp());
}

class DabiteApp extends StatelessWidget {
  const DabiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dabite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: starkWhite,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: kelp,
          onPrimary: Colors.white,
          secondary: canary,
          onSecondary: kelp,
          background: starkWhite,
          onBackground: kelp,
          surface: Colors.white,
          onSurface: kelp,
          error: Colors.red,
          onError: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: starkWhite,
          elevation: 0,
          iconTheme: IconThemeData(color: kelp),
          titleTextStyle: TextStyle(
            color: kelp,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kelp,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: LoginScreen(),
      routes: {
<<<<<<< HEAD
  '/student-plan': (context) => StudentPlanPage(),
},

=======
        '/student-plan': (context) => StudentPlanPage(),
      },
>>>>>>> 26e948250eb83c3d590844c75650c2574a0fa7fb
    );
  }
}