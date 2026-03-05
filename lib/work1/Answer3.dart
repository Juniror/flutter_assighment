import 'package:flutter/material.dart';

class Answer3 extends StatelessWidget {
  const Answer3({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ("Laptop", "999 THB"),
      ("Smartphone", "699 THB"),
      ("Tablet", "499 THB"),
      ("Camera", "299 THB"),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product Layout"),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.symmetric(horizontal: 12),
              color: Colors.grey,
              child: Center(child: const Text("Category: Electric")),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            color: Colors.grey,
                          ),
                        ),
                        Text(items[index].$1),
                        Text(
                          items[index].$2,
                          style: const TextStyle(color: Colors.green),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
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
