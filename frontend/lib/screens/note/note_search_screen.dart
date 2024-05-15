// flutter
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/providers/note/note_wine_provider.dart';
import 'package:frontend/screens/note/note_screen.dart';
import 'package:frontend/services/wine_service.dart';
import 'package:frontend/widgets/feed/feed_wine_item.dart';

// constants
import 'package:frontend/constants/fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class NoteSearchScreen extends StatefulWidget {
  _NoteSearchScreenState createState() => _NoteSearchScreenState();
}

class _NoteSearchScreenState extends State<NoteSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<Wine> _wineList = [];
  bool _isLoading = false;
  Wine? _selectedWine;
  int? _selectedWineId;

  static const _pageSize = 10;
  final PagingController<int, Wine> _pagingController =
  PagingController(firstPageKey: 0);

  // _searchWines(String keyword) async {
  //   if (keyword.isEmpty) return;
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     WineService.pageSearchWineList(keyword, 0);
  //     // List<Wine> wineList = await WineService.searchWineList(keyword);
  //     List<Wine> wineList = [];
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

  void _toggleWine(Wine wine) {
    setState(() {
      if (_selectedWineId == wine.id) {
        _selectedWineId = null;
        _selectedWine = null;
      } else {
        _selectedWineId = wine.id;
        _selectedWine = wine;
      }
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
      await WineService.pageSearchWineList(_searchController.text, pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
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
          '노트 와인 검색',
          style: TextStyle(
            fontSize: AppFontSizes.mediumSmall,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              if (_selectedWine == null) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('와인을 선택해주세요!')));
                return;
              }
              Provider.of<NoteWineProvider>(context, listen: false)
                  .setWine(_selectedWine!);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteScreen(),
                ),
              );
            },
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: _searchFocusNode,
                onSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                  if (value == '') {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('검색어를 입력해주세요!')));
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
                              isSelected: item.id == _selectedWineId,
                            ),
                          ),
                        ),
                    noItemsFoundIndicatorBuilder: (context) =>
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
                    newPageErrorIndicatorBuilder: (context) =>
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
    );
  }
}
