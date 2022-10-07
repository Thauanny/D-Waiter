import 'package:d_waiter/domain/features/home/presenters/home/components/foods_tab_component.dart';
import 'package:d_waiter/domain/features/home/presenters/home/components/icon_cart_button_component.dart';
import 'package:d_waiter/domain/features/home/presenters/home/components/icon_orders_button_component.dart';
import 'package:d_waiter/infra/services/kitchen_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../design_system/colors.dart';
import '../../../../../infra/services/food_service.dart';
import '../../controllers/home_controller.dart';
import 'components/icon_help_button_component.dart';
import 'components/icon_logOut_button_component.dart';
import 'components/searchbar_component.dart';
import 'components/tabbar_component.dart';
import 'components/title_label.dart';

class HomePage extends StatefulWidget {
  final HomeController controller = HomeController(
    Get.find<FoodService>(),
    Get.find<KitchenService>(),
  );

  HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 4,
        child: widget.controller.isLoading.isTrue
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : widget.controller.foodList.isEmpty
                ? Scaffold(
                    body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.error),
                        Text("Erro ao carregar dados")
                      ],
                    ),
                  ))
                : Scaffold(
                    appBar: AppBar(
                      toolbarHeight: MediaQuery.of(context).size.height * 0.5,
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
                                  children: [
                                    IconLogOutButonComponent(
                                        controller: widget.controller),
                                    IconHelpButonComponent(
                                        controller: widget.controller)
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconOrdersButonComponent(
                                        controller: widget.controller),
                                    IconCartButonComponent(
                                      controller: widget.controller,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const TitleLabel(),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: SearchBarComponent(
                                controller: widget.controller),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const TabBarComponent(),
                        ],
                      ),
                    ),
                    resizeToAvoidBottomInset: false,
                    backgroundColor: secondwhite,
                    body: TabBarView(
                      children: [
                        FoodsTabComponent(
                            verify: widget.controller.foodList.isEmpty,
                            list: widget.controller.foodList,
                            controller: widget.controller),
                        FoodsTabComponent(
                            verify: widget.controller.drinksList.isEmpty,
                            list: widget.controller.drinksList,
                            controller: widget.controller),
                        FoodsTabComponent(
                            verify: widget.controller.foodList.isEmpty,
                            list: widget.controller.foodList,
                            controller: widget.controller),
                        FoodsTabComponent(
                            verify: widget.controller.drinksList.isEmpty,
                            list: widget.controller.drinksList,
                            controller: widget.controller),
                      ],
                    ),
                  ),
      ),
    );
  }
}
