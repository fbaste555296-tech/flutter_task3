import 'package:flutter/material.dart';

class DynamicPage extends StatelessWidget {
  const DynamicPage({super.key});

  final String description =
      'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baste_Activity 1'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main Image
            Image.asset(
              'assets/pavlova.png',
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 50,
                  ),
                );
              },
            ),

            // Title
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Strawberry Pavlova',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),

            // Image Row

            // Star Rating
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 3 yellow stars
                  ...buildStar(3, true),

                  const SizedBox(width: 8),

                  // 2 gray stars
                  ...buildStar(2, false),
                ],
              ),
            ),

            // Reviews
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '90 Reviews',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),

            // Information Tabs
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildRowTabs(),
            ),
          ],
        ),
      ),
    );
  }

  // Creates star icons dynamically
  List<Widget> buildStar(int rating, bool colored) {
    return List.generate(
      rating,
      (index) => Icon(
        Icons.star,
        color: colored ? Colors.yellow[600] : Colors.grey[400],
        size: 24,
      ),
    );
  }

  // Creates the information tabs
  Widget buildRowTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildIconTab(
          Icons.kitchen, 'PREP''\n'
          '25 min',
        ),
        buildIconTab(
          Icons.timer, 'COOK''\n'
          '1 hour',
        ),
        buildIconTab(
          Icons.restaurant,'FEEDS''\n'
          '4-6',
        ),
      ],
    );
  }

  Widget buildIconTab(IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.green[700],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}