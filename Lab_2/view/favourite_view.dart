import '../controller/favourite_controller.dart';
import '../utils/import_export.dart';
class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}
class _FavouriteViewState extends State<FavouriteView> {
  StudentController controller = StudentController();
  @override
  Widget build(BuildContext context) {

    var fav = controller.studentValue.where((s) => s.isFav == true).toList();
    var unfav = controller.studentValue.where((s) => s.isFav == false).toList();

    return Scaffold(
      appBar: AppBar(title: Text(APP_TITLE) , backgroundColor: Colors.pinkAccent.shade100,),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(UNFAVOURITE_STUDENT),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: unfav.length,
              itemBuilder: (context, index) {
                var student = unfav[index];
                int originalIndex = controller.studentValue.indexOf(student);
                return ListTile(
                  title: Text(student.name!),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        controller.toggle(originalIndex);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const Text(FAVOURITE_STUDENT),
          Expanded(
            child: ListView.builder(
              itemCount: fav.length,
              itemBuilder: (context, index) {
                var student = fav[index];
                int originalIndex = controller.studentValue.indexOf(student);
                return ListTile(
                  title: Text(student.name!),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        controller.toggle(originalIndex);
                      });
                    },
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
