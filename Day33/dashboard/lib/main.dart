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
      title: 'Responsive Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),

      // Drawer for mobile
      drawer: width < 600 ? const Drawer(child: Sidebar()) : null,

      body: Row(
        children: [
          // Sidebar for tablet/desktop
          if (width >= 600)
            const Expanded(
              flex: 2,
              child: Sidebar(),
            ),

          const Expanded(
            flex: 5,
            child: MainContent(),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Dashboard Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(color: Colors.white24),

          Expanded(
            child: ListView(
              children: [
                _menuItem(Icons.dashboard, "Dashboard", true),
                _menuItem(Icons.person, "Profile", false),
                _menuItem(Icons.settings, "Settings", false),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, bool selected) {
    return Container(
      color: selected ? Colors.white12 : Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // ✅ FIXED: Responsive Stat Cards using Wrap
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _responsiveStatCard(width, "Users", "1,245", Icons.people),
              _responsiveStatCard(width, "Revenue", "₹32K", Icons.attach_money),
              _responsiveStatCard(width, "Orders", "320", Icons.shopping_cart),
            ],
          ),

          const SizedBox(height: 20),

          // Grid Section
          GridView.count(
            crossAxisCount: width < 600 ? 2 : 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: List.generate(
              8,
              (index) => _card("Card ${index + 1}"),
            ),
          ),
        ],
      ),
    );
  }

  // Responsive width control for stat cards
  Widget _responsiveStatCard(
      double width, String title, String value, IconData icon) {
    double cardWidth;

    if (width < 600) {
      cardWidth = (width - 48) / 2; // 2 cards per row
    } else {
      cardWidth = 200; // fixed size for larger screens
    }

    return SizedBox(
      width: cardWidth,
      child: _statCard(title, value, icon),
    );
  }

  Widget _statCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          )
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 30),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _card(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}