import 'package:first_aid_assisstant/screens/instructionscreen.dart';
import 'package:flutter/material.dart';

Widget Emergency_card(BuildContext context, dynamic emergency, bool isLarge) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InstructionScreen(emergency: emergency),
        ),
      );
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDarkMode
            ? []
            : [
                BoxShadow(
                  color: const Color(0xFF1A1C1C).withOpacity(0.06),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 4.0,
            ),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: isLarge
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                emergency.icon,
                height: isLarge ? 80 : 50,
                width: isLarge ? 80 : 50,
                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.medical_services,
                    color: Theme.of(context).primaryColor,
                    size: isLarge ? 80 : 50,
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Text(
              emergency.titleEn,
              textAlign: isLarge ? TextAlign.center : TextAlign.left,
              style: TextStyle(
                fontFamily: 'JameelNoori',
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: isLarge ? 20 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              emergency.titleUr,
              textAlign: isLarge ? TextAlign.center : TextAlign.left,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                fontSize: isLarge ? 16 : 14,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
