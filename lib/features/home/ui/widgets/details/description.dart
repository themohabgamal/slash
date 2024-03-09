import 'package:flutter/material.dart';
import 'package:slash/core/theme/my_fonts.dart';
import 'package:slash/features/home/ui/widgets/details/expandaple_text.dart';

class Description extends StatelessWidget {
  final String text;
  const Description({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: MyFonts.font18WhiteBold,
            ),
            const SizedBox(height: 8.0),
            // You can replace this with your actual product description
            ExpandableText(
              text,
            ),
          ],
        ),
      ),
    );
  }
}
