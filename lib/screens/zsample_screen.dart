import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  List<Widget> widgets = [
    Container(
      height: 200,
      width: 200,
      color: Colors.red,
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.blue,
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.green,
    ),
  ];

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              _navigateToPage(pageController.page!.toInt() - 1);
            },
            child: Text("Back"),
          ),
          ElevatedButton(
            onPressed: () {
              _navigateToPage(pageController.page!.toInt() + 1);
            },
            child: Text("Next"),
          ),
        ],
      ),
      body: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return widgets[index];
        },
        itemCount: widgets.length,
      ),
    );
  }

  void _navigateToPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < widgets.length) {
      pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
