import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/models/topic_repository.dart';
import 'package:video_player/screens/topic.dart';
import 'package:video_player/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return TopicRepository();
          }
        )
      ],
      child: Consumer<TopicRepository>(
        builder: (context, topicRepository, child) {
          final newTextTheme = Theme.of(context).textTheme.apply(
            bodyColor: CustomColors.lightGrey,
            displayColor: CustomColors.lightGrey,
          );
          return MaterialApp(
            title: "Video Player",
            theme: ThemeData(
              primarySwatch: Colors.green,
              canvasColor: CustomColors.darkerGrey,
              textTheme: newTextTheme
            ),
            home: Topic(),
          );
        }
      ),
    );
  }
}