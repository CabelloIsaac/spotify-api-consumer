import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  // final String

  const CategoryItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                "https://datsnxq1rwndn.cloudfront.net/media/derived/workout_856581c1c545a5305e49a3cd8be804a0_0_0_275_275.jpg",
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 8),
            Text("Workout"),
          ],
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
