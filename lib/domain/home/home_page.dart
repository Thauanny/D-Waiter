import 'package:d_waiter/controllers/food_controller.dart';
import 'package:d_waiter/domain/home/components/text_button_underlined.dart';
import 'package:d_waiter/domain/views/search_page.dart';
import 'package:d_waiter/shared/colors.dart';
import 'package:d_waiter/shared/components/food_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
    double _navSpaceW = MediaQuery.of(context).size.width / 2.05;
    double _navSpaceH = MediaQuery.of(context).size.height / 8;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhite,
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 50),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/logout.svg',
                          semanticsLabel: 'logout',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/help.svg',
                          semanticsLabel: 'help',
                        ),
                      ),
                      SizedBox(height: _navSpaceH, width: _navSpaceW),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/notes.svg',
                          semanticsLabel: 'notes',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/shopping_cart.svg',
                          semanticsLabel: 'shopping_cart',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 8,
                      right: MediaQuery.of(context).size.width / 8,
                      top: MediaQuery.of(context).size.height / 20,
                      bottom: MediaQuery.of(context).size.height / 25),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Cardápio",
                          textScaleFactor: 1.5,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      _searchBar(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            TextButtonUnderlined(
                              text: '    Foods    ',
                              interactable: true,
                            ),
                            TextButtonUnderlined(
                              text: '    Drinks    ',
                              interactable: false,
                            ),
                            TextButtonUnderlined(
                              text: '    Snacks    ',
                              interactable: false,
                            ),
                            TextButtonUnderlined(
                              text: '    Sauces    ',
                              interactable: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //foods
                _foodList(context),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const SearchPage());
                      },
                      child: const Text(
                        'See More',
                        style: TextStyle(color: primaryOrange, fontSize: 15),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

Widget _foodList(BuildContext context) => Obx(
      () => _foodController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryOrange,
              ),
            )
          : SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: foodCard(context, _foodController.foodList[i]),
                ),
              ),
            ),
    );

Widget _searchBar() => TextField(
    decoration: const InputDecoration(
        fillColor: secondwhite,
        filled: true,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(80)),
        ),
        hintText: "Search"),
    keyboardType: TextInputType.text,
    onChanged: (value) {
      _foodController.searchText.value = value;
      _foodController.fetchSearchFood();
    });
