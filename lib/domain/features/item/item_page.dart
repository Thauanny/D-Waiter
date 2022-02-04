import 'package:flutter/material.dart';
import 'package:localization/src/localization_extension.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/components/primary_button.dart';
import '../entities/food.dart';

class ItemPage extends StatefulWidget {
  final Food food;
  final Function() onCartPressed;

  const ItemPage({
    Key? key,
    required this.food,
    required this.onCartPressed,
  }) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int _index = 0;

  Widget _imageCountindicators() => SizedBox(
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.circle,
              color: _index == 0 ? primaryOrange : Colors.grey,
              size: 10,
            ),
            Icon(
              Icons.circle,
              color: _index == 1 ? primaryOrange : Colors.grey,
              size: 10,
            ),
          ],
        ),
      );

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
        Column(
          children: [
            SizedBox(
              height: 260,
              width: 260,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                elevation: 40,
                color: Colors.grey.withOpacity(0.1),
                child: PageView.builder(
                    itemCount: widget.food.imageUrls.length,
                    controller: PageController(viewportFraction: 1),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) => Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: _imageCard(widget.food, i))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            _imageCountindicators(),
            const SizedBox(
              height: 30,
            ),
            _nameLabel(widget.food),
            const SizedBox(
              height: 30,
            ),
            _priceLabel(widget.food),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            _informationLabel('food-information-label-text'.i18n()),
            const SizedBox(
              height: 10,
            ),
            widget.food.name.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: primaryOrange,
                    ),
                  )
                : _detailsLabel(widget.food.name, context),
            const SizedBox(
              height: 30,
            ),
            _informationLabel('order-notes-label-text'.i18n()),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: TextField(
                onChanged: (value) {
                  widget.food.note = value;
                },
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryOrange),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _informationLabel('preparation-notes-label-text'.i18n()),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 100,
              child: Text(
                '"preparation-notes-info-text'.i18n(),
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(
                text: 'add-to-cart-text'.i18n(),
                onPressed: () {
                  widget.onCartPressed();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('added-to-cart-text'.i18n()),
                    backgroundColor: Colors.green,
                  ));
                }),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ]),
    );
  }
}

Widget _informationLabel(String text) => Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget _imageCard(Food food, int index) => ClipRRect(
      borderRadius: BorderRadius.circular(200),
      child: Image.network(
        food.imageUrls[index],
        fit: BoxFit.fill,
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
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );

Widget _priceLabel(Food food) => SizedBox(
      width: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              r'R$ ' + food.price.toString(),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: primaryOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
