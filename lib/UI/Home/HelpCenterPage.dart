import 'package:flutter/material.dart';

import 'ContectUsPage.dart';
import 'FQAPage.dart';

class HelpCenterPage extends StatefulWidget {
  HelpCenterPage({super.key});

  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage>
    with SingleTickerProviderStateMixin {
  TabController? _helpCenterTabController;

  @override
  void initState() {
    _helpCenterTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = <Tab>[
      Tab(
        text: "FQA",
      ),
      Tab(
        text: "Contect Us",
      )
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 0, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                Text(
                  "Help Center",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0,
                  width: 35,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: TabBar(
                tabs: tabs,
                controller: _helpCenterTabController,
                unselectedLabelColor: Color(0xFFD1D1D1),
                labelColor: Color(0xFF6F30C0),
                indicatorColor: Color(0xFF6F30C0),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                labelStyle: TextStyle(
                    color: Color(0xFF6F30C0),
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: _helpCenterTabController,
                  children: [FQAPage(), ContectUsPage()]),
            )
          ],
        ),
      ),
    );
  }
}
