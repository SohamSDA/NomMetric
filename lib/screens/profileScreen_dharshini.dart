import 'package:flutter/material.dart';

class ProfileScreenDharshini extends StatelessWidget {
  const ProfileScreenDharshini({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),

          // Avatar
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(
              Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 12),

          // User Name
          const Text(
            "John Doe",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          // Email
          const Text(
            "john.doe@email.com",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 30),

          // Options list
          const Divider(),

          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit Profile"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
