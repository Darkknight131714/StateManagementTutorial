import 'package:flutter/material.dart';
import 'apptitle.dart';
import 'package:provider/provider.dart';

String appbarTitle = "MyTutorial";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyAppBarTitle>(
      create: (context) {
        return MyAppBarTitle(title: appbarTitle);
      },
      child: Scaffold(
        appBar: MyAppBar(),
        body: MyTextField(),
      ),
    );
  }
}

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Provider.of<MyAppBarTitle>(context).title),
    );
  }
}

class MyTextField extends StatefulWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        Provider.of<MyAppBarTitle>(context, listen: false).changeTitle(value);
      },
    );
  }
}
