import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whimsy_games_preview_generator/page/picker.dart';
import 'package:whimsy_games_preview_generator/state/root_cubit.dart';
import 'util/material_color_generator.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.setResizable(false);
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
      title: 'Whimsy Games Art Report Generator',
      theme: ThemeData(
        primarySwatch: MaterialColorGenerator.from(Colors.black),
      ),
      home: const MyHomePage(title: 'Whimsy Games Art Report Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _invalidateWindowSize();
    });
  }

  Future _invalidateWindowSize() async {
    var size = await WindowManager.instance.getSize();
    setState(() {
      if (size.width != 1024 || size.height != 660) {
        _initWindowSize();
      }
    });
  }

  void _initWindowSize() async {
    WindowManager.instance.setMaximizable(false);
    WindowManager.instance.setMaximumSize(const Size(1024, 660));
    WindowManager.instance.setMinimumSize(const Size(1024, 660));
    WindowManager.instance.setSize(const Size(1024, 660));
    print('after invalidate window size');
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
