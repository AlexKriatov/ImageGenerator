import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whimsy_games_preview_generator/page/picker.dart';
import 'package:whimsy_games_preview_generator/state/root_cubit.dart';
import 'util/material_color_generator.dart';
import 'package:desktop_window/desktop_window.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (context) => RootCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whimsy Games preview generator',
      theme: ThemeData(
        primarySwatch: MaterialColorGenerator.from(Colors.black),
      ),
      home: const MyHomePage(title: 'Whimsy Games preview generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    _invalidateWindowSize();
  }

  @override
  void didChangeDependencies() {
    _invalidateWindowSize();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    _invalidateWindowSize();
    super.didUpdateWidget(oldWidget);
  }

  Future _invalidateWindowSize() async {
    var size = await DesktopWindow.getWindowSize();
    setState(() {
      if (size.width != 1024 || size.height != 660) {
        _initWindowSize();
      }
    });
  }

  void _initWindowSize() async {
    await DesktopWindow.setMaxWindowSize(const Size(1024, 660));
    await DesktopWindow.setMinWindowSize(const Size(1024, 660));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const PickerPage());
  }
}
