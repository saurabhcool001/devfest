import 'package:devfest/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'index.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupApp();
  }

  //* Set App Color
  void setupApp() {
    configBloc = ConfigBloc();
    configBloc.darkMode = Devfest.preferences.getBool(Devfest.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state){
          return MaterialApp(
            title: 'Google Devfest',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: Devfest.google_sans_family,
              primarySwatch: Colors.red,
              primaryColor: configBloc.darkMode ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: configBloc.darkMode ? Colors.black : Colors.white,
              canvasColor: configBloc.darkMode ? Colors.black : Colors.grey[50],
              brightness: configBloc.darkMode ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                colorScheme: configBloc.darkMode ? ColorScheme.dark() : ColorScheme.light(),
              ),
              appBarTheme: AppBarTheme(
                elevation: 0.1,
              ),
            ),
            home: Scaffold(
              appBar: AppBar(),
              body: Container(),
            ),
          );
        },
      ),
    );
  }
}