import 'package:flutter/material.dart';
import 'package:jahitko/core/theme/app_color.dart';

class BrandHeader extends StatelessWidget {
  final bool admin;

  const BrandHeader({
    super.key,
    this.admin = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.navy,

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),

      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,

            decoration: BoxDecoration(
              color: const Color(0xFFFFD43B),
              borderRadius: BorderRadius.circular(9),
            ),

            child: const Icon(
              Icons.content_cut,
              color: AppColors.navy,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  admin ? 'Penjahit Dashboard' : 'JahitBatik',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  admin
                      ? 'Pengelola antrean & status'
                      : 'Custom Tailor & Atelier',
                  style: const TextStyle(
                    color: Color(0xFFD4B65B),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          if (admin)
            const Chip(
              label: Text(
                'Online',
                style: TextStyle(fontSize: 10),
              ),
              backgroundColor: Color(0xFF285C49),
              labelStyle: TextStyle(color: Colors.white),
            )
          else
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.orange,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 19,
              ),
            ),
        ],
      ),
    );
  }
}