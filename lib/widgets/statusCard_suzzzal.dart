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
      home: Scaffold(
        backgroundColor: const Color(0xFFF6F8FC),
        appBar: AppBar(
          title: const Text('Status Card Examples'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Text(
                'crafted by suzzzal',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                StatusNotice(
                  color: Colors.green,
                  icon: Icons.check,
                  title: 'Meal Plan Updated',
                  message:
                      'Your weekly meal plan has been successfully updated for the next 7 days.',
                  actionText: 'View Plan',
                ),
                SizedBox(height: 14),
                StatusNotice(
                  color: Colors.orange,
                  icon: Icons.warning_amber_rounded,
                  title: 'Menu Change',
                  message:
                      'Tomorrow\'s dinner menu has been changed due to ingredient unavailability.',
                ),
                SizedBox(height: 14),
                StatusNotice(
                  color: Colors.red,
                  icon: Icons.close,
                  title: 'Payment Failed',
                  message:
                      'Your mess fee payment could not be processed. Please try again.',
                  actionText: 'Retry',
                ),
                SizedBox(height: 14),
                StatusNotice(
                  color: Colors.blue,
                  icon: Icons.info_outline,
                  title: 'New Feature Available',
                  message:
                      'Check out our new nutrition tracking feature to monitor your daily intake.',
                  actionText: 'Learn More',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatusNotice extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String message;
  final String? actionText;

  const StatusNotice({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.message,
    this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.grey.shade700,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (actionText != null) ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  actionText!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'by suzzzal',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade500,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
