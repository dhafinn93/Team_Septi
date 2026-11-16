import 'package:flutter/material.dart';
import 'package:jahitko/core/theme/app_color.dart';
import 'package:jahitko/data/models/clothing_model.dart';

import '../../data/dummy/dummy_catalog.dart';
import '../../shared/widgets/brand_header.dart';

class CatalogPage extends StatefulWidget {
  final ValueChanged<String> onOrder;

  const CatalogPage({
    super.key,
    required this.onOrder,
  });

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  String selected = 'Semua';

  final filters = [
    'Semua',
    'Atasan Batik',
    'Satu Set Batik',
    'Atasan Kebaya',
    'Satu Set Kebaya',
  ];

  @override
  Widget build(BuildContext context) {
    final items = selected == 'Semua'
        ? dummyCatalog
        : dummyCatalog
            .where((item) => item.category == selected)
            .toList();

    return Column(
      children: [
        const BrandHeader(),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(15),

            children: [
              const Text(
                'Katalog Model Pakaian',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),

              const Text(
                'Pilihan model dan estimasi ongkos jahit standar',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 13),

              SizedBox(
                height: 38,

                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: filters.map((filter) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 7),

                      child: ChoiceChip(
                        label: Text(
                          filter,
                          style: const TextStyle(fontSize: 11),
                        ),

                        selected: selected == filter,

                        selectedColor: AppColors.navy,

                        labelStyle: TextStyle(
                          color: selected == filter
                              ? Colors.white
                              : Colors.black,
                        ),

                        onSelected: (_) {
                          setState(() {
                            selected = filter;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 12),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                itemCount: items.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.67,
                ),

                itemBuilder: (context, index) {
                  return CatalogCard(
                    item: items[index],
                    onTap: () {
                      widget.onOrder(items[index].name);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

extension on Object? {
}

class CatalogCard extends StatelessWidget {
  final ClothingModel item;
  final VoidCallback onTap;

  const CatalogCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFFFC66D),
        ),
      ),

      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color(0xFFD9D1C9),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.checkroom,
                    size: 54,
                    color: Color(0xFF795548),
                  ),

                  Text(
                    item.imageLabel,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(9, 8, 9, 9),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'Rp ${item.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 5),

                SizedBox(
                  width: double.infinity,

                  child: FilledButton(
                    onPressed: onTap,

                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFFFE6B0),
                      foregroundColor: AppColors.navy,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                    ),

                    child: const Text(
                      'Pesan Model ini',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}