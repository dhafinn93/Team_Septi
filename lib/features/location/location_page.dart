import 'package:flutter/material.dart';
import 'package:jahitko/core/theme/app_color.dart';

import '../../shared/widgets/brand_header.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BrandHeader(),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),

            children: [
              const Text(
                'Lokasi Pengambilan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),

              const Text(
                'Alamat workshop untuk pengambilan pakaian',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 18),

              Container(
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: AppColors.paleOrange,

                          child: Icon(
                            Icons.storefront,
                            color: AppColors.orange,
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                'Atelier Studio Septi Stitch',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                'Jl. Paron, Ngawi',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xFFD9F4E4),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: const Text(
                        'Buka: 08.00 – 17.00 WIB',
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 10,
                        ),
                      ),
                    ),

                    const SizedBox(height: 13),

                    // Area peta sementara
                    Container(
                      height: 180,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: const Color(0xFFE1E6E9),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Icon(
                            Icons.map,
                            size: 55,
                            color: AppColors.navy,
                          ),

                          SizedBox(height: 8),

                          Text(
                            'Area Peta Lokasi Workshop',
                            style: TextStyle(
                              color: AppColors.navy,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            'Peta Google Maps akan dihubungkan pada tahap integrasi.',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,

                      child: FilledButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Google Maps belum dihubungkan.',
                              ),
                            ),
                          );
                        },

                        icon: const Icon(Icons.directions),

                        label: const Text('Petunjuk Arah'),

                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Catatan: alamat dan jam operasional harus dikonfirmasi sebelum aplikasi dipublikasikan.',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}