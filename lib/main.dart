import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whimsy_games_preview_generator/page/root_page.dart';
import 'package:whimsy_games_preview_generator/state/root_cubit.dart';
import 'package:whimsy_games_preview_generator/state/tab_state.dart';
import 'package:whimsy_games_preview_generator/util/platform_util.dart';
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

const Size _windowsSize = Size(1024, 663);
const Size _macosSize = Size(1024, 660);

Size _platformWindowSize() {
  return isWindows() ? _windowsSize : _macosSize;
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
    final size = await WindowManager.instance.getSize();
    final platformSize = _platformWindowSize();
    setState(() {
      if (size.width != platformSize.width ||
          size.height != platformSize.height) {
        _initWindowSize();
      }
    });
  }

  void _initWindowSize() async {
    WindowManager.instance.setMaximizable(false);
    WindowManager.instance.setMaximumSize(_platformWindowSize());
    WindowManager.instance.setMinimumSize(_platformWindowSize());
    WindowManager.instance.setSize(_platformWindowSize());
    print('after invalidate window size');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            PopupMenuButton(
              onSelected: (state) => context.read<RootCubit>().switchTab(state),
              itemBuilder: (context) => [
                const PopupMenuItem(
                value: TabState.two,
                child: Text('Two'),
              ),
                const PopupMenuItem(
                  value: TabState.four,
                  child: Text('Four'),
                ),
                const PopupMenuItem(
                  value: TabState.eight,
                  child: Text('Eight'),
                ),],
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.tune),
              ),
            ),
          ],
        ),
        body: const PickerPage());
  }
}
