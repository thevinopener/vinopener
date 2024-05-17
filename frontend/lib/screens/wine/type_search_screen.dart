// flutter
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/screens/search/search_detail_screen.dart';
import 'package:frontend/services/wine_service.dart';
import 'package:frontend/widgets/feed/feed_wine_item.dart';

// constants
import 'package:frontend/constants/fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../search/search_second_camera_screen.dart';

class TypeSearchScreen extends StatefulWidget {
  String? type;

  TypeSearchScreen({Key? key, this.type = ''}) : super(key: key);

  _TypeSearchScreenState createState() => _TypeSearchScreenState();
}

class _TypeSearchScreenState extends State<TypeSearchScreen> {

  bool isFirstSearch = true;

  late List<CameraDescription> cameras;
  late CameraDescription firstCamera;
  bool _isCameraInitialized = false;

  TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isLoading = false;
  int? _selectedWineId;

  static const _pageSize = 10;
  PagingController<int, Wine> _pagingController =
  PagingController(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = isFirstSearch ? await WineService.pageSearchTypeWineList(widget.type!, pageKey) :
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

  Future<void> _initCameras() async {
    try {
      cameras = await availableCameras();
      firstCamera = cameras.first;
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      print('카메라를 초기화하는 중 에러 발생: $e');
      // 에러 처리 로직 추가
    }
  }

  @override
  void initState() {
    super.initState();
    _initCameras();
    _searchController = TextEditingController(text: widget.type);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.canRequestFocus = false;
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Container(
              height: 60,
              alignment: Alignment.center,
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlignVertical: TextAlignVertical.center,
                focusNode: _searchFocusNode,
                onSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                  if (value == '') {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('검색어를 입력해주세요!')));
                  } else {
                    isFirstSearch = false;
                    _pagingController.refresh();
                  }
                },
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,

                  suffix: Row(
                    mainAxisSize: MainAxisSize.min, // Row가 차지하는 공간을 최소로 하여 아이콘들이 압축되지 않게 함
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.camera_alt_outlined),
                          onPressed: _isCameraInitialized
                              ? () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    SearchSecondCameraScreen(camera: firstCamera),
                              ),
                            );
                          }
                              : null
                      ),
                      IconButton(
                        icon: Icon(Icons.clear), // 두 번째 아이콘 예시로 'clear' 아이콘을 추가
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            FocusScope.of(context).requestFocus(_searchFocusNode);
                          });// 텍스트 필드 내용 지우기
                        },
                      ),
                    ],
                  ),
                  prefixIcon: IconButton(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
                  itemBuilder: (listContext, item, index) =>
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchDetailScreen(
                                wineId: item.id!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          child: FeedWineItem(
                            wine: item,
                            isSelected: item.id == _selectedWineId,
                          ),
                        ),
                      ),
                  noItemsFoundIndicatorBuilder: (listContext) =>
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
                  firstPageErrorIndicatorBuilder: (listContext) =>
                  //TODO: 검색어가 괴상해서 검색 결과가 안 나오는 경우
                  Text(
                    '\n검색 결과가 없습니다.\n다른 검색어로 새로운 와인을 찾아보세요!',
                    style: TextStyle(
                      fontSize: AppFontSizes.mediumSmall,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  newPageErrorIndicatorBuilder: (listContext) =>
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
    );
  }
}
