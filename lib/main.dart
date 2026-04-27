import 'package:first_aid_assisstant/screens/homescreen.dart';
import 'package:first_aid_assisstant/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'First Aid Assistant',
        themeMode: themeMode,

        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,

        home: const Homescreen(),
      );
  }
}
