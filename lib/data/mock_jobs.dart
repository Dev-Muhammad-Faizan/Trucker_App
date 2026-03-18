class MockJobs {
  static final List<Map<String, dynamic>> jobs = [
    {
      'title': 'Austin Distribution Run',
      'status': 'Open',
      'pickupLocation': 'Austin Terminal, 890 Highway 35',
      'deliveryLocation': 'San Antonio Depot, 2345 Freight Ave',
      'time': 'March 22 - 8:00 AM',
      'price': '\$ 1,500',
    },
    {
      'title': 'Border Crossing Haul',
      'status': 'Open',
      'pickupLocation': 'Corpus Christi Port, 3456 Harbor Rd',
      'deliveryLocation': 'Laredo Border Station, 8901 Trade Way',
      'time': 'March 23 - 6:00 AM',
      'price': '\$ 2,200',
    },

  ];

  static void addJob(Map<String, dynamic> job) {
    jobs.insert(0, job);
  }
}
