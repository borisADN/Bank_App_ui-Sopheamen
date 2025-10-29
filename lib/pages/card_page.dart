import 'package:application/data_json/card_json.dart';
import 'package:application/data_json/card_operations_json.dart';
import 'package:application/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: getAppBar(context),
      ),
      body: getBody(context),
    );
  }

  Widget getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back, color: Colors.black, size: 22),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: const Text('Card', style: TextStyle(color: Colors.black)),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget getBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final PageController controller = PageController(initialPage: 0);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 240,
            child: PageView(
              controller: controller,
              children: List.generate(cardLists.length, (index) {
                return getCards(
                  cardLists[index]["amount"],
                  cardLists[index]['currency'],
                  cardLists[index]['card_number'],
                  cardLists[index]['valid_date'],
                  cardLists[index]['bg_color'],
                  context,
                );
              }),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 10,
                  // offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          width: size.width * 0.5,
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: primary, width: 3.5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Operations',
                              style: TextStyle(
                                fontSize: 15,
                                color: primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Flexible(
                        child: Container(
                          width: size.width * 0.5,
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: primary.withOpacity(0.05),
                                width: 3.5,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'History',
                              style: TextStyle(
                                fontSize: 15,
                                color: primary.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Column(
                  children: List.generate(cardOperations.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 10,
                              blurRadius: 10,
                              // offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: secondary.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    cardOperations[index]['icon'],
                                    color: primary,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Text(
                                cardOperations[index]['title'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCards(
    String amount,
    currency,
    cardNumber,
    validDate,
    Color bgColor,
    BuildContext context,
  ) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                currency,
                style: TextStyle(
                  fontSize: 17,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 5),
            Text(
              amount,
              style: TextStyle(
                fontSize: 35,
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),

        Container(
          width: size.width * 0.85,
          height: 170,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.creditCard,
                      size: 30,
                      color: white.withOpacity(0.3),
                    ),
                    SizedBox(height: 15),
                    Text(
                      cardNumber,
                      style: TextStyle(
                        color: white.withOpacity(0.8),
                        fontSize: 20,
                        wordSpacing: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VALID DATE",
                          style: TextStyle(
                            color: white.withOpacity(0.3),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          validDate,
                          style: TextStyle(color: white, fontSize: 13),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/master_card_logo.png",
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
