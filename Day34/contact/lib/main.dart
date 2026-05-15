import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {"name": "Rahul", "phone": "9876543210"},
    {"name": "Anjali", "phone": "9123456780"},
    {"name": "Arjun", "phone": "9988776655"},
    {"name": "Meera", "phone": "9090909090"},
    {"name": "Vishnu", "phone": "8887776665"},
    {"name": "Das", "phone": "7776665554"},
    {"name": "Akash", "phone": "9998887776"},
    {"name": "Joseph", "phone": "9012345678"},
    {"name": "Deon", "phone": "9000882299"},
    {"name": "Shambu", "phone": "9012853622"},
    {"name": "Ms", "phone": "9058361495"},
    {"name": "Benny", "phone": "8065142981"},
    {"name": "Siby", "phone": "7978752613"},
    {"name": "Titu", "phone": "9028795612"},
    {"name": "Deepak", "phone": "7909188795"},
  ];

  final List<Map<String, dynamic>> categories = [
    {"name": "Family", "color": Colors.red},
    {"name": "Friends", "color": Colors.green},
    {"name": "Work", "color": Colors.blue},
    {"name": "Favorites", "color": Colors.orange},
    {"name": "Emergency", "color": Colors.purple},
    {"name": "Others", "color": Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Column(
        children: [
          //  Category Grid
          Container(
            height: 120,
            padding: EdgeInsets.all(8),
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];

                return Container(
                  decoration: BoxDecoration(
                    color: category["color"],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    category["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, 
                    ),
                  ),
                );
              },
            ),
          ),

          //  Contact List
          Expanded(
            child: ListView.separated(
              itemCount: contacts.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final contact = contacts[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      contact["name"]![0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    contact["name"]!,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(contact["phone"]!),
                  trailing: Icon(Icons.call, color: Colors.green),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
