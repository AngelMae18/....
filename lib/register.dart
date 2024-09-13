import 'package:flutter/material.dart';

void main() {
  runApp(MoodClickApp());
}

class MoodClickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text controllers for each input field
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController studentNumberController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Function to handle registration (ready for backend integration)
  void _register() {
    if (_formKey.currentState!.validate()) {
      // Here you would send the data to the backend for registration
      String nickname = nicknameController.text;
      String age = ageController.text;
      String studentNumber = studentNumberController.text;
      String department = departmentController.text;
      String email = emailController.text;
      String password = passwordController.text;

      // Perform the backend registration logic
    }
  }

  // Function to handle Google sign-in
  void _signInWithGoogle() {
    // Add logic to handle Google sign-in
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Text(
                  "Hello! Register to get started",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField(nicknameController, "Nickname"),
                SizedBox(height: 10),
                _buildTextField(ageController, "Age"),
                SizedBox(height: 10),
                _buildTextField(studentNumberController, "Student Number"),
                SizedBox(height: 10),
                _buildTextField(departmentController, "Department"),
                SizedBox(height: 10),
                _buildTextField(emailController, "Email"),
                SizedBox(height: 10),
                _buildTextField(passwordController, "Password", obscureText: true),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF586EFF), // Match the button color
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(child: Text("Or Login with")),
                SizedBox(height: 10),
                Center(
                  child: GestureDetector(
                    onTap: _signInWithGoogle,
                    child: Image.asset(
                      'assets/google_logo.png', // Add the Google logo in your assets folder
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the Login screen
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Login Now',
                            style: TextStyle(
                              color: Color(0xFF586EFF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}
