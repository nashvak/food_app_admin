import 'package:flutter/material.dart';
import 'package:food_app_admin/screens/dashboard/widgets/dashboard_heading.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardHeading(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DashboardCard(
                    title: 'Total orders',
                    amount: 50,
                    icon: Icon(Icons.food_bank),
                    background: Colors.red.shade200,
                  ),
                  DashboardCard(
                    title: 'Not compeleted',
                    amount: 10,
                    icon: Icon(Icons.food_bank),
                    background: Colors.green.shade200,
                  ),
                  DashboardCard(
                    title: 'Delivered',
                    amount: 20,
                    icon: Icon(Icons.food_bank),
                    background: Colors.purple.shade200,
                  ),
                  DashboardCard(
                    title: 'Cancelled',
                    amount: 10,
                    icon: Icon(Icons.food_bank),
                    background: Colors.orange.shade200,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Summary',
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
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
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
