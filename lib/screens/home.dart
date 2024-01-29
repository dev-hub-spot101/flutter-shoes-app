import 'package:flutter/material.dart';
import 'package:shoesapp/widgets/bottombar.dart';
import 'package:shoesapp/widgets/shoepage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            color: Color(0xFF545D68),
          ),
          onPressed: () {},
        ),
        title: Text(
          "Home",
          style: TextStyle(fontSize: 20.0, color: Color(0xFF545D68)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Color(0xFF545D68),
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: [
          SizedBox(
            height: 15.0,
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFFc88D67),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45.0),
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: [
              Tab(
                child: Text("All", style: TextStyle(fontSize: 21.0)),
              ),
              Tab(
                child: Text("Latest", style: TextStyle(fontSize: 21.0)),
              ),
              Tab(
                child: Text("Upcoming", style: TextStyle(fontSize: 21.0)),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [ShoesPage(), ShoesPage(), ShoesPage()],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.dashboard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
