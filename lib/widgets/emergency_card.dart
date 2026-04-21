import 'package:flutter/material.dart';

Widget Emergency_card(dynamic emergency, bool isLarge) {
  return InkWell(
    onTap: () => {},
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: isLarge ? CrossAxisAlignment.center : CrossAxisAlignment.start,
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
                    color: Colors.redAccent,
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
              fontWeight: FontWeight.bold,
              fontSize: isLarge
                  ? 20
                  : 16, 
            ),
          ),
          const SizedBox(height: 4),
          Text(
            emergency.titleUr,
            textAlign: isLarge ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: isLarge ? 16 : 14,
            ),
          ),
        ],
      ),
    ),
  );
}
