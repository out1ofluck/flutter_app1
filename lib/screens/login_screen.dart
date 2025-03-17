import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart'; // Импортируем GoRouter
import 'package:flutter_application_1/auth/auth_bloc.dart';
import 'package:flutter_application_1/auth/auth_state.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Вход')),
      body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(labelText: 'Пароль'),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.go('/home');
            }
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                if (state is AuthLoading)
                  const CircularProgressIndicator(), // Индикатор загрузки
                const SizedBox(height: 10), // Отступ
                ElevatedButton(
                  onPressed: state is AuthLoading
                      ? null // Делаем кнопку неактивной во время загрузки
                      : () {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          context.read<AuthBloc>().add(LogInEvent(email, password));
                        },
                  child: const Text('Войти'),
                ),
              ],
            );
          },
        ),
        TextButton(
          onPressed: () {
            context.go('/signup');
          },
          child: const Text('Нет аккаунта? Зарегистрируйтесь'),
        ),
      ],
    ),
  ),
),
    );
  }
}