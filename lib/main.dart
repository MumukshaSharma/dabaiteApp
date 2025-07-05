import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/student_plan_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const Color kelp = Color(0xFF242905);
const Color canary = Color(0xFFFFF95F);
const Color starkWhite = Color(0xFFF2ECDB);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dxvoikklgumxjtprrwij.supabase.co', // ← put your project’s URL here
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR4dm9pa2tsZ3VteGp0cHJyd2lqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE2NjM4MjAsImV4cCI6MjA2NzIzOTgyMH0.LJeDSctmvrpvsSLPnww3ORnJaQ3NDcBOs8HM4Ut3Ego',                   // ← put your anon key here
  );
    print('✅ Supabase connected successfully!');
    
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
        '/student-plan': (context) => StudentPlanPage(),
      },
    );
  }
}