import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/widget/drawer.dart';

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
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Doctors'),
            centerTitle: true,
            backgroundColor: Color(0xff251F34),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: showDrawer,
            backgroundColor: Color(0xff251F34),
            child: Icon(
              Icons.menu_rounded,
            ),
          ),
          body: Center(
            child: Image(
              image: AssetImage(
                'assets/outer_space.png',
              ),
            ),
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