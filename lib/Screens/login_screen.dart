// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
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
//                   // Centering Welcome & Login Text
//                   Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center, // Centers children vertically
//                       children: const [
//                         Text(
//                           "Welcome",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),
//                         ),
//                         SizedBox(height: 10), // Space between text elements
//                         Text(
//                           "Login",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   _buildTextField("Email", "Enter your email address"),
//                   _buildTextField("Password", "Enter your password", obscureText: true), // Fix: "Confirm Password" changed to "Password"
//                   const SizedBox(height: 20),
//                   // Login Button
//                   Center(
//                     child: SizedBox(
//                       width: 200,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green[700],
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text("Login",
//                             style: TextStyle(fontSize: 18, color: Colors.white)),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 20),
//                   Center(
//                     child: TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         "Don't have an account? Sign Up",
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
//     path.quadraticBezierTo(size.width / 2, size.height - 5, size.width, size.height - 1);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
import 'dart:convert';
import 'package:app_coures/Screens/home_screen.dart';
import 'package:app_coures/Screens/naviget_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_coures/controllers/user_controller.dart';
import 'package:app_coures/models/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final UserController _userController = UserController();

  Future<void> handleLogin() async {
    setState(() {
      isLoading = true;
    });

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields.")),
      );
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      // Call UserController to handle login
      User? user = await _userController.login(email, password);

      if (user != null && user.token != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
        // Successfully logged in
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Welcome back, ${user.userName}!")),
        // );

        // Optionally save user data or token locally here if needed

        // Navigate to another screen (e.g., HomeScreen)
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        // Login failed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid login credentials!")),
        );
      }
    } catch (error) {
      // Handle any other errors (e.g., network errors)
      print(error);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: HeaderClipper(),
              child: Container(height: 330, color: Colors.green[700]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: const [
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("Email", "Enter your email", emailController),
                  _buildTextField(
                    "Password",
                    "Enter your password",
                    passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child:
                            isLoading
                                ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Don't have an account? Sign Up",
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

  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller, {
    bool obscureText = false,
  }) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
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
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 300);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 5,
      size.width,
      size.height - 1,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
