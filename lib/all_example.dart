import 'package:flutter/material.dart';

class AllIconsSample extends StatefulWidget {
  const AllIconsSample({Key? key}) : super(key: key);

  @override
  State<AllIconsSample> createState() => _AllIconsSampleState();
}

class _AllIconsSampleState extends State<AllIconsSample>
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
          title: const Text("Samples"),
        ),
      
      
      body:
    
     SingleChildScrollView(
        child: Column(children: [
      const Text("pause_play"),
      AnimatedIcon(
        progress: _acForIcon,
        icon: AnimatedIcons.pause_play,
        size: 88,
      ),
      Column(
        children: [
          const Text("add_event"),
          AnimatedIcon(
            progress: _acForIcon,
            icon: AnimatedIcons.add_event,
            size: 88,
          ),
        ],
      ),
      const Text("add_event"),
      AnimatedIcon(
        progress: _acForIcon,
        icon: AnimatedIcons.arrow_menu,
        size: 88,
      ),
      const Text("close_menu"),
      AnimatedIcon(
        progress: _acForIcon,
        icon: AnimatedIcons.close_menu,
        size: 88,
      ),
      const Text("ellipsis_search"),
      AnimatedIcon(
        progress: _acForIcon,
        icon: AnimatedIcons.ellipsis_search,
        size: 88,
      ),
      const Text("home_menu"),
      AnimatedIcon(
        progress: _acForIcon,
        icon: AnimatedIcons.home_menu,
        size: 88,
      ),
      const Text("list_view"),
      AnimatedIcon(
        progress: _acForIcon,
        icon: AnimatedIcons.list_view,
        size: 88,
      ),
      const Text("arrow_menu"),
      AnimatedIcon(
        progress: _acForIcon,
        icon: AnimatedIcons.arrow_menu,
        size: 88,
      ),
      const Text("menu_close"),
      AnimatedIcon(
        progress: _acForIcon,
        icon: AnimatedIcons.menu_close,
        size: 88,
      ),
      const Text("menu_home"),
      AnimatedIcon(
        progress: _acForIcon,
        icon: AnimatedIcons.menu_home,
        size: 88,
      ),
      const Text("play_pause"),
      AnimatedIcon(
        progress: _acForIcon,
        icon: AnimatedIcons.play_pause,
        size: 88,
      ),
      const Text("view_list"),
      AnimatedIcon(
        progress: _acForIcon,
        icon: AnimatedIcons.view_list,
        size: 88,
      ),
      ElevatedButton(onPressed: _switch, child: const Text("Animate All")),
        ])));
  }
}
