import 'package:visual_ai/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final String type;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.type = '',
  });
}

List demoDashboardFiles = [
  CloudStorageInfo(
    title: 'Documents',
    numOfFiles: 1328,
    totalStorage: '1.9GB',
    percentage: 35,
    type: 'document',
  ),
  CloudStorageInfo(
    title: 'Google Drive',
    numOfFiles: 1328,
    totalStorage: '2.9GB',
    percentage: 35,
    type: 'google',
  ),
  CloudStorageInfo(
    title: 'One Drive',
    numOfFiles: 1328,
    totalStorage: '1GB',
    percentage: 10,
    type: 'one drive',
  ),
  CloudStorageInfo(
    title: 'Documents',
    numOfFiles: 5328,
    totalStorage: '7.3GB',
    percentage: 78,
    type: 'dropbox',
  ),
];
