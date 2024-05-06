import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/services/wine_service.dart';
import 'package:frontend/widgets/wine/wine_item_widget.dart';

class FeedWineSearchScreen extends StatefulWidget {
  const FeedWineSearchScreen({super.key});

  @override
  State<FeedWineSearchScreen> createState() => _FeedWineSearchScreenState();
}

class _FeedWineSearchScreenState extends State<FeedWineSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Wine> _wineList = [];
  bool _isLoading = false;

  _searchWines(String keyword) async {
    if (keyword.isEmpty) return;
    setState(() {
      _isLoading = true;
    });
    try {
      List<Wine> wineList = await WineService.searchWineList(keyword);
      setState(() {
        _wineList = wineList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Failed to fetch wines: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.navigate_before),
        ),
        title: Text(
          '피드 와인 검색',
          style: TextStyle(
            fontSize: AppFontSizes.mediumSmall,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => selectWines(context),
            child: Text(
              '완료',
              style: TextStyle(
                fontSize: AppFontSizes.mediumSmall,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _searchWines(_searchController.text);
                    }
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _wineList.length,
              itemBuilder: (context, index) {
                return WineItem(wine: _wineList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

void selectWines(BuildContext context) {
  print('selectWines');
  Navigator.of(context).pop();
}
