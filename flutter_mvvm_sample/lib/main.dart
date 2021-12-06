import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample/users_list/view_models/users_view_model.dart';
import 'package:flutter_mvvm_sample/users_list/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UsersViewModel()),
        ],
        child: MaterialApp(
          title: 'MVVM',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
        ),
    );
  }
}
