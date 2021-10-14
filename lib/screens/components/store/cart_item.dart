import 'package:flutter/material.dart';

import 'package:visual_ai/responsive.dart';
import 'package:visual_ai/constants.dart';
import 'package:visual_ai/screens/components/animations/blinking_content.dart';

import 'package:visual_ai/content/store/content.dart';


class CartItem extends StatelessWidget {
  const CartItem(
    this.cart_item, {
    Key? key,
  }) : super(key: key);

  final StoreContent cart_item;


  Widget productCart() {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: FadeAnimation(
        1.5,
        Container(
          margin: EdgeInsets.only(right: 20, bottom: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [BoxShadow(
              offset: Offset(5, 10),
              blurRadius: 15,
              color: Colors.grey.shade200,
            )],
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: cart_item.icon,
                      ),
                    ),
                    // Add to cart button
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: MaterialButton(
                        color: Colors.black,
                        minWidth: 45,
                        height: 45,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        onPressed: () {
                          addToCartModal();
                        },
                        padding: EdgeInsets.all(5),
                        child: Center(child: Icon(Icons.shopping_cart, color: Colors.white, size: 20)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(cart_item.title,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cart_item.released_str, style: TextStyle(color: Colors.orange.shade400, fontSize: 14)),
                  Text(cart_item.price_str,
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget forYou() {
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: FadeAnimation(1.5, Container(
        margin: EdgeInsets.only(right: 20, bottom: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow(
            offset: Offset(5, 10),
            blurRadius: 15,
            color: Colors.grey.shade200,
          )],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: cart_item.icon,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(cart_item.title,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(cart_item.released_str, style: TextStyle(color: Colors.orange.shade400, fontSize: 13)),
                  SizedBox(height: 10),
                  Text(cart_item.price_str,
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ]
              ),
            )
          ],
        ),
      )),
    );
  }

  void showFilterModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Filter', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        minWidth: 40,
                        height: 40,
                        color: Colors.grey.shade300,
                        elevation: 0,
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(Icons.close, color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Color', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 10),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: _selectedColor == index ? colors[index] : colors[index].withOpacity(0.5),
                              shape: BoxShape.circle
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: _selectedColor == index ? Icon(Icons.check, color: Colors.white) : Container(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Size', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: size.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSize = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: _selectedSize == index ? Colors.yellow[800] : Colors.grey.shade200,
                              shape: BoxShape.circle
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Text(size[index], style: TextStyle(color: _selectedSize == index ? Colors.white : Colors.black, fontSize: 15)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Slider Price Renge filter
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price Range', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('\$ ${selectedRange.start.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                          Text(' - ', style: TextStyle(color: Colors.grey.shade500)),
                          Text('\$ ${selectedRange.end.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  RangeSlider(
                    values: selectedRange,
                    min: 0.00,
                    max: 2000.00,
                    divisions: 100,
                    inactiveColor: Colors.grey.shade300,
                    activeColor: Colors.yellow[800],
                    labels: RangeLabels('\$ ${selectedRange.start.toStringAsFixed(2)}', '\$ ${selectedRange.end.toStringAsFixed(2)}'),
                    onChanged: (RangeValues values) {
                      setState(() => selectedRange = values);
                    }
                  ),
                  SizedBox(height: 20),
                  button('Filter', () {})
                ],
              ),
            );
          }
        );
      },
    );
  }

  void addToCartModal() {
    showModalBottomSheet(
      context: context,
      transitionAnimationController: AnimationController(duration: Duration(milliseconds: 400), vsync: this),
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: 350,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Color', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 10),
                Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColor = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: _selectedColor == index ? colors[index] : colors[index].withOpacity(0.5),
                            shape: BoxShape.circle
                          ),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: _selectedColor == index ? Icon(Icons.check, color: Colors.white) : Container(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text('Size', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 10),
                Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: size.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedSize = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: _selectedSize == index ? Colors.yellow[800] : Colors.grey.shade200,
                            shape: BoxShape.circle
                          ),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Text(size[index], style: TextStyle(color: _selectedSize == index ? Colors.white : Colors.black, fontSize: 15)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                button('Add to Cart', () {
                  Navigator.pop(context);

                  // Let's show a snackbar when an item is added to the cart
                  final snackbar = SnackBar(
                    content: Text('Item added to cart'),
                    duration: Duration(seconds: 5),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                })
              ],
            ),
          );
        },
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => cart_item.navigateTo()),
        ),
        child: productCart(),
      ),
    );
  }
}
