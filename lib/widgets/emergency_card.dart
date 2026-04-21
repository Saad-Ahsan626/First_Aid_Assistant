import 'package:flutter/material.dart';

Widget Emergency_card(dynamic emergency, bool isLarge) {
  return InkWell(
    onTap: () => {},
    child: Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.medical_services,
            color: Colors.redAccent,
            size: isLarge
                ? 40
                : 32, 
          ),
          const SizedBox(height: 12),
          Text(
            emergency.titleEn,
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
