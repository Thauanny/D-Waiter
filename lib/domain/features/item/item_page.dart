import 'package:flutter/material.dart';

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
              height: 250,
              width: 250,
              child: PageView.builder(
                  itemCount: widget.food.imageUrls.length,
                  controller: PageController(viewportFraction: 1),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (_, i) => Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: _imageCard(widget.food, i))),
            ),
            const SizedBox(
              height: 30,
            ),
            _imageCountindicators(),
            const SizedBox(
              height: 20,
            ),
            _nameLabel(widget.food),
            const SizedBox(
              height: 20,
            ),
            _priceLabel(widget.food),
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
            _informationLabel('Observações de preparo'),
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
            PrimaryButton(
                text: 'Adicionar ao Carrinho',
                onPressed: () {
                  widget.onCartPressed();

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
        height: 180,
        width: 180,
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
              r'R$ ' + food.price.toString(),
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
