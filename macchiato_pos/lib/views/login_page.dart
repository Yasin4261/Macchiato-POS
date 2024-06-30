import 'package:flutter/material.dart';
import 'package:macchiato_pos/viewmodels/time_viewmodel.dart';
import 'package:macchiato_pos/models/time_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.0, top: 16),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.blue,
                    size: 20.0,
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
                          return Text(
                            snapshot.data!.currentTime,
                            style: const TextStyle(fontSize: 24),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your name',
                        hintText: 'John Doe',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText:
                        _obscureText, // Şifreyi gizlemek için kullanılır
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

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}
