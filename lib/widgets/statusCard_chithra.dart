import 'package:flutter/material.dart';
class StatusCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final StatusType statusType;
  final String? actionButtonText;
  final VoidCallback? onActionPressed;
  final bool showDismissButton;
  final VoidCallback? onDismiss;
  final Color? customBackgroundColor;
  final Color? customIconColor;
  const StatusCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    this.statusType = StatusType.info,
    this.actionButtonText,
    this.onActionPressed,
    this.showDismissButton = false,
    this.onDismiss,
    this.customBackgroundColor,
    this.customIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = _getColorScheme();
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colorScheme.borderColor,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: customBackgroundColor ?? colorScheme.backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colorScheme.iconBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      icon,
                      color: customIconColor ?? colorScheme.iconColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (showDismissButton)
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      color: Colors.grey[600],
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: onDismiss,
                    ),
                ],
              ),
              if (actionButtonText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onActionPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.buttonColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        actionButtonText!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
  _StatusColorScheme _getColorScheme() {
    switch (statusType) {
      case StatusType.success:
        return _StatusColorScheme(
          backgroundColor: const Color(0xFFE8F5E9),
          borderColor: const Color(0xFF81C784),
          iconColor: const Color(0xFF2E7D32),
          iconBackgroundColor: const Color(0xFFC8E6C9),
          buttonColor: const Color(0xFF43A047),
        );
      case StatusType.warning:
        return _StatusColorScheme(
          backgroundColor: const Color(0xFFFFF3E0),
          borderColor: const Color(0xFFFFB74D),
          iconColor: const Color(0xFFE65100),
          iconBackgroundColor: const Color(0xFFFFE0B2),
          buttonColor: const Color(0xFFFB8C00),
        );
      case StatusType.error:
        return _StatusColorScheme(
          backgroundColor: const Color(0xFFFFEBEE),
          borderColor: const Color(0xFFE57373),
          iconColor: const Color(0xFFC62828),
          iconBackgroundColor: const Color(0xFFFFCDD2),
          buttonColor: const Color(0xFFD32F2F),
        );
      case StatusType.info:
      default:
        return _StatusColorScheme(
          backgroundColor: const Color(0xFFE3F2FD),
          borderColor: const Color(0xFF64B5F6),
          iconColor: const Color(0xFF1565C0),
          iconBackgroundColor: const Color(0xFFBBDEFB),
          buttonColor: const Color(0xFF1976D2),
        );
    }
  }
}
enum StatusType {
  success,
  warning,
  error,
  info,
}
class _StatusColorScheme {
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Color buttonColor;

  _StatusColorScheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.buttonColor,
  });
}
class StatusCardExamples extends StatelessWidget {
  const StatusCardExamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Card Examples'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          StatusCard(
            icon: Icons.check_circle,
            title: 'Meal Plan Updated',
            description: 'Your weekly meal plan has been successfully updated for the next 7 days.',
            statusType: StatusType.success,
            actionButtonText: 'View Plan',
            onActionPressed: () {
              debugPrint('View Plan pressed');
            },
          ),
          StatusCard(
            icon: Icons.warning_amber,
            title: 'Menu Change',
            description: 'Tomorrow\'s dinner menu has been changed due to ingredient unavailability.',
            statusType: StatusType.warning,
            showDismissButton: true,
            onDismiss: () {
              debugPrint('Dismiss pressed');
            },
          ),
          StatusCard(
            icon: Icons.error,
            title: 'Payment Failed',
            description: 'Your mess fee payment could not be processed. Please try again or contact admin.',
            statusType: StatusType.error,
            actionButtonText: 'Retry Payment',
            onActionPressed: () {
              debugPrint('Retry Payment pressed');
            },
          ),
          StatusCard(
            icon: Icons.info,
            title: 'New Feature Available',
            description: 'Check out our new nutrition tracking feature to monitor your daily intake.',
            statusType: StatusType.info,
            actionButtonText: 'Learn More',
            onActionPressed: () {
              debugPrint('Learn More pressed');
            },
            showDismissButton: true,
            onDismiss: () {
              debugPrint('Dismiss pressed');
            },
          ),
          StatusCard(
            icon: Icons.campaign,
            title: 'Mess Closed Tomorrow',
            description: 'The mess will remain closed tomorrow due to a public holiday. Please plan accordingly.',
            statusType: StatusType.info,
          ),
          StatusCard(
            icon: Icons.celebration,
            title: 'Special Event',
            description: 'Join us for a special dinner event this Friday celebrating the semester end!',
            statusType: StatusType.info,
            customBackgroundColor: const Color(0xFFF3E5F5),
            customIconColor: const Color(0xFF7B1FA2),
            actionButtonText: 'Register Now',
            onActionPressed: () {
              debugPrint('Register Now pressed');
            },
          ),
        ],
      ),
    );
  }
}