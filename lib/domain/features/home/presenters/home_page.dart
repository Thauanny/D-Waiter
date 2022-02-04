import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:localization/src/localization_extension.dart';

import '../../../../../../design_system/colors.dart';
import '../../../../../../design_system/components/food_card.dart';
import '../../../../../../design_system/components/text_button_underlined.dart';
import '../../../../infra/services/food_service.dart';
import '../../cart/cart_page.dart';
import '../../orders/orders_page.dart';
import '../../welcome/welcome_page.dart';
import '../controllers/home_controller.dart';
import 'see_more_page.dart';

class HomePage extends StatefulWidget {
  final HomeController controller = HomeController(
    Get.find<FoodServiceImpl>(),
  );

  HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget _tabBar() => TabBar(
          automaticIndicatorColorAdjustment: true,
          labelColor: primaryOrange,
          isScrollable: true,
          indicatorColor: primaryOrange,
          labelStyle: const TextStyle(color: primaryOrange),
          tabs: [
            Tab(
              child: TextButtonUnderlined(
                text: 'foods-label-text'.i18n(),
                fontSize: 18,
                interactable: false,
              ),
            ),
            Tab(
              child: TextButtonUnderlined(
                text: 'drinks-label-text'.i18n(),
                fontSize: 18,
                interactable: false,
              ),
            ),
            Tab(
              child: TextButtonUnderlined(
                text: 'snacks-label-text'.i18n(),
                fontSize: 18,
                interactable: false,
              ),
            ),
            Tab(
              child: TextButtonUnderlined(
                text: 'sauces-label-text'.i18n(),
                fontSize: 18,
                interactable: false,
              ),
            ),
          ]);

  Widget _titleLabel() => Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'menu-text'.i18n(),
          textScaleFactor: 1.5,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      );

  Widget _foodsTab(BuildContext context) => ListView(children: [
        _foodList(context),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, bottom: 40),
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                widget.controller.foodList.isEmpty
                    ? () {}
                    : Get.to(() => SeeMorePage(
                          controller: widget.controller,
                        ));
              },
              child: Obx(
                () => Text(
                  'see-more-text'.i18n(),
                  style: TextStyle(
                      color: widget.controller.foodList.isEmpty
                          ? Colors.grey
                          : primaryOrange,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ]);

  Widget _drinksTab(BuildContext context) => ListView(children: [
        _drinkList(context),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, bottom: 40),
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                widget.controller.drinksList.isEmpty
                    ? () {}
                    : Get.to(() => SeeMorePage(
                          controller: widget.controller,
                        ));
              },
              child: Obx(
                () => Text(
                  'see-more-text'.i18n(),
                  style: TextStyle(
                      color: widget.controller.drinksList.isEmpty
                          ? Colors.grey
                          : primaryOrange,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ]);

  Widget _iconCart() => IconButton(
        onPressed: () {
          Get.to(() => CartPage(controller: widget.controller));
        },
        icon: SvgPicture.asset(
          'assets/icons/shopping_cart.svg',
          semanticsLabel: 'shopping_cart',
          height: 26,
        ),
      );

  Widget _iconOrders() => IconButton(
        onPressed: () {
          Get.to(() => OrderPage(
                controller: widget.controller,
              ));
        },
        icon: SvgPicture.asset(
          'assets/icons/notes.svg',
          semanticsLabel: 'notes',
          height: 26,
        ),
      );

  Widget _iconHelp(BuildContext context) => IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('instructions-text'.i18n()),
                content: Text('instructions-info-text'.i18n()),
              );
            },
          );
        },
        icon: SvgPicture.asset(
          'assets/icons/help.svg',
          semanticsLabel: 'help',
          height: 26,
          color: primaryOrange,
        ),
      );

  Widget _iconLogOut() => IconButton(
        onPressed: () {
          //TODO: clean all datas
          Get.off(() => const WelcomePage());
        },
        icon: SvgPicture.asset(
          'assets/icons/logout.svg',
          height: 26,
          semanticsLabel: 'logout',
        ),
      );

  Widget _foodList(BuildContext context) {
    return Obx(
      () => widget.controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryOrange,
              ),
            )
          : widget.controller.foodList.isEmpty
              ? Column(
                  children: [
                    const Icon(
                      Icons.search,
                      size: 70,
                      color: Colors.grey,
                    ),
                    Text(
                      'item-not-found-text'.i18n(),
                      style: const TextStyle(fontSize: 30, color: Colors.grey),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.controller.foodList.length < 5
                          ? widget.controller.foodList.length
                          : 5,
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: foodCard(context, widget.controller,
                            widget.controller.foodList[i]),
                      ),
                    ),
                  ),
                ),
    );
  }

  Widget _drinkList(BuildContext context) {
    return Obx(
      () => widget.controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryOrange,
              ),
            )
          : widget.controller.drinksList.isEmpty
              ? Column(
                  children: [
                    const Icon(
                      Icons.search,
                      size: 70,
                      color: Colors.grey,
                    ),
                    Text(
                      'item-not-found-text'.i18n(),
                      style: const TextStyle(fontSize: 30, color: Colors.grey),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.controller.drinksList.length < 5
                          ? widget.controller.drinksList.length
                          : 5,
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: foodCard(context, widget.controller,
                            widget.controller.drinksList[i]),
                      ),
                    ),
                  ),
                ),
    );
  }

  Widget _searchBar() => TextField(
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        fillColor: secondwhite,
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          color: primaryOrange,
          size: 35,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(80)),
        ),
        hintText: "search-text".i18n(),
      ),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        widget.controller.searchText.value = value;
        widget.controller.fetchSearchFood();
      });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height - 500,
          elevation: 0,
          backgroundColor: primaryWhite,
          title: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [_iconLogOut(), _iconHelp(context)],
                    ),
                    Row(
                      children: [_iconOrders(), _iconCart()],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              _titleLabel(),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: _searchBar(),
              ),
              const SizedBox(
                height: 50,
              ),
              _tabBar(),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryWhite,
        body: TabBarView(
          children: [
            _foodsTab(context),
            _drinksTab(context),
            _foodsTab(context),
            _foodsTab(context)
          ],
        ),
      ),
    );
  }
}
