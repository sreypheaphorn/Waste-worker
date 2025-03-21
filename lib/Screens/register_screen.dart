
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
//       home: RegisterScreen(),
//     );
//   }
// }
// class RegisterScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green[50], // Light green background
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ClipPath(
//               clipper: HeaderClipper(),
//               child: Container(
//                 height: 330,
//                 color: Colors.green[700],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Center(
//                     child: Text(
//                       "Register your account",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   _buildTextField("Name", "Enter your full name"),
//                   _buildTextField("Username", "Enter a username"),
//                   _buildTextField("Email address", "Enter your email address"),
//                   _buildTextField("Password", "Enter your password", obscureText: true),
//                   _buildTextField("Confirm Password", "Enter your password again", obscureText: true),
//                   const SizedBox(height: 20),
                  
//                   // Sign Up Button
//                   Center(
//                     child: SizedBox(
//                       width:200,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green[700],
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text("Sign Up", style: TextStyle(fontSize: 18, color: Colors.white ,)),
//                       ),
//                     ),
//                   ),
                  
//                   const SizedBox(height: 20),
//                   Center(
//                     child: TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         "Already have an account? Sign in",
//                         style: TextStyle(color: Colors.green),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, String hint, {bool obscureText = false}) {
//     return Container(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
//           const SizedBox(height: 5),
//           TextField(
            
//             obscureText: obscureText,
//             decoration: InputDecoration(
//               hintText: hint,
//               border: OutlineInputBorder(
                
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: const BorderSide(color: Colors.green),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: const BorderSide(color: Colors.green, width: 2),
//               ),
//               contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Clipper for the curved header
// class HeaderClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height - 300);
//     path.quadraticBezierTo(size.width / 2, size.height + -5, size.width, size.height - 1);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }



import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50], // Light green background
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                height: 330,
                color: Colors.green[700],
              ),
            ),

            // Container ដែលមាន rotation
            Center(
              child: Container(
                width: 200,
                height: 300,
                transform: Matrix4.rotationZ(-123.28 * 3.1415927 / 180), // បម្លែងដឺក្រេទៅរ៉ាដៀន
                decoration: BoxDecoration(
                  // color: Colors.lime[600], // Lime color level 600
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Register your account",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("Name", "Enter your full name"),
                  _buildTextField("Username", "Enter a username"),
                  _buildTextField("Email address", "Enter your email address"),
                  _buildTextField("Password", "Enter your password", obscureText: true),
                  _buildTextField("Confirm Password", "Enter your password again", obscureText: true),
                  const SizedBox(height: 20),

                  // Sign Up Button
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Sign Up",
                            style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Already have an account? Sign in",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool obscureText = false}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 5),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.green, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// Clipper for the curved header
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 300);
    path.quadraticBezierTo(size.width / 2, size.height - 5, size.width, size.height - 1);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
