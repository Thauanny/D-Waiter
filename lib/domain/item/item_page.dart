import 'dart:ui';

import 'package:d_waiter/controllers/food_controller.dart';
import 'package:d_waiter/shared/colors.dart';
import 'package:d_waiter/shared/components/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:d_waiter/domain/models/food.dart';
import 'package:get/get.dart';

final FoodController _foodController = Get.put(FoodController());

class ItemPage extends StatefulWidget {
  final Food food;
  const ItemPage(this.food, {Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState(food);
}

class _ItemPageState extends State<ItemPage> {
  final Food food;
  _ItemPageState(this.food);
  @override
  void initState() {
    _foodController.fetchDetailsOfAFood(food.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        foregroundColor: primaryOrange,
        elevation: 0,
        backgroundColor: primaryWhite,
      ),
      body: ListView(children: [
        Obx(
          () => Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              _imageCard(food),
              const SizedBox(
                height: 30,
              ),
              _imageCountindicators(),
              const SizedBox(
                height: 20,
              ),
              _nameLabel(food),
              const SizedBox(
                height: 20,
              ),
              _priceLabel(food),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              _informationLabel('Informações do prato'),
              const SizedBox(
                height: 10,
              ),
              _foodController.foodDetails.value.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryOrange,
                      ),
                    )
                  : _detailsLabel(_foodController.foodDetails.value, context),
              const SizedBox(
                height: 30,
              ),
              _informationLabel('Observações de preparo'),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: const TextField(
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryOrange),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _informationLabel('Observações de preparo'),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                height: 100,
                child: const Text(
                  'Para a devolução e motivos chamar um atendente para realizar a troca ou estorno do prato',
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              PrimaryButton(context, 'Adicionar ao Carrinho', () {
                _foodController.cart.add(food);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Adicionado ao carrinho'),
                  backgroundColor: Colors.green,
                ));
              }),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

Widget _informationLabel(String text) => Padding(
      padding: EdgeInsets.only(left: 30.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
Widget _imageCountindicators() => SizedBox(
      width: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(
            Icons.circle,
            color: primaryOrange,
            size: 10,
          ),
          Icon(
            Icons.circle,
            color: Colors.grey,
            size: 10,
          ),
          Icon(
            Icons.circle,
            color: Colors.grey,
            size: 10,
          ),
        ],
      ),
    );

Widget _imageCard(Food food) => Card(
      elevation: 50,
      shadowColor: Colors.grey[300],
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Image.network(
          food.imageUrl,
          height: 180,
          width: 180,
          fit: BoxFit.fill,
        ),
      ),
    );

Widget _detailsLabel(String details, BuildContext context) => Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 100,
        height: 300,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                details,
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );

Widget _nameLabel(Food food) => Center(
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                food.name,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );

Widget _priceLabel(Food food) => SizedBox(
      width: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              r'R$ ' + food.price,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: primaryOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
