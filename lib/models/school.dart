class School {
  final String name;
  final String imageUrl;
  final String address;
  final String completeAddress;
  final String classes;
  final String board;
  final String monthlyFees;
  final int favourites;
  final double distance;
  final bool isAdmissionOpen;
  final String ownership;
  final int establishment;
  final String coEdStatus;
  final String campusType;
  final String campusSize;
  final List<Map<String, String>> formDetails;

  School({
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.completeAddress,
    required this.classes,
    required this.board,
    required this.monthlyFees,
    required this.favourites,
    required this.distance,
    this.isAdmissionOpen = false,
    required this.ownership,
    required this.establishment,
    required this.coEdStatus,
    required this.campusType,
    required this.campusSize,
    required this.formDetails,
  });
}