import 'package:flutter/material.dart';
import 'package:macchiato_pos/viewmodels/time_viewmodel.dart';
import 'package:macchiato_pos/models/time_model.dart';
import 'package:macchiato_pos/services/auth_service.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String _errorMessage = '';
  late TimeViewModel _timeViewModel;

  @override
  void initState() {
    super.initState();
    _timeViewModel =
        TimeViewModel(); // veya _timeViewModel = getIt<TimeViewModel>(); gibi bir yöntemle ilklendirin
  }

  @override
  void dispose() {
    _timeViewModel.dispose();
    super.dispose();
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
                      style: TextStyle( fontSize: 15.0),
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
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your email',
                        hintText: 'example@example.com',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your password',
                      hintText: '123',
                      prefixIcon: Icon(Icons.password),
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
    try {
      await _authService.register(
        _emailController.text,
        _passwordController.text,
      );
      context.go('/home');
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to register: $e';
      });
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}
