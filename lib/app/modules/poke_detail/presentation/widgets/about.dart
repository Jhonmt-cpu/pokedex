import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/modules/poke_detail/presentation/poke_detail_controller.dart';
import 'package:pokedex_modular/app/modules/poke_detail/presentation/widgets/about_tab.dart';

import 'evolution_tab.dart';
import 'sprites_tab.dart';
import 'stats_tab.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends ModularState<About, PokeDetailController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Observer(builder: (context) {
            return TabBar(
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                );
              },
              controller: _tabController,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w700,
              ),
              indicatorSize: TabBarIndicatorSize.label, //makes it better
              labelColor: controller.pokemonColor, //Google's sweet blue
              unselectedLabelColor: Color(0xff5f6368), //niceish grey
              isScrollable: true, //up to your taste
              indicator: MD2Indicator(
                  //it begins here
                  indicatorHeight: 3,
                  indicatorColor: controller.pokemonColor,
                  indicatorSize: MD2IndicatorSize
                      .normal //3 different modes tiny-normal-full
                  ),
              tabs: <Widget>[
                Tab(
                  text: "About",
                ),
                Tab(
                  text: "Evolution",
                ),
                Tab(
                  text: "Sprites",
                ),
                Tab(
                  text: "Stats",
                ),
              ],
            );
          }),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          _tabController.animateTo(
            index,
            duration: Duration(milliseconds: 300),
          );
        },
        controller: _pageController,
        children: [
          AboutTab(),
          EvolutionTab(),
          SpritesTab(),
          StatsTab(),
        ],
      ),
    );
  }
}
