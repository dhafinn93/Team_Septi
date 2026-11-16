import 'package:flutter/material.dart';
import 'package:jahitko/core/theme/app_color.dart';

import '../../shared/widgets/brand_header.dart';

class OrderFormPage extends StatefulWidget {
  final String initialModel;
  final ValueChanged<String> onSubmit;

  const OrderFormPage({
    super.key,
    required this.initialModel,
    required this.onSubmit,
  });

  @override
  State<OrderFormPage> createState() => _OrderFormPageState();
}

class _OrderFormPageState extends State<OrderFormPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final fabricController = TextEditingController();
  final colorController = TextEditingController();
  final motifController = TextEditingController();
  final dateController = TextEditingController();
  final noteController = TextEditingController();

  String size = 'M';
  String fabricOption = 'Bawa Kain Sendiri';
  String category = 'Batik';
  String speed = 'Normal';

  @override
  void initState() {
    super.initState();

    if (widget.initialModel != 'Kebaya Brokat Wisuda Modern') {
      nameController.text = widget.initialModel;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    fabricController.dispose();
    colorController.dispose();
    motifController.dispose();
    dateController.dispose();
    noteController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BrandHeader(),

        Expanded(
          child: Form(
            key: formKey,

            child: ListView(
              padding: const EdgeInsets.all(16),

              children: [
                const Text(
                  'Formulir Pesanan Jahit Custom',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  'Lengkapi spesifikasi pakaian impian Anda',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 14),

                // Bagian 1
                section(
                  '1',
                  'JENIS & MODEL PAKAIAN',

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label('Kategori Pakaian'),

                      DropdownButtonFormField<String>(
                        initialValue: category,

                        items: ['Batik', 'Kebaya']
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),

                        onChanged: (value) {
                          setState(() {
                            category = value!;
                          });
                        },
                      ),

                      const SizedBox(height: 10),

                      label('Nama Model / Deskripsi'),

                      TextFormField(
                        controller: nameController,

                        validator: requiredValidator,

                        decoration: const InputDecoration(
                          hintText: 'Contoh: Kebaya brokat modern',
                        ),
                      ),
                    ],
                  ),
                ),

                // Bagian 2
                section(
                  '2',
                  'UKURAN PAKAIAN',

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label('Pilih ukuran standar'),

                      Wrap(
                        spacing: 8,

                        children: ['S', 'M', 'L', 'XL', 'XXL']
                            .map(
                              (value) => ChoiceChip(
                                label: Text(value),

                                selected: size == value,

                                selectedColor: AppColors.paleOrange,

                                onSelected: (_) {
                                  setState(() {
                                    size = value;
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        'Jika ukuran belum sesuai, silakan konsultasi dengan penjahit.',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                // Bagian 3
                section(
                  '3',
                  'BAHAN & KAIN',
                  RadioGroup<String>(
                    groupValue: fabricOption,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          fabricOption = value;
                        });
                      }
                    },
                    child: Column(
                      children: [
                        RadioListTile<String>(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: const Text(
                            'Bawa Kain Sendiri',
                            style: TextStyle(fontSize: 12),
                          ),
                          value: 'Bawa Kain Sendiri',
                        ),
                        RadioListTile<String>(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: const Text(
                            'Beli dari Penjahit',
                            style: TextStyle(fontSize: 12),
                          ),
                          value: 'Beli dari Penjahit',
                        ),
                        TextFormField(
                          controller: fabricController,
                          decoration: const InputDecoration(
                            labelText: 'Keterangan jenis kain',
                            hintText: 'Contoh: Brokat Prada / katun',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bagian 4
                section(
                  '4',
                  'PREFERENSI & OPSI TAMBAHAN',

                  Column(
                    children: [
                      DropdownButtonFormField<String>(
                        initialValue: speed,

                        decoration: const InputDecoration(
                          labelText: 'Kecepatan pengerjaan',
                        ),

                        items: [
                          'Normal',
                          'Prioritas / lebih cepat',
                        ].map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        ).toList(),

                        onChanged: (value) {
                          setState(() {
                            speed = value!;
                          });
                        },
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: colorController,
                        decoration: const InputDecoration(
                          labelText: 'Warna pakaian',
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: motifController,
                        decoration: const InputDecoration(
                          labelText: 'Motif pakaian',
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: dateController,
                        decoration: const InputDecoration(
                          labelText: 'Tanggal dibutuhkan',
                          hintText: 'Contoh: 20 Desember 2026',
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: noteController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Catatan tambahan',
                        ),
                      ),
                    ],
                  ),
                ),

                // Tombol kirim
                SizedBox(
                  width: double.infinity,

                  child: FilledButton.icon(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        widget.onSubmit(
                          nameController.text.trim(),
                        );
                      }
                    },

                    icon: const Icon(Icons.send),

                    label: const Text(
                      'Kirim Permintaan Pesanan',
                    ),

                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      padding: const EdgeInsets.all(15),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String? requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Bagian ini wajib diisi';
    }

    return null;
  }

  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),

      child: Align(
        alignment: Alignment.centerLeft,

        child: Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }

  Widget section(
    String number,
    String title,
    Widget child,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.orange,

                child: Text(
                  number,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const SizedBox(height: 13),

          child,
        ],
      ),
    );
  }
}