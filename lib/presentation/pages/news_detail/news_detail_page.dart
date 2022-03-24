import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({
    Key? key,
    required this.url,
  }) : super(key: key);

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
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Title here.................',
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bookmark,
              color: Colors.black,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.share,
              color: Colors.black,
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
              onWebViewCreated: (controller) {
                setState(() {
                  _controller = controller;
                });
              },
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
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black,
                  ),
                ),
              ),
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

  @override
  void dispose() {
    _controller?.clearCache();
    super.dispose();
  }
}
