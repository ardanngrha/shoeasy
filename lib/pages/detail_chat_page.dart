import 'package:flutter/material.dart';
import 'package:shoeasy/models/product_model.dart';
import 'package:shoeasy/theme.dart';
import 'package:shoeasy/widgets/chat_bubble.dart';

// ignore: must_be_immutable
class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage(this.product, {Key? key}) : super(key: key);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  header() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/image_shop_logo_online.png',
              width: 50,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shoesye Store',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Online',
                  style: secondaryTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget productPreview() {
    return Container(
      width: 225,
      height: 74,
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor5,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: primaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.product.galleries![0].url,
              width: 54,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.product.name.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '\$${widget.product.price}',
                  style: priceTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.product = UninitializedProductModel();
              });
            },
            child: Image.asset(
              'assets/button_close.png',
              width: 23,
            ),
          ),
        ],
      ),
    );
  }

  Widget chatInput() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.product is UninitializedProductModel
              ? const SizedBox()
              : productPreview(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Type Message...',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/button_send.png',
                width: 45,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget content() {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      children: const [
        ChatBubble(
          isSender: true,
          text: 'Hi, This item is still available?',
          hasProduct: true,
        ),
        ChatBubble(
          isSender: false,
          text: 'Good night, This item is only available in size 42 and 43',
          hasProduct: false,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
