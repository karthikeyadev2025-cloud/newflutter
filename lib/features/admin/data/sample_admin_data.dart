class AdminUserRow {
  const AdminUserRow({
    required this.name,
    required this.role,
    required this.status,
    required this.plan,
    required this.revenue,
  });

  final String name;
  final String role;
  final String status;
  final String plan;
  final double revenue;
}

const sampleAdminUsers = [
  AdminUserRow(name: 'Karthikeya Store', role: 'Shop', status: 'Active', plan: 'Pro', revenue: 1499),
  AdminUserRow(name: 'Sai Traders', role: 'Shop', status: 'Pending', plan: 'Trial', revenue: 0),
  AdminUserRow(name: 'Metro Wholesale', role: 'Distributor', status: 'Active', plan: 'Business', revenue: 2999),
  AdminUserRow(name: 'Priya Accounts', role: 'CA', status: 'Active', plan: 'Free', revenue: 0),
  AdminUserRow(name: 'Ramesh Affiliate', role: 'Affiliate', status: 'Suspended', plan: 'Free', revenue: 0),
];
