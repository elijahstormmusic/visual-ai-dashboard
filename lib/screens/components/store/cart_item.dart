import 'package:flutter/material.dart';

import 'package:visual_ai/constants.dart';

import 'package:visual_ai/content/store/content.dart';


class CartItem extends StatefulWidget {
  final StoreContent cart_item;

  CartItem(
    this.cart_item, {
    Key? key,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> with TickerProviderStateMixin {

  int _selectedColor = 0;
  int _selectedSize = 0;
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.white,
  ];
  List<String> _sizeOptions = [
    '22', '37', '45',
  ];
  RangeValues _selectedRange = RangeValues(0, 2000);

  Widget button(String text, VoidCallback fnc) {
    return ElevatedButton(
      onPressed: fnc,
      child: Text(text),
    );
  }

  Widget productCart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(defaultCardRadius),
                      child: widget.cart_item.icon,
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(.3),
                          Colors.black.withOpacity(.0),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Text(
                    'PROMOTION',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),

                // Positioned(
                //   right: 10,
                //   bottom: 10,
                //   child: GestureDetector(
                //     onTap: () {
                //       addToCartModal(context);
                //     },
                //     child: Container(
                //       decoration: BoxDecoration(
                //         color: Theme.of(context).primaryColor,
                //         borderRadius: BorderRadius.circular(50),
                //         boxShadow: [BoxShadow(
                //           offset: Offset(3, 8),
                //           blurRadius: 7,
                //           color: Theme.of(context).cardColor,
                //         )],
                //       ),
                //       padding: EdgeInsets.all(5),
                //       child: Center(
                //         child: Icon(
                //           Icons.shopping_cart,
                //           color: Theme.of(context).scaffoldBackgroundColor,
                //           size: 20,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        SizedBox(height: defaultPadding / 2),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding / 3 * 2,
          ),
          child: Text(
            widget.cart_item.title,
            maxLines: 1,
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(height: defaultPadding / 2),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    left: defaultPadding / 3 * 2,
                    bottom: defaultPadding / 2,
                  ),
                  child: Text(
                    widget.cart_item.price_str,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    addToCartModal(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: defaultPadding / 2,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.shopping_cart,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget forYou() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: widget.cart_item.icon,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.cart_item.title,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                widget.cart_item.released_str,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.cart_item.price_str,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ]
          ),
        )
      ],
    );
  }

  void showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
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
                      Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        minWidth: 40,
                        height: 40,
                        color: Theme.of(context).cardColor,
                        elevation: 0,
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(Icons.close),
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
                      itemCount: _colors.length,
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
                              color: _selectedColor == index ? _colors[index] : _colors[index].withOpacity(0.5),
                              shape: BoxShape.circle
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: _selectedColor == index
                                ? Icon(
                                  Icons.check,
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                )
                                : Container(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Size', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _sizeOptions.length,
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
                              color: _selectedSize == index
                                ? Theme.of(context).accentColor
                                : Theme.of(context).cardColor,
                              shape: BoxShape.circle
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Text(
                                _sizeOptions[index],
                                style: TextStyle(
                                  color: _selectedSize == index
                                    ? Theme.of(context).scaffoldBackgroundColor
                                    : null,
                                  fontSize: 15,
                                ),
                              ),
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
                      Text(
                        'Price Range',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('\$ ${_selectedRange.start.toStringAsFixed(2)}', style: TextStyle(color: Theme.of(context).cardColor, fontSize: 12)),
                          Text(' - ', style: TextStyle(color: Theme.of(context).cardColor)),
                          Text('\$ ${_selectedRange.end.toStringAsFixed(2)}', style: TextStyle(color: Theme.of(context).cardColor, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  RangeSlider(
                    values: _selectedRange,
                    min: 0.00,
                    max: 2000.00,
                    divisions: 100,
                    inactiveColor: Theme.of(context).cardColor,
                    activeColor: Theme.of(context).accentColor,
                    labels: RangeLabels('\$ ${_selectedRange.start.toStringAsFixed(2)}', '\$ ${_selectedRange.end.toStringAsFixed(2)}'),
                    onChanged: (RangeValues values) {
                      setState(() => _selectedRange = values);
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

  void addToCartModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      transitionAnimationController: AnimationController(duration: Duration(milliseconds: 400), vsync: this),
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Color', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: defaultPadding),
                Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _colors.length,
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
                            color: _selectedColor == index ? _colors[index] : _colors[index].withOpacity(0.5),
                            shape: BoxShape.circle
                          ),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: _selectedColor == index
                              ? Icon(
                                Icons.check,
                                color: Theme.of(context).scaffoldBackgroundColor,
                              )
                              : Container(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: defaultPadding * 2),
                Text('Size', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: defaultPadding),
                Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _sizeOptions.length,
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
                            color: _selectedSize == index
                              ? Theme.of(context).accentColor
                              : Theme.of(context).cardColor,
                            shape: BoxShape.circle
                          ),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Text(
                              _sizeOptions[index],
                              style: TextStyle(
                                color: _selectedSize == index
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : null,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: defaultPadding * 2),
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
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget.cart_item.navigateTo()),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(defaultCardRadius),
          boxShadow: [BoxShadow(
            offset: Offset(defaultPadding / 5, defaultPadding / 4),
            blurRadius: defaultPadding / 3,
            color: (
              Theme.of(context).iconTheme.color ?? Theme.of(context).accentColor
            ).withOpacity(.7),
          )],
        ),
        margin: EdgeInsets.all(defaultPadding / 2),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(defaultCardRadius)),
          child: productCart(),
        ),
      ),
    );
  }
}
