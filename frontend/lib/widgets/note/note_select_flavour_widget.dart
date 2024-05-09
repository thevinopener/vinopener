import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/models/note_model.dart';
import 'package:frontend/widgets/common/atoms/wine_flavour_widget.dart';

class NoteFlavour extends StatefulWidget {
  final List<int> flavourId;

  const NoteFlavour({Key? key, required this.flavourId}) : super(key: key);

  @override
  State<NoteFlavour> createState() => _NoteFlavourState();
}

class _NoteFlavourState extends State<NoteFlavour> {
  late List<int> selectedFlavourIds;
  Set<int> selectedFlavourIdsSet = {};
  String currentlyOpen = ""; // 현재 열린 섹션의 키를 저장

  final List<Flavour> blueFruits = [
    Flavour(taste: "블루베리", id: 98),
  ];

  final List<Flavour> tropicalFruits = [
    Flavour(taste: "구아바", id: 73),
    Flavour(taste: "리치", id: 74),
    Flavour(taste: "망고", id: 75),
    Flavour(taste: "바나나", id: 76),
    Flavour(taste: "키위", id: 77),
    Flavour(taste: "파인애플", id: 78),
    Flavour(taste: "풍선껌", id: 73),
  ];

  final List<Flavour> dryFruits = [
    Flavour(taste: "건포도", id: 58),
    Flavour(taste: "무화과", id: 59),
    Flavour(taste: "용과", id: 60),
  ];

  final List<Flavour> greenFruits = [
    Flavour(taste: "라임", id: 55),
    Flavour(taste: "매실", id: 56),
    Flavour(taste: "청배", id: 57),
  ];

  final List<Flavour> citrusFruits = [
    Flavour(taste: "귤", id: 68),
    Flavour(taste: "레몬", id: 69),
    Flavour(taste: "마멀레이드", id: 70),
    Flavour(taste: "오렌지", id: 71),
    Flavour(taste: "자몽", id: 72),
  ];

  final List<Flavour> stoneFruits = [
    Flavour(taste: "모과", id: 99),
    Flavour(taste: "복숭아", id: 100),
    Flavour(taste: "사과", id: 101),
    Flavour(taste: "살구", id: 102),
  ];

  final List<Flavour> redFruits = [
    Flavour(taste: "딸기", id: 61),
    Flavour(taste: "라즈베리", id: 62),
    Flavour(taste: "붉은자두", id: 63),
    Flavour(taste: "석류", id: 64),
    Flavour(taste: "체리", id: 65),
    Flavour(taste: "크렌베리", id: 66),
    Flavour(taste: "토마토", id: 67),
  ];

  final List<Flavour> blackFruits = [
    Flavour(taste: "블랙체리", id: 1),
    Flavour(taste: "오디", id: 2),
    Flavour(taste: "올리브", id: 3),
    Flavour(taste: "자두", id: 4),
  ];

  final List<Flavour> greenNotes = [
    Flavour(taste: "구스베리", id: 5),
    Flavour(taste: "민트", id: 6),
    Flavour(taste: "바질", id: 7),
    Flavour(taste: "세이지", id: 8),
    Flavour(taste: "아몬드", id: 9),
    Flavour(taste: "오레가노", id: 10),
    Flavour(taste: "유칼립투스", id: 11),
    Flavour(taste: "쳐빌", id: 12),
    Flavour(taste: "피망", id: 13),
    Flavour(taste: "할라피뇨", id: 14),
    Flavour(taste: "허브", id: 15),
    Flavour(taste: "홍차", id: 16),
  ];

  final List<Flavour> miscellaneous = [
    Flavour(taste: "구운빵", id: 17),
    Flavour(taste: "꿀", id: 18),
    Flavour(taste: "돌", id: 19),
    Flavour(taste: "마른낙엽", id: 20),
    Flavour(taste: "맥주", id: 21),
    Flavour(taste: "밀랍", id: 22),
    Flavour(taste: "반창고", id: 23),
    Flavour(taste: "버섯", id: 24),
    Flavour(taste: "버터", id: 25),
    Flavour(taste: "분필", id: 26),
    Flavour(taste: "생강", id: 27),
    Flavour(taste: "석연슬레이트", id: 28),
    Flavour(taste: "숲바닥", id: 29),
    Flavour(taste: "야생고기", id: 30),
    Flavour(taste: "연필심", id: 31),
    Flavour(taste: "염분", id: 32),
    Flavour(taste: "절인고기", id: 33),
    Flavour(taste: "점토", id: 34),
    Flavour(taste: "젖은상자", id: 35),
    Flavour(taste: "젖은자갈", id: 36),
    Flavour(taste: "젖은토양", id: 37),
    Flavour(taste: "치즈", id: 38),
    Flavour(taste: "크림", id: 39),
    Flavour(taste: "타르", id: 40),
    Flavour(taste: "화분흙", id: 41),
    Flavour(taste: "훈제육", id: 42),
  ];

  final List<Flavour> flowers = [
    Flavour(taste: "라벤더", id: 43),
    Flavour(taste: "백합", id: 44),
    Flavour(taste: "아카시아", id: 45),
    Flavour(taste: "오렌지꽃", id: 46),
    Flavour(taste: "인동덩굴", id: 47),
    Flavour(taste: "자스민", id: 48),
    Flavour(taste: "작약", id: 49),
    Flavour(taste: "장미", id: 50),
    Flavour(taste: "제라늄", id: 51),
    Flavour(taste: "제비꽃", id: 52),
    Flavour(taste: "포푸리", id: 53),
    Flavour(taste: "히비스커스", id: 54),
  ];

  final List<Flavour> oaks = [
    Flavour(taste: "가죽", id: 80),
    Flavour(taste: "견과류", id: 81),
    Flavour(taste: "담배", id: 82),
    Flavour(taste: "바닐라", id: 83),
    Flavour(taste: "백단", id: 84),
    Flavour(taste: "브리오슈", id: 85),
    Flavour(taste: "삼나무", id: 86),
    Flavour(taste: "시가박스", id: 87),
    Flavour(taste: "에스프레소", id: 88),
    Flavour(taste: "초콜릿", id: 89),
    Flavour(taste: "캐러멜", id: 90),
    Flavour(taste: "커피", id: 91),
    Flavour(taste: "코코넛", id: 92),
    Flavour(taste: "코코아", id: 93),
    Flavour(taste: "콜라", id: 94),
    Flavour(taste: "파이프담배", id: 95),
    Flavour(taste: "헤이즐넛", id: 96),
    Flavour(taste: "흑설탕", id: 97),
  ];

  final List<Flavour> spices = [
    Flavour(taste: "감초", id: 103),
    Flavour(taste: "계피", id: 104),
    Flavour(taste: "붉은고추", id: 105),
    Flavour(taste: "육두구", id: 106),
    Flavour(taste: "정향", id: 107),
    Flavour(taste: "팔각", id: 108),
    Flavour(taste: "후추", id: 109),
  ];

  @override
  void initState() {
    super.initState();
    selectedFlavourIds = List.from(widget.flavourId);
    selectedFlavourIdsSet = Set.from(selectedFlavourIds);
  }

  Widget buildFlavourGrid(List<Flavour> flavours, String sectionKey) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // 스크롤 비활성화
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
      ),
      itemCount: flavours.length,
      itemBuilder: (context, index) {
        final flavour = flavours[index];
        final isSelected = selectedFlavourIdsSet.contains(flavour.id);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedFlavourIdsSet.remove(flavour.id);
              } else {
                selectedFlavourIdsSet.add(flavour.id);
              }
              print(selectedFlavourIdsSet);
              currentlyOpen = sectionKey;
            });
          },
          child: WineFlavour(flavour: flavour, isSelected: isSelected),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Accordion(
      disableScrolling: true,
      maxOpenSections: 1,
      headerBackgroundColor: AppColors.white,
      headerBorderColor: Colors.grey,
      headerBorderWidth: 1,
      contentBorderColor: AppColors.white,
      headerBorderColorOpened: AppColors.white,
      rightIcon: const Icon(Icons.keyboard_arrow_down,
          color: Colors.black54, size: 25),
      headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      openAndCloseAnimation: false,
      children: [
        AccordionSection(
          isOpen: currentlyOpen == 'redFruits',
          header: Text('붉은 과일',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(redFruits, 'redFruits'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'blueFruits',
          header: Text('푸른 과일',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(blueFruits, 'blueFruits'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'blackFruits',
          header: Text('검은 과일',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(blackFruits, 'blackFruits'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'dryFruits',
          header: Text('말린 과일',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(dryFruits, 'dryFruits'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'greenFruits',
          header: Text('녹색 과일',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(greenFruits, 'greenFruits'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'citrusFruits',
          header: Text('시트러스',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(citrusFruits, 'citrusFruits'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'stoneFruits',
          header: Text('핵과류',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(stoneFruits, 'stoneFruits'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'tropicalFruits',
          header: Text('열대 과일',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(tropicalFruits, 'tropicalFruits'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'flowers',
          header: Text('꽃',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(flowers, 'flowers'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'greenNotes',
          header: Text('그린노트',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(greenNotes, 'greenNotes'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'spices',
          header: Text('향신료',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(spices, 'spices'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'miscellaneous',
          header: Text('기타',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(miscellaneous, 'miscellaneous'),
        ),
        AccordionSection(
          isOpen: currentlyOpen == 'oaks',
          header: Text('오크',
              style: TextStyle(
                  color: AppColors.black, fontSize: AppFontSizes.medium)),
          content: buildFlavourGrid(oaks, 'oaks'),
        ),
      ],
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child; // 오버스크롤 글로우 효과 없앰
  }
}
