import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/articles/view/articles_view.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/sources/widgets/sources_tab/source_widget.dart';

class SourcesTab extends StatefulWidget {
  SourcesTab({super.key, required this.sources});

  List<Source> sources;

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) {
              tappedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: widget.sources.map((source) {
              return SourceWidget(
                source: source,
                isSelected: widget.sources.indexOf(source) == tappedIndex,
              );
            }).toList(),
          ),
        ),
        ArticlesView(source: widget.sources[tappedIndex]),
      ],
    );
  }
}
