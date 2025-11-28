import 'package:fixed_width_underline_tab_indicator/fixed_width_underline_tab_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FixedWidthUnderlineTabIndicator Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'FixedWidthUnderlineTabIndicator Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: tabController,
          indicator: FixedWidthUnderlineTabIndicator(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              style: BorderStyle.solid,
              width: 4,
            ),
            width: 15,
          ),
          dividerColor: Colors.transparent,
          tabs: [
            Tab(text: "首页"),
            Tab(text: "设置"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(child: Text("首页内容")),
          Center(child: Text("设置内容")),
        ],
      ),
    );
  }
}
