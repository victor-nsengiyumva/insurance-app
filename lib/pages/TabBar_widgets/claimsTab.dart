import 'package:flutter/material.dart';
import 'package:insurease/styles/colors.dart';
import 'package:insurease/tools/major_font.dart';

class ClaimsTab extends StatefulWidget {
  const ClaimsTab({super.key});

  @override
  State<ClaimsTab> createState() => _ClaimsTabState();
}

class _ClaimsTabState extends State<ClaimsTab> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 140),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.policy,
            size: 150,
            color: AppColors.greyColor,
            ),
            const SizedBox(height: 15,),
            MajorFont(text: 'You have no claims.',weight: false,color: const Color.fromARGB(255, 189, 184, 184),),
          ],
        ),
      ),
    );
  }
}