import 'dart:convert';
import 'package:flutter/material.dart';

import 'partner.dart';


class ContactList {
  String? phoneNumber;
  String? email;
  String? facebook;
  String? twitter;
  String? instagram;
  String? pinterest;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? website;

  String toString() {
    String str = '';

    if (phoneNumber != null) {
      str += 'phoneNumber:' + phoneNumber! + ',';
    }
    if (address != null) {
      str += 'address:' + address! + ',';
    }
    if (city != null) {
      str += 'city:' + city! + ',';
    }
    if (state != null) {
      str += 'state:' + state! + ',';
    }
    if (zip != null) {
      str += 'zip:' + zip! + ',';
    }
    if (website != null) {
      str += 'website:' + website! + ',';
    }
    if (email != null) {
      str += 'email:' + email! + ',';
    }
    if (facebook != null) {
      str += 'facebook:' + facebook! + ',';
    }
    if (twitter != null) {
      str += 'twitter:' + twitter! + ',';
    }
    if (instagram != null) {
      str += 'instagram:' + instagram! + ',';
    }
    if (pinterest != null) {
      str += 'pinterest:' + pinterest! + ',';
    }

    if (str.substring(str.length-1, str.length)==',') {
      str = str.substring(0, str.length-1);
    }

    return str;
  }
  dynamic toJson() {
    dynamic json_data = {};

    if (phoneNumber != null) {
      json_data['phoneNumber:'] = phoneNumber!;
    }
    if (address != null) {
      json_data['address:'] = address!;
    }
    if (city != null) {
      json_data['city:'] = city!;
    }
    if (state != null) {
      json_data['state:'] = state!;
    }
    if (zip != null) {
      json_data['zip:'] = zip!;
    }
    if (website != null) {
      json_data['website:'] = website!;
    }
    if (email != null) {
      json_data['email:'] = email!;
    }
    if (facebook != null) {
      json_data['facebook:'] = facebook!;
    }
    if (twitter != null) {
      json_data['twitter:'] = twitter!;
    }
    if (instagram != null) {
      json_data['instagram:'] = instagram!;
    }
    if (pinterest != null) {
      json_data['pinterest:'] = pinterest!;
    }

    return json_data;
  }
  ContactList({
    this.phoneNumber,
    this.email,
    this.facebook,
    this.twitter,
    this.instagram,
    this.pinterest,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.website,
  });

  static ContactList json(var data) {
    if (data==null) return ContactList();

    return ContactList(
      phoneNumber: data['phoneNumber'],
      address: data['address'],
      city: data['city'],
      state: data['state'],
      zip: data['zip'],
      website: data['website'],
      email: data['email'],
      facebook: data['facebook'],
      twitter: data['twitter'],
      instagram: data['instagram'],
      pinterest: data['pinterest'],
    );
  }
  static ContactList parse(String input) {
    ContactList contactData = ContactList();
    List<String> curData;
    List<String> list = input.split(',');
    
    for (var i=0;i<list.length;i++) {
      curData = list[i].split(':');

      if (curData[0]=='phoneNumber') {
        contactData.phoneNumber = curData[1];
      }
      else if (curData[0]=='address') {
        contactData.address = curData[1];
      }
      else if (curData[0]=='city') {
        contactData.city = curData[1];
      }
      else if (curData[0]=='state') {
        contactData.state = curData[1];
      }
      else if (curData[0]=='zip') {
        contactData.zip = curData[1];
      }
      else if (curData[0]=='website') {
        contactData.website = curData[1];
      }
      else if (curData[0]=='email') {
        contactData.email = curData[1];
      }
      else if (curData[0]=='facebook') {
        contactData.facebook = curData[1];
      }
      else if (curData[0]=='twitter') {
        contactData.twitter = curData[1];
      }
      else if (curData[0]=='instagram') {
        contactData.instagram = curData[1];
      }
      else if (curData[0]=='pinterest') {
        contactData.pinterest = curData[1];
      }
    }

    return contactData;
  }
}
