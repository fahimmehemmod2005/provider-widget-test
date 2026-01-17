import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_text_field.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userName.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Consumer<LoginViewModel>(
              builder: (context, provider, child) {
                print('Widget Build');
                return Column(
                  children: [
                    CustomTextField(
                      label: 'Email',
                      hintText: 'Enter your email',
                      controller: _userName,
                      validator: provider.validateEmail,
                    ),
                    const SizedBox(height: 10),

                    CustomTextField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      controller: _password,
                      obscureText: provider.isPasswordHidden,
                      suffixIcon: IconButton(
                        onPressed: provider.togglePassword,
                        icon: Icon(
                          provider.isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: provider.validatePassword,
                    ),
                    const SizedBox(height: 10),

                    CustomTextField(
                      label: 'Confirm Password',
                      hintText: 'Confirm your password',
                      controller: _confirmPassword,
                      obscureText: provider.isConfirmHidden,
                      suffixIcon: IconButton(
                        onPressed: provider.toggleConfirm,
                        icon: Icon(
                          provider.isConfirmHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (val) => provider.validateConfirmPassword(
                          val, _password.text),
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('Email: ${_userName.text}');
                          print('Password: ${_password.text}');
                          print('Confirm Password: ${_confirmPassword.text}');

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Validation Passed! Form submitted successfully.',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              backgroundColor: Colors.green.shade700,
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 6, // shadow
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Validation Failed! Please check your inputs.',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              backgroundColor: Colors.red.shade700,
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 6,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            ),
                          );

                          print('Validation failed');
                        }
                      },
                      child: const Text('Submit'),
                    ),


                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
