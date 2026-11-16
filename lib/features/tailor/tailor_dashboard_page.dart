import 'package:flutter/material.dart';
import 'package:jahitko/core/theme/app_color.dart';

import '../../shared/widgets/brand_header.dart';

class TailorDashboardPage extends StatefulWidget {
  const TailorDashboardPage({super.key});

  @override
  State<TailorDashboardPage> createState() =>
      _TailorDashboardPageState();
}

class _TailorDashboardPageState
    extends State<TailorDashboardPage> {

  final List<String> statuses = [
    'Step 1 : Pesanan Diterima',
    'Step 2 : Pemotongan Pola Kain',
    'Step 3 : Proses Penjahitan Utama',
    'Step 4 : Jadwal Fitting / Proofing',
    'Step 5 : Finishing & Quality Control',
    'Step 6 : Siap Diambil',
  ];

  final Map<int, String> selected = {
    0: 'Step 3 : Proses Penjahitan Utama',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BrandHeader(admin: true),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),

                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Dashboard Penjahit',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(7),

                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: const Text(
                          'Admin JahitBatik',
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Text(
                    'Kelola antrean dan update status pesanan',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: [
                      summary('Total Order', '1'),
                      const SizedBox(width: 8),
                      summary('Proses Jahit', '1'),
                      const SizedBox(width: 8),
                      summary('Siap Diambil', '0'),
                    ],
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    'DAFTAR ANTREAN & UPDATE REAL-TIME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 10),

                  orderCard(
                    0,
                    'ST-88031',
                    'Kebaya Brokat Modern',
                    'M',
                    'Kain brokat warna cream',
                    'Tolong buat bagian depan agak slimfit.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summary(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 5,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: AppColors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderCard(
    int index,
    String code,
    String name,
    String size,
    String fabric,
    String note,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            padding: const EdgeInsets.all(6),

            decoration: BoxDecoration(
              color: AppColors.paleOrange,
              borderRadius: BorderRadius.circular(5),
            ),

            child: Text(
              'Order ID : #$code',
              style: const TextStyle(
                color: AppColors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            'Pelanggan: Contoh Pelanggan | Ukuran: $size',
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.muted,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: const Color(0xFFE9EEF1),
              borderRadius: BorderRadius.circular(8),
            ),

            child: Text(
              '• Kain: $fabric\n• Catatan: $note',
              style: const TextStyle(fontSize: 11),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'UBAH STATUS PENGERJAAN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: selected[index],
                  isExpanded: true,

                  items: statuses.map((status) {
                    return DropdownMenuItem(
                      value: status,

                      child: Text(
                        status,
                        style: const TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selected[index] = value!;
                    });
                  },
                ),
              ),

              const SizedBox(width: 8),

              IconButton.filled(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Nomor WhatsApp pelanggan belum dikonfigurasi.',
                      ),
                    ),
                  );
                },

                icon: const Icon(Icons.chat),

                style: IconButton.styleFrom(
                  backgroundColor: AppColors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Text(
            'Status terpilih: ${selected[index]}',
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}