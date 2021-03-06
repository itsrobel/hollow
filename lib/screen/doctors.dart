import 'package:flutter/material.dart';
import 'package:hollow_flutter/widget/drawer.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  void showDrawer() {
    print('tapped on show drawer!');
    setState(() {
      _showDrawer = !_showDrawer;
    });
  }

  bool _showDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xFF44475a),
          appBar: AppBar(
            title: Text('Doctors'),
            centerTitle: true,
            backgroundColor: Color(0xFF282a36),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: showDrawer,
            backgroundColor: Color(0xFF282a36),
            child: Icon(
              Icons.menu_rounded,
            ),
          ),
          body: Center(
            child: Image(
                image: AssetImage('assets/698610.jpg'), fit: BoxFit.cover),
          ),
        ),
        if (_showDrawer)
          DrawerWidget(
            closeFunction: showDrawer,
          ),
      ],
    );
  }
}

// class DoctorRepository{
//   var Doctors = new List()
// }


// class ListViewDataSource extends paging.PageKeyedDataSource<int, Note> {
//   NoteRepository noteRepository;
//   ListViewDataSource(this.noteRepository) {
//     isEndList = false;
//   }

//   @override
//   Future<Tuple2<List<Note>, int>> loadInitial() async {
//     final result = await noteRepository.getNotes(0);
//     return Tuple2(result, 0);
//   }

//   @override
//   Future<Tuple2<List<Note>, int>> loadPageAfter(int params) async {
//     if (params == 6) isEndList = true;
//     final result = await noteRepository.getNotes(params + 1);
//     return Tuple2(result, params + 1);
//   }
// }
//       ListViewDataSource dataSource = ListViewDataSource(NoteRepository());

//       PagingListView<Note>(
//         itemBuilder: (context, data, child) => NoteWidget(data),
//         pageDataSource: dataSource,
//       ),