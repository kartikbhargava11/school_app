class School {
  final String name;
  final String imageUrl;
  final String address;
  final String classes;
  final String board;
  final String monthlyFees;
  final int favourites;
  final double distance;
  final bool isAdmissionOpen;
  School({
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.classes,
    required this.board,
    required this.monthlyFees,
    required this.favourites,
    required this.distance,
    this.isAdmissionOpen = false,
  });
}