import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/providers/feed/feed_tab_state_provider.dart';
import 'package:frontend/providers/feed/new_feed_wine_list_provider.dart';
import 'package:frontend/services/wine_service.dart';
import 'package:frontend/widgets/feed/feed_wine_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class FeedWineSearchScreen extends StatefulWidget {
  const FeedWineSearchScreen({super.key});

  @override
  State<FeedWineSearchScreen> createState() => _FeedWineSearchScreenState();
}

class _FeedWineSearchScreenState extends State<FeedWineSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<Wine> _wineList = [];
  Set<Wine> _selectedWineSet = Set();
  bool _isLoading = false;

  static const _pageSize = 10;
  final PagingController<int, Wine> _pagingController =
      PagingController(firstPageKey: 0);

  // _searchWines(String keyword) async {
  //   if (keyword.isEmpty) return;
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     List<Wine> wineList = await WineService.searchWineList(keyword);
  //     setState(() {
  //       _wineList = wineList;
  //       _isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     print('Failed to fetch wines: $e');
  //   }
  // }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await WineService.pageSearchWineList(_searchController.text, pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  void _toggleWine(Wine wine) {
    setState(() {
      if (_selectedWineSet.contains(wine)) {
        _selectedWineSet.remove(wine);
        wine.isSelected = false;
      } else {
        _selectedWineSet.add(wine);
        wine.isSelected = true;
      }
    });
  }

  void selectWines(BuildContext context) {
    final newFeedWineListProvider =
        Provider.of<NewFeedWineListProvider>(context, listen: false);
    newFeedWineListProvider.setWineList(_selectedWineSet.toList());
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
    setState(() {
      Provider.of<FeedTabState>(context, listen: false).setFeedList();
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.purple.withOpacity(0.05),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.purple.withOpacity(0.05),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  focusNode: _searchFocusNode,
                  onSubmitted: (value) {
                    FocusScope.of(context).unfocus();
                    if (value == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('검색어를 입력해주세요!')));
                    } else {
                      // _searchWines(value);
                      _pagingController.refresh();
                    }
                  },
                  controller: _searchController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_searchController.text == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('검색어를 입력해주세요!')));
                        } else {
                          // _searchWines(_searchController.text);
                          _pagingController.refresh();
                        }
                      },
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
                    // : ListView.builder(
                    //     itemCount: _wineList.length,
                    //     itemBuilder: (context, index) {
                    //       return GestureDetector(
                    //           onTap: () => _toggleWine(_wineList[index]),
                    //           child: Container(
                    //               child: FeedWineItem(
                    //                   wine: _wineList[index],
                    //                   isSelected:
                    //                       _wineList[index].isSelected)));
                    //     },
                    //   ),
                    : PagedListView<int, Wine>(
                        pagingController: _pagingController,
                        builderDelegate: PagedChildBuilderDelegate<Wine>(
                          itemBuilder: (context, item, index) =>
                              GestureDetector(
                            onTap: () {
                              _toggleWine(item);
                            },
                            child: Container(
                              child: FeedWineItem(
                                wine: item,
                                isSelected: item.isSelected,
                              ),
                            ),
                          ),
                          noItemsFoundIndicatorBuilder: (context) =>
                              //TODO: 검색을 하지 않아서 현재 검색 결과가 비어 있는 경우
                              Center(
                            child: Text(
                              '🔍\n검색된 와인이 없습니다!\n다른 키워드로 검색해볼까요?\n✏',
                              style: TextStyle(
                                fontSize: AppFontSizes.mediumLarge,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          firstPageErrorIndicatorBuilder: (context) =>
                              //TODO: 검색어가 괴상해서 검색 결과가 안 나오는 경우
                              Text(
                            '\n검색 결과가 없습니다.\n다른 검색어로 새로운 와인을 찾아보세요!',
                            style: TextStyle(
                              fontSize: AppFontSizes.mediumSmall,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          newPageErrorIndicatorBuilder: (context) =>
                              //TODO: 검색 결과가 있지만 끝을 봐서 아래에 알려줄 문구
                              Text(
                            '\n🔍 더 이상 표시할 와인이 없습니다!\n다른 검색어로 새로운 와인을 찾아보세요! 🧭',
                            style: TextStyle(
                              fontSize: AppFontSizes.mediumSmall,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
