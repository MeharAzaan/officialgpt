import 'package:flutter/material.dart';

class Mainui extends StatefulWidget {
  const Mainui({super.key});

  @override
  State<Mainui> createState() => _MainuiState();
}

class _MainuiState extends State<Mainui> {
  late final TextEditingController inputcontroller;

  @override
  void initState() {
    inputcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    inputcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "ChatGPT Lite",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),

      // Drawer
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.account_circle, size: 48, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      "Welcome!",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          children: [
            // Chat messages area (placeholder)
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Your chat will appear here",
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Message input box with send icon
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: inputcontroller,
                      decoration: InputDecoration(
                        hintText: "Enter your message...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.blue),
                    onPressed: () {
                      // Handle send action
                      final message = inputcontroller.text.trim();
                      if (message.isNotEmpty) {
                        print("Sending: $message");
                        inputcontroller.clear();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
