import 'package:flutter/material.dart';
import 'package:jahitko/features/order/order_from_page.dart';

import '../core/theme/app_theme.dart';
import '../features/home/home_page.dart';
import '../features/catalog/catalog_page.dart';
import '../features/order/tracking_page.dart';
import '../features/location/location_page.dart';

class JahitBatikApp extends StatelessWidget {
  const JahitBatikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JahitBatik',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  String orderName = 'Kebaya Brokat Wisuda Modern';
  String orderCode = 'ST-88031';
  int orderStep = 2;

  void openOrder({String? modelName}) {
    setState(() {
      selectedIndex = 2;

      if (modelName != null) {
        orderName = modelName;
      }
    });
  }

  void submitOrder(String name) {
    setState(() {
      orderName = name;
      orderCode = 'ST-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
      orderStep = 0;
      selectedIndex = 3;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Permintaan pesanan berhasil dibuat.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        onOrder: () => openOrder(),
        onCatalog: () {
          setState(() => selectedIndex = 1);
        },
        onTrack: () {
          setState(() => selectedIndex = 3);
        },
        onPopular: (name) => openOrder(modelName: name),
      ),

      CatalogPage(
        onOrder: (name) => openOrder(modelName: name),
      ),

      OrderFormPage(
        initialModel: orderName,
        onSubmit: submitOrder,
      ),

      TrackingPage(
        orderName: orderName,
        orderCode: orderCode,
        step: orderStep,
      ),

      const LocationPage(),
    ];

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => openOrder(),
        backgroundColor: const Color(0xFFFF7900),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add, size: 30),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF101A31),
        shape: const CircularNotchedRectangle(),
        notchMargin: 7,

        child: SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(Icons.home, 'Beranda', 0),
              navItem(Icons.checkroom, 'Katalog', 1),
              const SizedBox(width: 48),
              navItem(Icons.local_shipping, 'Lacak', 3),
              navItem(Icons.location_on, 'Lokasi', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String label, int index) {
    final active = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      child: SizedBox(
        width: 62,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: active
                  ? const Color(0xFFFF7900)
                  : Colors.white,
              size: 21,
            ),

            const SizedBox(height: 3),

            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: active
                    ? const Color(0xFFFF7900)
                    : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}