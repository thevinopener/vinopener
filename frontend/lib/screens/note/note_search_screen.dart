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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
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
              Provider.of<NoteWineProvider>(context, listen: false).setWine(_selectedWine!);
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
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('검색어를 입력해주세요!')));
                  } else {
                    _searchWines(value);
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
                        _searchWines(_searchController.text);
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
                  : ListView.builder(
                      itemCount: _wineList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _toggleWine(_wineList[index]);
                          },
                          child: Container(
                            child: FeedWineItem(
                              wine: _wineList[index],
                              isSelected: _wineList[index].id == _selectedWineId,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
