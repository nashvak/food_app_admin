import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_admin/bloc/auth/auth_bloc.dart';
import 'package:food_app_admin/screens/dashboard/widgets/dashboard_heading.dart';
import 'package:food_app_admin/screens/login/login.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final AuthState = context.watch<AuthBloc>().state as LoginSuccess;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(Logout());
              },
              child: const Text('Logout'))
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DashboardHeading(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      DashboardCard(
                        title: 'Total orders',
                        amount: 50,
                        icon: const Icon(Icons.food_bank),
                        background: Colors.red.shade200,
                      ),
                      DashboardCard(
                        title: 'Not compeleted',
                        amount: 10,
                        icon: const Icon(Icons.food_bank),
                        background: Colors.green.shade200,
                      ),
                      DashboardCard(
                        title: 'Delivered',
                        amount: 20,
                        icon: const Icon(Icons.food_bank),
                        background: Colors.purple.shade200,
                      ),
                      DashboardCard(
                        title: 'Cancelled',
                        amount: 10,
                        icon: const Icon(Icons.food_bank),
                        background: Colors.orange.shade200,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Summary',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.background,
  });
  final String title;
  final double amount;
  final Icon icon;
  final Color background;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            icon,
            Text(title),
            Text(
              amount.toString(),
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
