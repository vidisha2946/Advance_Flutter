import '../utils/import_export.dart';
class VisitingCard extends StatelessWidget {
  final Profile profile;
   VisitingCard({super.key, required this.profile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 500,
          front: _buildFrontCard(),
          back: _buildBackCard(),
        ),
      ),
    );
  }

  Widget _buildFrontCard() {
    return Container(
      width: 450,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Left Logo
          Expanded(
            flex: 4,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(Icons.shield, size: 50, color: Colors.brown),
                   SizedBox(height: 8),
                  Text(profile.cname,
                      style: TextStyle(color: Colors.brown.shade200, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          // Right Info
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.brown.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _infoRow(Icons.person, profile.name),
                  _infoRow(Icons.work, profile.occupation),
                  _infoRow(Icons.phone, profile.phone),
                  _infoRow(Icons.language, profile.website),
                  _infoRow(Icons.email, profile.email),
                  _infoRow(Icons.location_on, profile.city),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      width: 450,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.brown.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(Icons.shield, size: 50, color: Colors.black),
             SizedBox(height: 8),
            Text(profile.cname,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
             Text(MSG),
             SizedBox(height: 16),
             Text(profile.website,style: TextStyle(color: Colors.black87)),
            SizedBox(height: 16),
            Text(profile.address,style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.black),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              data,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
