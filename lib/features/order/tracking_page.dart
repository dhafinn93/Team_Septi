import 'package:flutter/material.dart';
import 'package:jahitko/core/theme/app_color.dart';

import '../../shared/widgets/brand_header.dart';

class TrackingPage extends StatelessWidget {
  final String orderName;
  final String orderCode;
  final int step;

  const TrackingPage({
    super.key,
    required this.orderName,
    required this.orderCode,
    required this.step,
  });

  static const stages = [
    (
      'Pesanan Diterima',
      'Verifikasi kain dan formulir pesanan',
    ),
    (
      'Pemotongan Pola Kain',
      'Pemotongan bahan utama sesuai pola',
    ),
    (
      'Proses Penjahitan Utama',
      'Penjahitan struktur busana dan detail',
    ),
    (
      'Jadwal Fitting / Proofing',
      'Pengecekan ukuran dan kenyamanan',
    ),
    (
      'Finishing & Quality Control',
      'Pemeriksaan akhir hasil jahitan',
    ),
    (
      'Siap Diambil',
      'Pesanan selesai dan dapat diambil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentStep = step.clamp(0, 5).toInt();

    return Column(
      children: [
        const BrandHeader(),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),

            children: [
              const Text(
                'Lacak Status Pengerjaan',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                'Pantau progres pesanan jahit Anda',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 15),

              // Kode order
              Container(
                padding: const EdgeInsets.all(14),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  children: [
                    const Text(
                      'Kode Order:',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        orderCode,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 13),

              // Ringkasan pesanan
              Container(
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: AppColors.navy,
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'KODE ORDER: #$orderCode',
                      style: const TextStyle(
                        color: AppColors.orange,
                        fontSize: 10,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      orderName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const Text(
                      'Pelanggan: Anda | Ukuran: M',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    ),

                    const Divider(
                      color: Colors.white24,
                      height: 22,
                    ),

                    Text(
                      'Status Saat Ini: ${stages[currentStep].$1}',
                      style: const TextStyle(
                        color: AppColors.orange,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,

                      child: FilledButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Integrasi WhatsApp akan diaktifkan setelah nomor penjahit dikonfigurasi.',
                              ),
                            ),
                          );
                        },

                        icon: const Icon(
                          Icons.chat,
                          size: 16,
                        ),

                        label: const Text('Tanya Penjahit'),

                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Timeline
              Container(
                padding: const EdgeInsets.all(17),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      '6 TAHAPAN PENGERJAAN JAHIT',
                      style: TextStyle(
                        color: AppColors.muted,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 16),

                    ...List.generate(stages.length, (index) {
                      final completed = index < currentStep;
                      final active = index == currentStep;

                      final color = completed
                          ? AppColors.green
                          : active
                              ? AppColors.orange
                              : const Color(0xFF9EABB7);

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          SizedBox(
                            width: 42,

                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 17,
                                  backgroundColor: color,

                                  child: Icon(
                                    completed
                                        ? Icons.check
                                        : active
                                            ? Icons.content_cut
                                            : Icons.circle,

                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),

                                if (index != stages.length - 1)
                                  Container(
                                    width: 2,
                                    height: 49,
                                    color: const Color(0xFFB8C7D5),
                                  ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3,
                                bottom: 18,
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    stages[index].$1,

                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,

                                      color: active
                                          ? AppColors.orange
                                          : completed
                                              ? AppColors.text
                                              : AppColors.muted,
                                    ),
                                  ),

                                  Text(
                                    stages[index].$2,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColors.muted,
                                    ),
                                  ),

                                  if (active)
                                    const Text(
                                      'SEDANG BERJALAN',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: AppColors.orange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}