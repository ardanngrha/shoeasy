import 'package:flutter/material.dart';
import 'package:shoesye/theme.dart';
import 'package:shoesye/widgets/product_card.dart';
import 'package:shoesye/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        right: defaultMargin,
        left: defaultMargin,
      ),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Hello, Adan!',
                style: primaryTextStyle.copyWith(
                    fontSize: 24, fontWeight: semiBold),
              ),
              Text(
                '@adanngrha',
                style: subtitleTextStyle.copyWith(fontSize: 16),
              ),
            ]),
          ),
          Container(
            height: 54,
            width: 54,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/image_profile.png'))),
          ),
        ],
      ),
    );
  }

  Widget categories() {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: defaultMargin,
            ),
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor,
              ),
              child: Text(
                'All Shoes',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparentColor,
                  border: Border.all(
                    color: subtitleColor,
                  )),
              child: Text(
                'Running',
                style: subtitleTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparentColor,
                  border: Border.all(
                    color: subtitleColor,
                  )),
              child: Text(
                'Basketball',
                style: subtitleTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparentColor,
                  border: Border.all(
                    color: subtitleColor,
                  )),
              child: Text(
                'Training',
                style: subtitleTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparentColor,
                  border: Border.all(
                    color: subtitleColor,
                  )),
              child: Text(
                'Hiking',
                style: subtitleTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget popularProductsTitle() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Text(
        'Popular Products',
        style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget popoularProducts() {
    return Container(
      margin: const EdgeInsets.only(
        top: 14,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: defaultMargin,
            ),
            Row(
              children: const [
                ProductCard(),
                ProductCard(),
                ProductCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget newArrivalsTitle() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Text(
        'New Arrivals',
        style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget newArrivals() {
    return Container(
      margin: const EdgeInsets.only(top: 14,),
      child: Column(children: [
        ProductTile(),
        ProductTile(),
        ProductTile(),
        ProductTile(),
      ],),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popoularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
