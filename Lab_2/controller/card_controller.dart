import '../utils/import_export.dart';
class CardController {
  List<Profile> get profiles => Profile.profileList;

  Profile addProfile(
      String cname,
      String name,
      String occupation,
      String phone,
      String website,
      String email,
      String city,
      String address,
      ) {
    final newProfile = Profile(
      cname: cname,
      name: name,
      email: email,
      occupation: occupation,
      city: city,
      phone: phone,
      address: address,
      website: website,
    );
    Profile.profileList.add(newProfile);
    return newProfile;
  }
}
