import 'package:flutter/material.dart';

class StatusCardHac144 extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final Color statusColor;
  final String buttonText;

  const StatusCardHac144({
    Key? key,
    required this.icon,
    required this.title,
    required this.message,
    this.statusColor = Colors.yellow,
    this.buttonText = 'View',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: statusColor, width: 5)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: statusColor),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    message,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // You can handle button click here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
