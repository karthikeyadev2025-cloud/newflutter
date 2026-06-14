import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/responsive_value.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../data/sample_shop_data.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = responsiveValue(context, mobile: false, desktop: true);

    return ListView(
      padding: EdgeInsets.all(desktop ? 28 : 16),
      children: [
        Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bills', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                  SizedBox(height: 4),
                  Text('Invoices, estimates, challans, returns, and payments.', style: TextStyle(color: AppColors.muted)),
                ],
              ),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download, size: 18),
              label: const Text('Export'),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Search invoice or customer',
            prefixIcon: Icon(Icons.search, size: 18),
          ),
        ),
        const SizedBox(height: 18),
        desktop ? const _BillsTable() : const _BillsList(),
      ],
    );
  }
}

class _BillsTable extends StatelessWidget {
  const _BillsTable();

  @override
  Widget build(BuildContext context) {
    return AppPanel(
      padding: EdgeInsets.zero,
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(AppColors.canvas),
        columns: const [
          DataColumn(label: Text('Invoice')),
          DataColumn(label: Text('Customer')),
          DataColumn(label: Text('Time')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Amount'), numeric: true),
          DataColumn(label: Text('')),
        ],
        rows: [
          for (final bill in sampleBills)
            DataRow(
              cells: [
                DataCell(Text(bill.number, style: const TextStyle(fontWeight: FontWeight.w900))),
                DataCell(Text(bill.customer)),
                DataCell(Text(bill.time)),
                DataCell(StatusChip(label: bill.status, color: _statusColor(bill.status))),
                DataCell(Text('₹${bill.amount.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w900))),
                DataCell(
                  Wrap(
                    spacing: 4,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.print_outlined, size: 18)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined, size: 18)),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _BillsList extends StatelessWidget {
  const _BillsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final bill in sampleBills)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: AppPanel(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bill.number, style: const TextStyle(fontWeight: FontWeight.w900)),
                        const SizedBox(height: 4),
                        Text('${bill.customer} • ${bill.time}', style: const TextStyle(color: AppColors.muted)),
                        const SizedBox(height: 8),
                        StatusChip(label: bill.status, color: _statusColor(bill.status)),
                      ],
                    ),
                  ),
                  Text('₹${bill.amount.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w900)),
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
    'Paid' => AppColors.success,
    'Pending' => AppColors.warning,
    _ => AppColors.danger,
  };
}
