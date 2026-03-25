class MockDrivers {
  static List<Map<String, dynamic>> drivers = [
    {
      'id': '1',
      'name': 'John Smith',
      'rating': 4.8,
      'truckInfo': '2020 Freightliner Cascadia',
      'jobsCompleted': 142,
      'phone': '(555) 123-4567',
      'email': 'john.smith@email.com',
      'isBlocked': false,
      'reviewCount': 24, // Optional, useful for rating updates
    },
    {
      'id': '2',
      'name': 'Sarah Johnson',
      'rating': 4.9,
      'truckInfo': '2021 Kenworth T680',
      'jobsCompleted': 98,
      'phone': '(555) 234-5678',
      'email': 'sarah.j@email.com',
      'isBlocked': false,
      'reviewCount': 18,
    },
  ];
}
