import 'package:flutter/material.dart';

class StatusCardKrishna200608 extends StatelessWidget {
  /// Icon to display in the card (e.g., Icons.info, Icons.warning)
  final IconData icon;

  /// Title of the notification
  final String title;

  /// Detailed message or description
  final String message;

  /// Color status (default is Colors.blue)
  final Color statusColor;

  /// Optional text for an action button
  final String? actionText;

  /// Optional callback for the action button
  final VoidCallback? onActionPressed;

  const StatusCardKrishna200608({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.statusColor = Colors.blue,
    this.actionText,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: statusColor.withOpacity(0.15),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06), // Slightly lighter shadow since we have a border
            spreadRadius: 2,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Container
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.transparent, // Outline style
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: statusColor.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  icon,
                  color: statusColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              // Content Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                    if (actionText != null && onActionPressed != null) ...[
                      const SizedBox(height: 14),
                      // Right Aligned Action Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: onActionPressed,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: statusColor, // Solid fill for high contrast button
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: statusColor.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              actionText!,
                              style: const TextStyle(
                                color: Colors.white, // White text on colored button
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
