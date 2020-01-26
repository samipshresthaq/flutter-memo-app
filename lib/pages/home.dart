import 'package:flutter/material.dart';
import 'package:memoapp/pages/camera.dart';
import 'package:memoapp/pages/create.dart';
import 'package:memoapp/pages/memoList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties
  int currentTab = 0;
  final List<Widget> screens = [
    MemoList(),
    CreatePage(),
    CameraPage()
  ]; //To store tab views

  // Active Tab
  Widget currentScreen = MemoList(); //Initial Page in viewport

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      // Fab Button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor:
            currentTab == 2 ? Colors.orangeAccent[400] : Colors.grey,
        onPressed: () {
          setState(() {
            currentScreen = CreatePage();
            currentTab = 2;
          });
        },
      ),
      //  Fab position
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Bottom App Bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                            // minWidth: 80,
                            onPressed: () {
                              setState(() {
                                currentScreen = MemoList();
                                currentTab = 0;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.home,
                                  color: currentTab == 0
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                Text(
                                  'Home',
                                  style: TextStyle(
                                      color: currentTab == 0
                                          ? Colors.blue
                                          : Colors.grey),
                                )
                              ],
                            ))
                      ]),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                        // minWidth: 80,
                        onPressed: () {
                          setState(() {
                            currentScreen = CameraPage();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.camera,
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.grey,
                            ),
                            Text(
                              'Camera',
                              style: TextStyle(
                                  color: currentTab == 1
                                      ? Colors.blue
                                      : Colors.grey),
                            )
                          ],
                        ))
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
