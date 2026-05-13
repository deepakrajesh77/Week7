import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SocialMediaCard(),
    );
  }
}

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: Center(
        child: Container(
          width: 350,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // 🔹 PROFILE SECTION
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey[300],

                        
                        child: ClipOval(
                          child: Image.network(
                            "https://randomuser.me/api/portraits/men/1.jpg",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,

                           //if image fails
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.person,
                                size: 30,
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        "visual_vibes",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // 🔹 CAPTION
                  const Text(
                    "Good design is simple, clear, and powerful.\n\n"
                    "#design #uiux #creative",
                    style: TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 10),

                  // 🔹 IMAGE + LIKE BUTTON
                  Stack(
                    children: [

                      // POST IMAGE
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://picsum.photos/400/250",
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,

                          
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              color: Colors.grey[400],
                              child: const Center(
                                child: Icon(Icons.broken_image),
                              ),
                            );
                          },
                        ),
                      ),

                      // FLOATING LIKE BUTTON
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: FloatingActionButton(
                          mini: true,
                          backgroundColor: Colors.red,
                          onPressed: () {
                            debugPrint("Liked!");
                          },
                          child: const Icon(Icons.favorite),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}