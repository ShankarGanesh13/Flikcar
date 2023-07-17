// import 'package:easy_image_viewer/easy_image_viewer.dart';
// import 'package:flutter/material.dart';

// class FullScreenImage extends StatelessWidget {
//   const FullScreenImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  MultiImageProvider multiImageProvider =
//                     MultiImageProvider(_imageProviders);
//                 showImageViewerPager(context, multiImageProvider,
//                     swipeDismissible: true, doubleTapZoomable: true);
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final String title;

//   const MyHomePage({
//     Key? key,
//     required this.title,
//   }) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _pageController = PageController();
//   static const _kDuration = Duration(milliseconds: 300);
//   static const _kCurve = Curves.ease;

//   final List<ImageProvider> _imageProviders = [
//     Image.network("https://picsum.photos/id/1001/4912/3264").image,
//     Image.network("https://picsum.photos/id/1003/1181/1772").image,
//     Image.network("https://picsum.photos/id/1004/4912/3264").image,
//     Image.network("https://picsum.photos/id/1005/4912/3264").image
//   ];

//   late final _easyEmbeddedImageProvider = MultiImageProvider(_imageProviders);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//               child: const Text("Show Multiple Images (Simple)"),
//               onPressed: () {
//                 MultiImageProvider multiImageProvider =
//                     MultiImageProvider(_imageProviders);
//                 showImageViewerPager(context, multiImageProvider,
//                     swipeDismissible: true, doubleTapZoomable: true);
//               }),
//           ElevatedButton(
//               child: const Text("Show Multiple Images (Custom)"),
//               onPressed: () {
//                 CustomImageProvider customImageProvider = CustomImageProvider(
//                     imageUrls: [
//                       "https://picsum.photos/id/1001/4912/3264",
//                       "https://picsum.photos/id/1003/1181/1772",
//                       "https://picsum.photos/id/1004/4912/3264",
//                       "https://picsum.photos/id/1005/4912/3264"
//                     ].toList(),
//                     initialIndex: 2);
//                 showImageViewerPager(context, customImageProvider,
//                     onPageChanged: (page) {
//                   // print("Page changed to $page");
//                 }, onViewerDismissed: (page) {
//                   // print("Dismissed while on page $page");
//                 });
//               }),
//         ],
//       )),
//     );
//   }
// }

// class CustomImageProvider extends EasyImageProvider {
//   @override
//   final int initialIndex;
//   final List<String> imageUrls;

//   CustomImageProvider({required this.imageUrls, this.initialIndex = 0})
//       : super();

//   @override
//   ImageProvider<Object> imageBuilder(BuildContext context, int index) {
//     return NetworkImage(imageUrls[index]);
//   }

//   @override
//   int get imageCount => imageUrls.length;
// }
