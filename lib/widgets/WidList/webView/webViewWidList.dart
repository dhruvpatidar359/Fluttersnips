
// need to be tested


// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:provider/provider.dart';

// import 'package:ptuepapers/controller/utilscontroller.dart';

// class InAppBrowserPage extends StatefulWidget {
//   final urlWeb;
//   const InAppBrowserPage({required this.urlWeb, Key? key}) : super(key: key);

//   @override
//   State<InAppBrowserPage> createState() => _InAppBrowserPageState();
// }

// class _InAppBrowserPageState extends State<InAppBrowserPage> {
//   // double _progress = 0;
//   late InAppWebViewController webView;
//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             InAppWebView(
//               initialUrlRequest: URLRequest(url: Uri.parse(widget.urlWeb)),
//               onWebViewCreated: (InAppWebViewController controller) {
//                 webView = controller;
//               },
//               onProgressChanged:
//                   (InAppWebViewController controller, int progress) {
//                 Provider.of<UtilsController>(context, listen: false)
//                     .progreessBar(progress / 100);
//               },
//             ),
//             Consumer<UtilsController>(
//               builder: ((context, value, child) {
//                 return value.progress < 1
//                     ? SizedBox(
//                         height: 3,
//                         child: LinearProgressIndicator(
//                           value: value.progress,
//                           backgroundColor: Theme.of(context)
//                               .colorScheme
//                               .secondary
//                               .withOpacity(0.2),
//                           // valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
//                         ),
//                       )
//                     : const SizedBox();
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }