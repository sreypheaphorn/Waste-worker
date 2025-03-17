// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WasteToWealthScreen(),
//     );
//   }
// }

// class WasteToWealthScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: CustomPaint(
//               painter: CurvedBackgroundPainter(),
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   'assets/icon/Rectangle 3.png', 
//                   width: 100,
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "Waste-To-Wealth",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green.shade600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom Painter for the Curved Background
// class CurvedBackgroundPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = Colors.green.shade700;
//     Path path = Path();

//     path.moveTo(0, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     canvas.drawPath(path, paint);

//     Paint lightGreenPaint = Paint()..color = Colors.green.shade100;
//     Path lightGreenPath = Path();

//     lightGreenPath.moveTo(0, size.height * 0.25);
//     lightGreenPath.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25);
//     lightGreenPath.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
//     lightGreenPath.lineTo(size.width, size.height * 0.75);
//     lightGreenPath.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.65, size.width * 0.5, size.height * 0.75);
//     lightGreenPath.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.85, 0, size.height * 0.75);
//     lightGreenPath.close();

//     canvas.drawPath(lightGreenPath, lightGreenPaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WasteToWealthScreen(),
    );
  }
}

class WasteToWealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: CurvedBackgroundPainter(),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icon/Rectangle 3.png', 
                  width: 100,
                ),
                SizedBox(height: 10),
                Text(
                  "Waste-To-Wealth",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for the Curved Background
class CurvedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.green.shade700;
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);

    Paint lightGreenPaint = Paint()..color = Colors.green.shade100;
    Path lightGreenPath = Path();

    lightGreenPath.moveTo(0, size.height * 0.25);
    lightGreenPath.quadraticBezierTo(
        size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25);
    lightGreenPath.quadraticBezierTo(
        size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    lightGreenPath.lineTo(size.width, size.height * 0.75);
    lightGreenPath.quadraticBezierTo(
        size.width * 0.75, size.height * 0.65, size.width * 0.5, size.height * 0.75);
    lightGreenPath.quadraticBezierTo(
        size.width * 0.25, size.height * 0.85, 0, size.height * 0.75);
    lightGreenPath.close();

    canvas.drawPath(lightGreenPath, lightGreenPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}






// class WasteToWealthScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: CustomPaint(
//               painter: CurvedBackgroundPainter(),
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   'assets/icon/Rectangle 3.png', 
//                   width: 100,
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "Waste-To-Wealth",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green.shade600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom Painter for the Curved Background
// class CurvedBackgroundPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = Colors.green.shade700;
//     Path path = Path();

//     path.moveTo(0, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     canvas.drawPath(path, paint);

//     Paint lightGreenPaint = Paint()..color = Colors.green.shade100;
//     Path lightGreenPath = Path();

//     lightGreenPath.moveTo(0, size.height * 0.25);
//     lightGreenPath.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25);
//     lightGreenPath.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
//     lightGreenPath.lineTo(size.width, size.height * 0.75);
//     lightGreenPath.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.65, size.width * 0.5, size.height * 0.75);
//     lightGreenPath.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.85, 0, size.height * 0.75);
//     lightGreenPath.close();

//     canvas.drawPath(lightGreenPath, lightGreenPaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
