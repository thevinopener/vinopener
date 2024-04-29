import 'package:flutter/material.dart';

class WineAroma{
  static const Map<String, String> redFruits = {
    "딸기": 'assets/images/aroma/붉은과일_딸기',
    "라즈베리": 'assets/images/aroma/붉은과일_라즈베리',
    "붉은자두": 'assets/images/aroma/붉은과일_붉은자두',
    "석류": 'assets/images/aroma/붉은과일_석류',
    "체리": 'assets/images/aroma/붉은과일_체리',
    "크랜베리": 'assets/images/aroma/붉은과일_크랜베리',
    "토마토": 'assets/images/aroma/붉은과일_토마토',
  };

  static const Map<String, String> blueFruits = {
    "블루베리": 'assets/images/aroma/푸른과일_블루베리',
  };

  static const Map<String, String> blackFruits = {
    "블랙체리": 'assets/images/aroma/검은과일_블랙체리',
    "오디": 'assets/images/aroma/검은과일_오디',
    "올리브": 'assets/images/aroma/검은과일_올리브',
    "자두": 'assets/images/aroma/검은과일_자두',
  };

  static const Map<String, String> dryFruits = {
    "건포도": 'assets/images/aroma/말린과일_건포도',
    "무화과": 'assets/images/aroma/말린과일_무화과',
    "용과": 'assets/images/aroma/말린과일_용과',
  };

  static const Map<String, String> greenFruits = {
    "라임": 'assets/images/aroma/녹색과일_라임',
    "매실": 'assets/images/aroma/녹색과일_매실',
    "청배": 'assets/images/aroma/녹색과일_청배',
  };

  static const Map<String, String> citrus = {
    "귤": 'assets/images/aroma/시트러스_귤',
    "레몬": 'assets/images/aroma/시트러스_레몬',
    "마멀레이드": 'assets/images/aroma/시트러스_마멀레이드',
    "오렌지": 'assets/images/aroma/시트러스_오렌지',
    "자몽": 'assets/images/aroma/시트러스_자몽',
  };

  static const Map<String, String> stoneFruits = {
    "모과": 'assets/images/aroma/핵과류_모과',
    "복숭아": 'assets/images/aroma/핵과류_복숭아',
    "사과": 'assets/images/aroma/핵과류_사과',
    "살구": 'assets/images/aroma/핵과류_살구',
  };

  static const Map<String, String> tropicalFruits = {
    "구아바": 'assets/images/aroma/열대과일_구아바',
    "리치": 'assets/images/aroma/열대과일_리치',
    "망고": 'assets/images/aroma/열대과일_망고',
    "바나나": 'assets/images/aroma/열대과일_바나나',
    "키위": 'assets/images/aroma/열대과일_키위',
    "파인애플": 'assets/images/aroma/열대과일_파인애플',
    "풍선껌": 'assets/images/aroma/열대과일_풍선껌',
  };

  static const Map<String, String> Flower = {
    "라벤더": 'assets/images/aroma/꽃_라벤더',
    "백합": 'assets/images/aroma/꽃_백합',
    "아카시아": 'assets/images/aroma/꽃_아카시아',
    "오렌지꽃": 'assets/images/aroma/꽃_오렌지꽃',
    "인동덩굴": 'assets/images/aroma/꽃_인동덩굴',
    "자스민": 'assets/images/aroma/꽃_자스민',
    "작약": 'assets/images/aroma/꽃_작약',
    "장미": 'assets/images/aroma/꽃_장미',
    "제라늄": 'assets/images/aroma/꽃_제라늄',
    "제비꽃": 'assets/images/aroma/꽃_제비꽃',
    "포푸리": 'assets/images/aroma/꽃_포푸리',
    "히비스커스": 'assets/images/aroma/꽃_히비스커스',
  };

  static const Map<String, String> greenNote = {
    "구스베리": 'assets/images/aroma/그린노트_구스베리',
    "민트": 'assets/images/aroma/그린노트_민트',
    "바질": 'assets/images/aroma/그린노트_바질',
    "세이지": 'assets/images/aroma/그린노트_세이지',
    "아몬드": 'assets/images/aroma/그린노트_아몬드',
    "오레가노": 'assets/images/aroma/그린노트_오레가노',
    "유칼립투스": 'assets/images/aroma/그린노트_유칼립투스',
    "쳐빌": 'assets/images/aroma/그린노트_쳐빌',
    "피망": 'assets/images/aroma/그린노트_피망',
    "할라피뇨": 'assets/images/aroma/그린노트_할라피뇨',
    "허브": 'assets/images/aroma/그린노트_허브',
    "홍차": 'assets/images/aroma/그린노트_홍차',
  };

  static const Map<String, String> spice = {
    "감초": 'assets/images/aroma/향신료_감초',
    "계피": 'assets/images/aroma/향신료_계피',
    "붉은고추": 'assets/images/aroma/향신료_붉은고추',
    "육두구": 'assets/images/aroma/향신료_육두구',
    "정향": 'assets/images/aroma/향신료_정향',
    "팔각": 'assets/images/aroma/향신료_팔각',
    "후추": 'assets/images/aroma/향신료_후추',
  };

  static const Map<String, String> etc = {
    "구운빵": 'assets/images/aroma/기타_구운빵',
    "꿀": 'assets/images/aroma/기타_꿀',
    "돌": 'assets/images/aroma/기타_돌',
    "마굿간": 'assets/images/aroma/기타_마굿간',
    "마른낙엽": 'assets/images/aroma/기타_마른낙엽',
    "맥주": 'assets/images/aroma/기타_맥주',
    "밀랍": 'assets/images/aroma/기타_밀랍',
    "반찬고": 'assets/images/aroma/기타_반찬고',
    "버섯": 'assets/images/aroma/기타_버섯',
    "버터": 'assets/images/aroma/기타_버터',
    "분필": 'assets/images/aroma/기타_분필',
    "생강": 'assets/images/aroma/기타_생강',
    "석연슬레이트": 'assets/images/aroma/기타_석연슬레이트',
    "숲바닥": 'assets/images/aroma/기타_숲바닥',
    "야생고기": 'assets/images/aroma/기타_야생고기',
    "연필심": 'assets/images/aroma/기타_연필심',
    "염분": 'assets/images/aroma/기타_염분',
    "유황": 'assets/images/aroma/기타_유황',
    "절인고기": 'assets/images/aroma/기타_절인고기',
    "점토": 'assets/images/aroma/기타_점토',
    "젖은낙엽": 'assets/images/aroma/기타_젖은낙엽',
    "젖은상자": 'assets/images/aroma/기타_젖은상자',
    "젖은자갈": 'assets/images/aroma/기타_젖은자갈',
    "젖은토양": 'assets/images/aroma/기타_젖은토양',
    "지하실": 'assets/images/aroma/기타_지하실',
    "치즈": 'assets/images/aroma/기타_치즈',
    "크림": 'assets/images/aroma/기타_크림',
    "타르": 'assets/images/aroma/기타_타르',
    "화분흙": 'assets/images/aroma/기타_화분흙',
    "훈제육": 'assets/images/aroma/기타_훈제육',
  };

  static const Map<String, String> oak = {
    "가죽": 'assets/images/aroma/오크_가죽',
    "견과류": 'assets/images/aroma/오크_견과류',
    "담배": 'assets/images/aroma/오크_담배',
    "바닐라": 'assets/images/aroma/오크_바닐라',
    "백단": 'assets/images/aroma/오크_백단',
    "브리오슈": 'assets/images/aroma/오크_브리오슈',
    "삼나무": 'assets/images/aroma/오크_삼나무',
    "시가박스": 'assets/images/aroma/오크_시가박스',
    "에스프레소": 'assets/images/aroma/오크_에스프레소',
    "초콜릿": 'assets/images/aroma/오크_초콜릿',
    "캐러멜": 'assets/images/aroma/오크_캐러멜',
    "커피": 'assets/images/aroma/오크_커피',
    "코코넛": 'assets/images/aroma/오크_코코아',
    "콜라": 'assets/images/aroma/오크_콜라',
    "파이프담배": 'assets/images/aroma/오크_파이프담배',
    "헤이즐넛": 'assets/images/aroma/오크_헤이즐넛',
    "흑설탕": 'assets/images/aroma/오크_흑설탕',
  };

}