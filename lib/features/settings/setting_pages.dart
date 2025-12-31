import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme/ui_utils.dart';

class SettingsPage extends StatelessWidget {
  final String title;
  final String htmlContent;

  const SettingsPage({
    super.key,
    required this.title,
    required this.htmlContent,
  });

  static Route route(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;

    return MaterialPageRoute(
      builder: (_) => SettingsPage(
        title: args['title'] as String,
        htmlContent: args['html'] as String,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: UiUtils.buildAppBar(
        context,
        title: title,
        showBackButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: HtmlWidget(
            htmlContent,
            onTapUrl: (url) =>
                launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
            customStylesBuilder: (element) {
              if (element.localName == 'table') {
                return {'background-color': '#f5f5f5'};
              }

              if (element.localName == 'p') {
                return {'color': '#333333'};
              }

              if (element.localName == 'strong') {
                return {
                  'color': Theme.of(context).colorScheme.secondary.toString(),
                  'font-size': '16px',
                };
              }

              if (element.localName == 'th') {
                return {
                  'background-color': '#eeeeee',
                  'border-bottom': '1px solid #cccccc',
                };
              }

              if (element.localName == 'td') {
                return {'border': '0.5px solid #cccccc'};
              }

              return null;
            },
          ),
        ),
      ),
    );
  }
}
