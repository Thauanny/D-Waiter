import 'package:d_waiter/controllers/food_controller.dart';
import 'package:d_waiter/domain/cart/cart_page.dart';
import 'package:d_waiter/domain/home/components/text_button_underlined.dart';
import 'package:d_waiter/domain/orders/orders_page.dart';
import 'package:d_waiter/domain/welcome_page.dart';
import 'package:d_waiter/shared/colors.dart';
import 'package:d_waiter/shared/components/food_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'see_more/see_more_page.dart';

final FoodController _foodController = Get.put(FoodController());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
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
            _viewTab1(context),
            _viewTab1(context),
            _viewTab1(context),
            _viewTab1(context)
          ],
        ),
      ),
    );
  }
}

Widget _tabBar() => const TabBar(
        automaticIndicatorColorAdjustment: true,
        labelColor: primaryOrange,
        isScrollable: true,
        indicatorColor: primaryOrange,
        labelStyle: TextStyle(color: primaryOrange),
        tabs: [
          Tab(
            child: TextButtonUnderlined(
              text: '   Foods    ',
              fontSize: 18,
              interactable: false,
            ),
          ),
          Tab(
            child: TextButtonUnderlined(
              text: '   Drinks    ',
              fontSize: 18,
              interactable: false,
            ),
          ),
          Tab(
            child: TextButtonUnderlined(
              text: '    Snacks  ',
              fontSize: 18,
              interactable: false,
            ),
          ),
          Tab(
            child: TextButtonUnderlined(
              text: '    Sauces  ',
              fontSize: 18,
              interactable: false,
            ),
          ),
        ]);

Widget _titleLabel() => const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Cardápio",
        textScaleFactor: 1.5,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
    );

Widget _viewTab1(BuildContext context) => ListView(children: [
      _foodList(context),
      Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 40),
        child: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              _foodController.foodList.isEmpty
                  ? () {}
                  : Get.to(() => const SeeMorePage());
            },
            child: Obx(
              () => Text(
                'See More',
                style: TextStyle(
                    color: _foodController.foodList.isEmpty
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
        Get.to(() => const CartPage());
      },
      icon: SvgPicture.asset(
        'assets/icons/shopping_cart.svg',
        semanticsLabel: 'shopping_cart',
        height: 26,
      ),
    );

Widget _iconOrders() => IconButton(
      onPressed: () {
        Get.to(() => const OrderPage());
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
            return const AlertDialog(
              title: Text('Instruções'),
              content: Text('Aqui terão instruções'),
            );
          },
        );
      },
      icon: SvgPicture.asset(
        'assets/icons/help.svg',
        semanticsLabel: 'help',
        height: 26,
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
    () => _foodController.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(
              color: primaryOrange,
            ),
          )
        : _foodController.foodList.isEmpty
            ? Column(
                children: const [
                  Icon(
                    Icons.search,
                    size: 70,
                    color: Colors.grey,
                  ),
                  Text(
                    'Item not Found',
                    style: TextStyle(fontSize: 30, color: Colors.grey),
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
                    itemCount: _foodController.foodList.length < 5
                        ? _foodController.foodList.length
                        : 5,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FoodCard(context, _foodController.foodList[i]),
                    ),
                  ),
                ),
              ),
  );
}

Widget _searchBar() => TextField(
    style: const TextStyle(fontSize: 20),
    decoration: const InputDecoration(
      fillColor: secondwhite,
      filled: true,
      prefixIcon: Icon(
        Icons.search,
        color: primaryOrange,
        size: 35,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(80)),
      ),
      hintText: "Search",
    ),
    keyboardType: TextInputType.text,
    onChanged: (value) {
      _foodController.searchText.value = value;
      _foodController.fetchSearchFood();
    });
