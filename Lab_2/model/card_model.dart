class Profile {
  final String cname;
  final String name;
  final String occupation;
  final String phone;
  final String email;
  final String website;
  final String city;
  final String address;

  Profile({
    required this.cname,
    required this.name,
    required this.email,
    required this.occupation,
    required this.city,
    required this.address,
    required this.phone,
    required this.website,
  });

  static List<Profile> profileList = [];
}
