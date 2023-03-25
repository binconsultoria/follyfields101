import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:folly_fields/folly_fields.dart';
import 'package:follyfields101/utils/config.dart';
import 'package:follyfields101/views/my_entity_list.dart';

///
///
///
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FollyFields.start(Config());

  runApp(const MyApp());
}

///
///
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bin Consultoria',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: SchedulerBinding.instance.window.platformBrightness,
      ),
      home: const MyHomePage(),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('pt', 'BR'),
      ],
    );
  }
}

///
///
///
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

///
///
///
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bin Consultoria'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ///
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyEntityList(),
                    ),
                  );
                },
                child: const Text('LISTAR PESSOAS'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
