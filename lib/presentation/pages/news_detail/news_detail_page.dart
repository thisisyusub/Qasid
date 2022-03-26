import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/loading.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  bool _isLoading = false;
  bool _isFailure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        //backgroundColor: appTheme.colors.primaryColor,
        iconTheme: IconThemeData(
            // color: appTheme.colors.secondaryColor,
            ),
        title: Text(
          widget.title,
          // style: appTheme.typography.heading.copyWith(
          //   color: appTheme.colors.secondaryColor,
          // ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Share.share(
                widget.url,
                subject: 'Qasid',
              );
            },
            icon: Icon(
              CupertinoIcons.share,
              // color: appTheme.colors.secondaryColor,
              size: 20,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (_) {
                setState(() {
                  _isLoading = true;
                });
              },
              onPageFinished: (_) {
                setState(() {
                  _isLoading = false;
                });
              },
              onWebResourceError: (error) {
                setState(() {
                  _isLoading = false;
                  _isFailure = true;
                });
              },
            ),
            if (_isLoading) const Loading(),
            if (_isFailure)
              const Center(
                child: Icon(
                  Icons.error,
                  color: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
