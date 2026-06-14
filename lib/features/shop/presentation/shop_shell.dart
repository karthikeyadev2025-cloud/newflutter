import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme.dart';
import '../../../core/widgets/responsive_value.dart';
import 'screens/bills_screen.dart';
import 'screens/products_screen.dart';
import 'screens/shop_dashboard_screen.dart';
import 'screens/shop_pos_screen.dart';

class ShopShell extends StatefulWidget {
  const ShopShell({super.key});

  @override
  State<ShopShell> createState() => _ShopShellState();
}

class _ShopShellState extends State<ShopShell> {
  int _index = 0;

  static const _items = [
    _ShellItem('Dashboard', Icons.dashboard_outlined),
    _ShellItem('POS', Icons.receipt_long_outlined),
    _ShellItem('Products', Icons.inventory_2_outlined),
    _ShellItem('Bills', Icons.description_outlined),
  ];

  final _screens = const [
    ShopDashboardScreen(),
    ShopPosScreen(),
    ProductsScreen(),
    BillsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final desktop = responsiveValue(context, mobile: false, desktop: true);

    if (!desktop) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Karthikeya Store'),
          actions: [
            IconButton(
              tooltip: 'Super admin',
              onPressed: () => context.go('/admin'),
              icon: const Icon(Icons.admin_panel_settings_outlined),
            ),
          ],
        ),
        body: _screens[_index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (value) => setState(() => _index = value),
          destinations: [
            for (final item in _items)
              NavigationDestination(icon: Icon(item.icon), label: item.label),
          ],
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          _ShopSidebar(
            index: _index,
            items: _items,
            onChanged: (value) => setState(() => _index = value),
          ),
          Expanded(
            child: Column(
              children: [
                _ShopTopBar(onAdmin: () => context.go('/admin')),
                Expanded(child: _screens[_index]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ShopSidebar extends StatelessWidget {
  const _ShopSidebar({
    required this.index,
    required this.items,
    required this.onChanged,
  });

  final int index;
  final List<_ShellItem> items;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: AppColors.navy,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Row(
              children: [
                _LogoMark(),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MyStore OS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
                    Text('Shop Workspace', style: TextStyle(color: AppColors.faint, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: Color(0x22FFFFFF), height: 1),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              itemBuilder: (context, i) {
                final selected = i == index;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Material(
                    color: selected ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () => onChanged(i),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                        child: Row(
                          children: [
                            Icon(items[i].icon, size: 18, color: selected ? Colors.white : AppColors.faint),
                            const SizedBox(width: 12),
                            Text(
                              items[i].label,
                              style: TextStyle(
                                color: selected ? Colors.white : AppColors.faint,
                                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(radius: 17, backgroundColor: Color(0xFF1E293B), child: Text('KS')),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Karthikeya Store', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
                      Text('SHP-H9U6F6', style: TextStyle(color: AppColors.faint, fontSize: 11)),
                    ],
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

class _ShopTopBar extends StatelessWidget {
  const _ShopTopBar({required this.onAdmin});

  final VoidCallback onAdmin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          const SizedBox(
            width: 360,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search bills, products, customers',
                prefixIcon: Icon(Icons.search, size: 18),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const Spacer(),
          OutlinedButton.icon(
            onPressed: onAdmin,
            icon: const Icon(Icons.admin_panel_settings_outlined, size: 18),
            label: const Text('Super Admin'),
          ),
          const SizedBox(width: 10),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 18),
            label: const Text('New Bill'),
          ),
        ],
      ),
    );
  }
}

class _LogoMark extends StatelessWidget {
  const _LogoMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text('M', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
    );
  }
}

class _ShellItem {
  const _ShellItem(this.label, this.icon);

  final String label;
  final IconData icon;
}
