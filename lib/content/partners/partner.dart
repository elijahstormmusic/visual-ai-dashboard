import 'dart:convert';

import 'sale.dart';
import 'contact.dart';
import 'display.dart';
import 'cache.dart';

import 'package:visual_ai/constants.dart';


class Partner {
  final String name;
  final String cryptlink;
  final String shortDescription;
  final String address;
  final List<String> images;
  final ContactList contact;
  final int priceRange;
  final String shopSaleType;
  final String shopGroupSize;
  final String shopSize;
  final double rating;
  List<Sale> sales = <Sale>[];
  bool isFavorite;

  String priceRangeToString() {
    const priceText = '\$';
    String str = priceText;
    for (int i=0;i<priceRange;i++) {
      str += priceText;
    }
    return str;
  }

  dynamic toJson() {
    return {
      'name': name,
      'cryptlink': cryptlink,
      'info': shortDescription,
      'address': address,
      'images': images,
      'contact': contact.toJson(),
      'priceRange': priceRange,
      'rating': rating,
      'shopSaleType': shopSaleType,
      'shopGroupSize': shopGroupSize,
      'shopSize': shopSize,
    };
  }
  bool isOpen() {
    return true;
  }

  Partner({
    required this.name,
    required this.cryptlink,
    required this.shortDescription,
    required this.address,
    required this.images,
    required this.contact,
    required this.priceRange,
    required this.rating,
    required this.sales,
    required this.shopSaleType,
    required this.shopGroupSize,
    required this.shopSize,
    this.isFavorite = false,
  });

  static Partner json(var data) {
    return Partner(
      name: data['name'],
      cryptlink: data['cryptlink'],
      shortDescription: data['info'],
      address: data['address'],
      images: data['images'],
      contact: ContactList.json(data['contact']),
      priceRange: data['priceRange'],
      rating: data['rating'],
      shopSaleType: data['shopSaleType'],
      shopGroupSize: data['shopGroupSize'],
      shopSize: data['shopSize'],
      sales: <Sale>[],
    );
  }
  static Partner link(String input) {
    for (var i=0;i<PartnerCache.all.length;i++) {
      if (PartnerCache.all[i].cryptlink==input) {
        return PartnerCache.all[i];
      }
    }

    Partner P = Partner(
      cryptlink: input,
      name: 'none',
      shortDescription: 'description',
      address: '1234 Address St.',
      images: <String>[Constants.loading_placeholder, Constants.loading_placeholder],
      contact: ContactList(),
      sales: <Sale>[],
      priceRange: 2,
      rating: 5.0,
      shopSaleType: '-',
      shopGroupSize: '-',
      shopSize: '-',
    );

    // socket.emit('partners link', {
    //   'link': input,
    // });

    PartnerCache.add(P);

    return P;
  }

  PartnerDisplayPage navigateTo() {
    return PartnerDisplayPage(cryptlink);
  }
}
