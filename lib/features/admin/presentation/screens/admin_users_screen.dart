import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../data/sample_admin_data.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(28),
      children: [
        Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Users & Shops', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                  SizedBox(height: 4),
                  Text('Approve, suspend, reset access, and manage roles.', style: TextStyle(color: AppColors.muted)),
                ],
              ),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.person_add_alt, size: 18),
              label: const Text('Create User'),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Search by name, phone, shop code, or role',
            prefixIcon: Icon(Icons.search, size: 18),
          ),
        ),
        const SizedBox(height: 18),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: AppPanel(
            padding: EdgeInsets.zero,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(AppColors.canvas),
              columns: const [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Role')),
                DataColumn(label: Text('Plan')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Revenue'), numeric: true),
                DataColumn(label: Text('')),
              ],
              rows: [
                for (final user in sampleAdminUsers)
                  DataRow(
                    cells: [
                      DataCell(Text(user.name, style: const TextStyle(fontWeight: FontWeight.w900))),
                      DataCell(Text(user.role)),
                      DataCell(Text(user.plan)),
                      DataCell(StatusChip(label: user.status, color: _statusColor(user.status))),
                      DataCell(Text('₹${user.revenue.toStringAsFixed(0)}')),
                      DataCell(
                        Wrap(
                          children: [
                            IconButton(onPressed: () {}, icon: const Icon(Icons.check, size: 18)),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.key, size: 18)),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.block, size: 18)),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Color _statusColor(String status) {
  return switch (status) {
    'Active' => AppColors.success,
    'Pending' => AppColors.warning,
    _ => AppColors.danger,
  };
}
