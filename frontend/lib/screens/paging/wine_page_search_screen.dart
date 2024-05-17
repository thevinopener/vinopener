import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/wine_model.dart';
import 'package:frontend/screens/search/search_detail_screen.dart';
import 'package:frontend/screens/search/search_second_camera_screen.dart';
import 'package:frontend/services/wine_service.dart';
import 'package:frontend/widgets/feed/feed_wine_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class WinePageSearchScreen extends StatefulWidget {
  String? keyword;
  int? totalElements;

  WinePageSearchScreen({Key? key, this.keyword = ''}) : super(key: key);

  @override
  State<WinePageSearchScreen> createState() => _WinePageSearchScreenState();
}

class _WinePageSearchScreenState extends State<WinePageSearchScreen> {
  bool isFirstSearch = true;

  late List<CameraDescription> cameras;
  late CameraDescription firstCamera;
  bool _isCameraInitialized = false;

  TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  static const _pageSize = 10;
  PagingController<int, Wine> _pagingController =
      PagingController(firstPageKey: 0);

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

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = isFirstSearch
          ? await WineService.pageSearchWineList(widget.keyword!, pageKey)
          : await WineService.pageSearchWineList(
              _searchController.text, pageKey);
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

  Future<void> setCount(String keyword) async {
    widget.totalElements = await WineService.countPageSearchWineList(keyword);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initCameras();
    _searchController = TextEditingController(text: widget.keyword);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.canRequestFocus = false;
      FocusScope.of(context).requestFocus(_searchFocusNode);
      setCount(widget.keyword!);
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
      // 여기가 전체 배경임
      body: Container(
        color: Colors.purple.withOpacity(0.04),
        // 전체 뒷배경색
        padding: EdgeInsets.all(10),
        // 상하좌우 여백
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        // 전체 배경(화면의 모든 요소를 감싸고 있음)에 세로로 요소를 쌓을 것임.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 행 정렬
          crossAxisAlignment: CrossAxisAlignment.center, // 열 정렬
          children: [
            // 검색바 시작
            Flexible(
              flex: 1,
              child: Container(
                height: 60,
                alignment: Alignment.center,
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                  onSubmitted: (value) async {
                    FocusScope.of(context).unfocus();
                    if (value == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('검색어를 입력해주세요!')));
                      return;
                    } else {
                      isFirstSearch = false;
                      setCount(_searchController.text);
                      _pagingController.refresh();
                    }
                  },
                  controller: _searchController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffix: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                              icon: Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Icon(Icons.camera_alt_outlined),
                              ),
                              onPressed: _isCameraInitialized
                                  ? () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SearchSecondCameraScreen(
                                                  camera: firstCamera),
                                        ),
                                      );
                                    }
                                  : null),
                          IconButton(
                            icon: Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Icon(Icons.clear),
                            ),
                            // 두 번째 아이콘 예시로 'clear' 아이콘을 추가
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                                FocusScope.of(context)
                                    .requestFocus(_searchFocusNode);
                              }); // 텍스트 필드 내용 지우기
                            },
                          ),
                        ],
                      ),
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
            ),
            // 검색바 끝

            // Text('총 ${list.length}개의 검색결과') 시작
            Flexible(
              flex: 1,
              child: Container(
                child: Text(
                    '총 ${widget.totalElements}개의 검색결과'), // TODO: 리스트 길이 바인딩 할 곳
              ),
            ),
            // Text('총 ${list.length}개의 검색결과') 끝

            // 검색결과 리스트 뿌리기 시작
            Flexible(
              flex: 8,
              child: Container(
                child: PagedListView<int, Wine>(
                  physics: BouncingScrollPhysics(),
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Wine>(
                    itemBuilder: (context, item, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) =>
                                SearchDetailScreen(wineId: item.id!),
                          ),
                        );
                      },
                      child: Container(
                        child: FeedWineItem(
                          wine: item,
                          isSelected: false,
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
            ),
            // 검색결과 리스트 뿌리기 끝
          ],
        ),
      ),
    );
  }
}
