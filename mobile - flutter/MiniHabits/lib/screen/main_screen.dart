import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_habits/model/user.dart';
import 'package:mini_habits/screen/friend_minihabit_screen.dart';
import 'package:mini_habits/screen/friends_list_screen.dart';
import 'package:mini_habits/screen/settings_screen.dart';
import 'package:mini_habits/services/mini_habit_data_service.dart';
import 'package:mini_habits/services/user_service.dart';

import '../model/MiniHabitsData.dart';
import 'domains_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  ///Contains the main 3 screen in a Page View (horizontal scrool menu)
  MainScreen(this.curentUser);

  MiniHabitData miniHabitData = MiniHabitData(actives: [], pasives: []);
  AppUser curentUser;
  List<AppUser> specialistList = [];
  AppUser? curentSpecialist;
  MiniHabitData specialistMiniHabit = MiniHabitData(actives: [], pasives: []);
  bool isFriendSelected = false;
  int curentScreenIndex = 2;
  bool isEditDomainsState = false;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController(initialPage: 2);
  final GlobalKey<DomainScreenState> _myWidgetState =
      GlobalKey<DomainScreenState>();

  void _onTabTapped(int index) {
    int velocity = ((widget.curentScreenIndex - index).abs() > 1) ? 500 : 300;
    setState(
      () {
        widget.curentScreenIndex = index;
        _pageController.animateToPage(widget.curentScreenIndex,
            duration: Duration(milliseconds: velocity), curve: Curves.easeIn);
      },
    );
  }

  Future<MiniHabitData> _loadData() async {
    widget.specialistList = (await AppUserService.getAllSpecialists())
        .where((specialist) => specialist.uid != widget.curentUser.uid)
        .toList();
    widget.miniHabitData =
        await MiniHabitsDataService.getMiniHabitData(widget.curentUser);
    return widget.miniHabitData;
  }

  Future<void> _viewSpecialistMiniHabit(AppUser appUser) async {
    widget.specialistMiniHabit =
        await MiniHabitsDataService.getMiniHabitData(appUser);
    setState(() {
      widget.isFriendSelected = true;
      widget.curentSpecialist = appUser;
    });
  }

  void _viewSpecialistsList() {
    setState(() {
      widget.isFriendSelected = false;
      widget.curentSpecialist = null;
    });
  }

  void changeEditingDomainState() {
    setState(() {
      widget.isEditDomainsState = !widget.isEditDomainsState;
    });
  }

  Text getTitle() {
    final isOnFirendMiniHabitsScreen =
        widget.curentScreenIndex == 2 && widget.isFriendSelected;
    if (widget.curentScreenIndex == 0)
      return Text('Welcome ${widget.curentUser.username}!');
    if (isOnFirendMiniHabitsScreen)
      return Text(widget.curentSpecialist!.username);
    return const Text('Mini Habits');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOnSpecilist =
        widget.curentScreenIndex == 2 && widget.isFriendSelected;
    return Scaffold(
      key: _scaffoldKey,

      ///AppBar
      appBar: AppBar(
        title: getTitle(),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        leading: isOnSpecilist
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _viewSpecialistsList,
              )
            : IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),

      /// Drawer
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
              ),
              child: const Center(child: Text('Menu')),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SettingsScreen(appUser: widget.curentUser)));
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),

      ///Body
      body: FutureBuilder<Object>(
          future: _loadData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              widget.miniHabitData = snapshot.data as MiniHabitData;
            }
            return PageView(
              onPageChanged: (index) => {
                setState(() {
                  widget.curentScreenIndex = index;
                })
              },
              controller: _pageController,
              children: [
                HomeScreen(widget.miniHabitData),
                DomainScreen(
                  miniHabitData: widget.miniHabitData,
                  isEditDomain: widget.isEditDomainsState,
                  toggleEditDomainState: changeEditingDomainState,
                  key: _myWidgetState,
                ),
                widget.isFriendSelected
                    ? SpecialistMiniHabitScreen(
                        widget.miniHabitData,
                        widget.specialistMiniHabit,
                        // widget.isEditDomainsState,
                      )
                    : SpecialistListScreen(
                        _viewSpecialistMiniHabit, widget.specialistList),
              ],
            );
          }),
      backgroundColor: theme.colorScheme.background,

      ///Botttom Navigation Bar
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          currentIndex: widget.curentScreenIndex,
          backgroundColor: theme.colorScheme.primary,
          unselectedItemColor: theme.bottomAppBarColor,
          selectedItemColor: theme.colorScheme.secondary,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: "Domains",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_rounded),
              label: "Social",
            )
          ],
        ),
      ),

      ///Floating point (is visible just when user edit domains)
      floatingActionButton: Visibility(
        visible: widget.isEditDomainsState && widget.curentScreenIndex == 1,
        child: FloatingActionButton(
          foregroundColor: theme.colorScheme.background,
          onPressed: () {
            _myWidgetState.currentState?.addNewDomain();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
