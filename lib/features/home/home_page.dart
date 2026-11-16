import 'package:flutter/material.dart';
import 'package:jahitko/core/theme/app_color.dart';

import '../../shared/widgets/brand_header.dart';
import '../../shared/widgets/section_title.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onOrder;
  final VoidCallback onCatalog;
  final VoidCallback onTrack;
  final ValueChanged<String> onPopular;

  const HomePage({
    super.key,
    required this.onOrder,
    required this.onCatalog,
    required this.onTrack,
    required this.onPopular,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BrandHeader(),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),

            children: [
              // Banner utama
              Container(
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: AppColors.navy,
                  borderRadius: BorderRadius.circular(18),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jasa Jahit Batik & Kebaya Custom Presisi',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),

                    const SizedBox(height: 7),

                    const Text(
                      'Wujudkan busana pesta, wisuda, dan seragam batik impian Anda.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Wrap(
                      spacing: 8,
                      children: [
                        FilledButton.icon(
                          onPressed: onOrder,
                          icon: const Icon(Icons.add, size: 17),
                          label: const Text('Pesan Jahit Baru'),
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.orange,
                          ),
                        ),

                        OutlinedButton.icon(
                          onPressed: onCatalog,
                          icon: const Icon(Icons.menu_book, size: 17),
                          label: const Text('Katalog Model'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Status pesanan aktif
              InkWell(
                onTap: onTrack,

                child: Container(
                  padding: const EdgeInsets.all(15),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: const Color(0xFFFFC66D),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xFFFFE4C4),
                            child: Icon(
                              Icons.checkroom,
                              color: AppColors.orange,
                            ),
                          ),

                          const SizedBox(width: 10),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kebaya Brokat Wisuda Modern',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  'Kode: ST-88031 | Estimasi: 14 hari',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Text(
                            'Step 3/6',
                            style: TextStyle(
                              color: AppColors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'Status: Proses Penjahitan Utama',
                        style: TextStyle(fontSize: 11),
                      ),

                      const SizedBox(height: 6),

                      const LinearProgressIndicator(
                        value: 0.5,
                        color: AppColors.orange,
                        backgroundColor: Color(0xFFFFE2C0),
                      ),

                      const SizedBox(height: 7),

                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Detail Lacak →',
                          style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Informasi layanan
              Container(
                padding: const EdgeInsets.all(13),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: const Row(
                  children: [
                    Icon(
                      Icons.verified_user,
                      color: AppColors.green,
                      size: 30,
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Garansi Fitting 100% Pas di Badan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),

                          Text(
                            'Konsultasikan ukuran dan model langsung dengan penjahit.',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const SectionTitle(
                title: 'KATALOG POPULER',
              ),

              Row(
                children: [
                  popularCard(
                    'Atasan Batik',
                    'Rp90.000',
                    Icons.checkroom,
                    () => onPopular('Atasan Batik Custom'),
                  ),

                  const SizedBox(width: 12),

                  popularCard(
                    'Kebaya Satu Set',
                    'Rp140.000',
                    Icons.checkroom,
                    () => onPopular('Satu Set Kebaya Wisuda'),
                  ),
                ],
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }

  Widget popularCard(
    String title,
    String price,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: InkWell(
        onTap: onTap,

        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),

          clipBehavior: Clip.antiAlias,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 105,
                width: double.infinity,
                color: const Color(0xFFD9D1C9),

                child: Icon(
                  icon,
                  size: 55,
                  color: const Color(0xFF795548),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(9),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      'Mulai dari $price',
                      style: const TextStyle(
                        color: AppColors.orange,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}