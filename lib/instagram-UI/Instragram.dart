import 'package:assighment/instagram-UI/Components/CustomButton.dart';
import 'package:assighment/instagram-UI/Components/CustomText.dart';
import 'package:assighment/instagram-UI/Components/Statatic.dart';
import 'package:flutter/material.dart';

class Instragram extends StatelessWidget {
  const Instragram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("L for Life"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage(
                          "lib/instagram-UI/assets/secret.png",
                        ),
                      ),
                      Statatic(title: "Posts"),
                      Statatic(title: "Followers"),
                      Statatic(title: "Following"),
                    ],
                  ),
                  CustomText(
                    text: "L for Life",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: "Flutter beginer dev | Sleeping Lover",
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  CustomText(
                    text: "L for Life",
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomButton(
                          height: 35,
                          text: "Follow",
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: CustomButton(height: 35, text: "Message"),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: CustomButton(
                          height: 35,
                          text: "Contact",
                          icon: Icons.keyboard_arrow_down,
                          showIcon: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.grid_on, size: 24),
                      Icon(
                        Icons.video_collection_outlined,
                        size: 24,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.person_pin_outlined,
                        size: 24,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 150,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  final images = [
                    'lib/instagram-UI/assets/black.png',
                    'lib/instagram-UI/assets/blue.png',
                    'lib/instagram-UI/assets/green.png',
                    'lib/instagram-UI/assets/red.png',
                    'lib/instagram-UI/assets/secret.png',
                    'lib/instagram-UI/assets/white.png',
                    'lib/instagram-UI/assets/yellow.png',
                  ];
                  return Image.asset(
                    images[index % images.length],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
