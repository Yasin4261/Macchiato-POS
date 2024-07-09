import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macchiato_pos/services/auth_service.dart';
import 'package:macchiato_pos/viewmodels/time_viewmodel.dart';
import 'package:macchiato_pos/models/time_model.dart';
import 'package:macchiato_pos/views/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String _errorMessage = '';

  bool _obscureText = true; // Şifre gizliliği durumu
  late TimeViewModel _timeViewModel;

  @override
  void initState() {
    super.initState();
    _timeViewModel = TimeViewModel();
  }

  @override
  void dispose() {
    _timeViewModel.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    try {
      await _authService.login(
        _emailController.text,
        _passwordController.text,
      );
      context.go('/home');
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to login: $e';
      });
    }
  }

  Future<void> _register() async {
    // context.go('/register');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));

  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextButton(
                    onPressed: _register,
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth / 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<TimeModel>(
                      stream: _timeViewModel.timeStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Text(
                                snapshot.data!.currentTime,
                                style: const TextStyle(fontSize: 24),
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your email',
                      hintText: 'example@example.com',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText:
                        _obscureText, // Şifreyi gizlemek için kullanılır
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Enter your password',
                      hintText: '123',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                  if (_errorMessage.isNotEmpty) ...[
                    const SizedBox(height: 16.0),
                    Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "version 1.1",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
