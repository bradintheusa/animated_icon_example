import 'package:flutter/material.dart';

import 'all_example.dart';

void main() {
  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedIcon Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleAppMainPage(title: 'AnimatedIcon Home Page'),
    );
  }
}

class SampleAppMainPage extends StatefulWidget {
  const SampleAppMainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SampleAppMainPage> createState() => _SampleAppMainPageState();
}

class _SampleAppMainPageState extends State<SampleAppMainPage>
    with SingleTickerProviderStateMixin {
  bool firstIconShowing = true;
  late AnimationController _acForIcon;

  @override
  void initState() {
    super.initState();
    _acForIcon = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
  }

  @override
  void dispose() {
    _acForIcon.dispose();
    super.dispose();
  }

  void _switch() {
    setState(() {
      firstIconShowing ? _acForIcon.forward() : _acForIcon.reverse();
      firstIconShowing = !firstIconShowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(children: [
          AnimatedIcon(
            progress: _acForIcon,
            icon: AnimatedIcons.pause_play,
            size: 88,
          ),
          ElevatedButton(onPressed: _switch, child: const Text("Animate")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllIconsSample()),
                );
              },
              child: const Text("Show All"))
        ])));
  }
}
