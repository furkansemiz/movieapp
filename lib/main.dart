import 'package:flutter/material.dart';
import 'package:movieapp/widgets/authRouter.dart';
import 'package:provider/provider.dart';

import 'managers/movieManager.dart';
import 'managers/userManager.dart';
import 'mockServer/mockServer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MockServer().initializeServer();
  await MovieManager().initialize();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserManager>(create: (context) => UserManager()),
      ChangeNotifierProvider<MovieManager>(create: (context) => MovieManager()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthRouter(),
    );
  }
}
