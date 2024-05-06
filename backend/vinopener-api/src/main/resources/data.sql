INSERT INTO `user`
  (user_id, email, nickname, image_url)
VALUES (1, 'ssafy.c207@gmail.com', 'ssafy.c207', null),
       (2, 'ssafy1@gmail.com', 'Jeon', 'https://picsum.photos/100/150'),
       (3, 'ssafy2@gmail.com', 'Yang', 'https://picsum.photos/100/150'),
       (4, 'ssafy3@gmail.com', 'Choi', 'https://picsum.photos/100/150'),
       (5, 'ssafy4@gmail.com', 'Han', 'https://picsum.photos/100/150');

INSERT INTO `flavour_type`
  (flavour_type_id, name)
VALUES (1, '검은과일'),
       (2, '그린노트'),
       (3, '기타'),
       (4, '꽃'),
       (5, '녹색과일'),
       (6, '말린과일'),
       (7, '붉은과일'),
       (8, '시트러스'),
       (9, '열대과일'),
       (10, '오크'),
       (11, '푸른과일'),
       (12, '핵과류'),
       (13, '향신료');

INSERT INTO `flavour_taste`
  (flavour_taste_id, flavour_type_id, name)
VALUES
-- 검은과일
(1, 1, '블랙체리'),
(2, 1, '오디'),
(3, 1, '올리브'),
(4, 1, '자두'),
-- 그린노트
-- (2, '고추'),
(5, 2, '구스베리'),
(6, 2, '민트'),
(7, 2, '바질'),
(8, 2, '세이지'),
(9, 2, '아몬드'),
(10, 2, '오레가노'),
(11, 2, '유칼립투스'),
(12, 2, '처빌'),
(13, 2, '피망'),
(14, 2, '할라피뇨'),
(15, 2, '허브'),
(16, 2, '홍차'),
-- 기타
(17, 3, '구운빵'),
(18, 3, '꿀'),
(19, 3, '돌'),
-- (3, '마굿간'),
(20, 3, '마른낙엽'),
(21, 3, '맥주'),
(22, 3, '밀랍'),
(23, 3, '반창고'),
(24, 3, '버섯'),
(25, 3, '버터'),
(26, 3, '분필'),
(27, 3, '생강'),
(28, 3, '석연슬레이트'),
(29, 3, '숲바닥'),
(30, 3, '야생고기'),
(31, 3, '연필심'),
(32, 3, '염분'),
-- (3, '유황'),
(33, 3, '절인고기'),
(34, 3, '점토'),
-- (3, '젖은낙엽'),
(35, 3, '젖은상자'),
(36, 3, '젖은자갈'),
(37, 3, '젖은토양'),
-- (3, '지하실'),
(38, 3, '치즈'),
(39, 3, '크림'),
(40, 3, '타르'),
(41, 3, '화분흙'),
(42, 3, '훈제육'),
-- 꽃
(43, 4, '라벤더'),
(44, 4, '백합'),
(45, 4, '아카시아'),
(46, 4, '오렌지꽃'),
(47, 4, '인동덩굴'),
(48, 4, '자스민'),
(49, 4, '작약'),
(50, 4, '장미'),
(51, 4, '제라늄'),
(52, 4, '제비꽃'),
(53, 4, '포푸리'),
(54, 4, '히비스커스'),
-- 녹색과일
(55, 5, '라임'),
(56, 5, '매실'),
(57, 5, '청배'),
-- 말린과일
(58, 6, '건포도'),
(59, 6, '무화과'),
(60, 6, '용과'),
-- 붉은과일
(61, 7, '딸기'),
(62, 7, '라즈베리'),
(63, 7, '붉은자두'),
(64, 7, '석류'),
(65, 7, '체리'),
(66, 7, '크랜베리'),
(67, 7, '토마토'),
-- 시트러스
(68, 8, '귤'),
(69, 8, '레몬'),
(70, 8, '마멀레이드'),
(71, 8, '오렌지'),
(72, 8, '자몽'),
-- 열대과일
(73, 9, '구아바'),
(74, 9, '리치'),
(75, 9, '망고'),
(76, 9, '바나나'),
(77, 9, '키위'),
(78, 9, '파인애플'),
(79, 9, '풍선껌'),
-- 오크
(80, 10, '가죽'),
(81, 10, '견과류'),
(82, 10, '담배'),
(83, 10, '바닐라'),
(84, 10, '백단'),
(85, 10, '브리오슈'),
(86, 10, '삼나무'),
(87, 10, '시가박스'),
(88, 10, '에스프레소'),
(89, 10, '초콜릿'),
(90, 10, '캐러멜'),
(91, 10, '커피'),
(92, 10, '코코넛'),
(93, 10, '코코아'),
(94, 10, '콜라'),
(95, 10, '파이프담배'),
(96, 10, '헤이즐넛'),
(97, 10, '흑설탕'),
-- 푸른과일
(98, 11, '블루베리'),
-- 핵과류
(99, 12, '모과'),
(100, 12, '복숭아'),
(101, 12, '사과'),
(102, 12, '살구'),
-- 향신료
(103, 13, '감초'),
(104, 13, '계피'),
(105, 13, '붉은고추'),
(106, 13, '육두구'),
(107, 13, '정향'),
(108, 13, '팔각'),
(109, 13, '후추');

INSERT INTO `color`
  (color_id, name)
VALUES (1, '밀짚색'),
       (2, '노란색'),
       (3, '황금색'),
       (4, '호박색'),
       (5, '갈색'),
       (6, '구리색'),
       (7, '연어색'),
       (8, '분홍색'),
       (9, '루비색'),
       (10, '보라색'),
       (11, '석류색'),
       (12, '황갈색');

INSERT INTO `wine`
(wine_id,
 name,
 seo_name,
 image_url,
 grape,
 winery,
 country,
 price,
 rating,
 vintage,
 type,
 acidity,
 intensity,
 sweetness,
 tannin,
 abv,
 view)
VALUES (1, 'Thurlow Cellars Copperhead Cabernet Sauvignon 2021',
        'thurlow cellars copperhead cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/lz599kJvSh65mHyG28RWzQ_pb_x600.png', 'Cabernet Sauvignon',
        'Thurlow Cellars', 'United States', 44.99, 4.3, 2021, 'RED', 3.5325878, 4.7059765,
        1.4647747, 3.3200169, 15.3, 0),
       (2, 'Turk Howell Cliffhanger Cabernet Sauvignon 2020',
        'turk howell cliffhanger cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/69ZvYo_6ROqTqgINWvrH-Q_pb_x600.png', 'Cabernet Sauvignon',
        'Turk', 'United States', 39.99, 4.3, 2020, 'RED', 3.4408596, 4.5162130, 1.8549727,
        3.4519040, 14.5, 0),
       (3, 'Brunelli Amarone della Valpolicella Classico 2020',
        'brunelli amarone della valpolicella classico 2020',
        'https://images.vivino.com/thumbs/Wl7-ErhiTJuRu7SHs7SKWg_pb_x600.png', 'Corvina',
        'Brunelli', 'Italy', 39.99, 4.3, 2020, 'RED', 2.2997694, 4.7420053, 3.2387884, 2.1973534,
        15.0, 0),
       (4, 'Shafer TD9 2021', 'shafer vineyards td9 2021',
        'https://images.vivino.com/thumbs/3BjcyZO8TWi2qmHYgljfCw_pb_x600.png', 'Cabernet Sauvignon',
        'Shafer', 'United States', 85.00, 4.3, 2021, 'RED', 3.8193950, 4.8465242, 1.6688490,
        3.5110898, 15.3, 0),
       (5, 'Domaine de la Janasse Châteauneuf-du-Pape Chaupin 2020',
        'domaine de la janasse chateauneuf du pape chaupin 2020',
        'https://images.vivino.com/thumbs/ryuSEWkHT7WtX7putKiXwg_pb_x600.png', 'Grenache',
        'Domaine de la Janasse', 'France', 54.99, 4.3, 2020, 'RED', 3.0870726, 4.5910754, 2.0056000,
        2.9223230, 15.5, 0),
       (6, '1881 Napa Napa Valley Cabernet Sauvignon 2020',
        'eighteen eightyone napa napa valley cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/WCGJs6DTTyKb54SOgVXH5A_pb_x600.png', 'Cabernet Sauvignon',
        '1881 Napa', 'United States', 29.99, 4.3, 2020, 'RED', 3.3010929, 4.7124160, 1.7427895,
        3.3265102, 14.5, 0),
       (7, 'Degani Amarone della Valpolicella Classico 2018',
        'degani amarone della valpolicella classico 2018',
        'https://images.vivino.com/thumbs/BSrZZl-kTT-5HlQwX2Ayug_pb_x600.png', 'Corvina', 'Degani',
        'Italy', 44.99, 4.3, 2018, 'RED', 2.2859466, 4.7229333, 3.1305570, 2.2311370, 15.5, 0),
       (8, 'Pierre Damoy Chambertin Grand Cru 2013', 'pierre damoy chambertin grand cru 2013',
        'https://images.vivino.com/thumbs/j43indSBQUuLxzt1yl3mlQ_pb_x600.png', 'Pinot Noir',
        'Pierre Damoy', 'France', 499.99, 4.3, 2013, 'RED', 4.1923230, 3.3446264, 2.0892790,
        2.8581107, 13.0, 0),
       (9, 'Cellier des Princes Le Blason du Prince Châteauneuf-du-Pape 2022',
        'cellier des princes le blason du prince chateauneuf du pape 2022',
        'https://images.vivino.com/thumbs/HfPt6Nt0Rf-Lkl1uNEj0zw_pb_x600.png', 'Shiraz/Syrah',
        'Cellier des Princes', 'France', 32.99, 4.3, 2022, 'RED', 3.1128130, 4.6937184, 1.4595981,
        2.9225340, 15.0, 0),
       (10, 'Buena Vista Chateau Buena Vista Cabernet Sauvignon Napa Valley 2020',
        'buena vista winery chateau buena vista cabernet sauvignon napa valley 2020',
        'https://images.vivino.com/thumbs/f7tR4MRISRWWdrXFoGzG_w_pb_x600.png', 'Cabernet Sauvignon',
        'Buena Vista', 'United States', 36.99, 4.3, 2020, 'RED', 3.2827125, 4.6906900, 1.7057837,
        3.2269387, 13.5, 0),
       (11, 'Rombauer Vineyards Cabernet Sauvignon 2019',
        'rombauer vineyards st helena cabernet sauvignon 2019',
        'https://images.vivino.com/thumbs/06TGpYhcQZSzq_NAn5Cr4w_pb_x600.png', 'Sauvignon Blanc',
        'Rombauer Vineyards', 'United States', 72.99, 4.3, 2019, 'RED', 3.4437714, 4.7818720,
        1.5611050, 3.3535872, 14.8, 0),
       (12, 'DAOU Reserve Cabernet Sauvignon 2021', 'daou reserve cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/4kS-NRPdTXeaovChso4BGw_pb_x600.png', 'Cabernet Sauvignon',
        'DAOU', 'United States', 39.99, 4.3, 2021, 'RED', 3.0605536, 4.7953672, 1.6676995,
        3.3853980, 14.5, 0),
       (13, 'Mount Peak Gravity 2019', 'mount peak california gravity 2019',
        'https://images.vivino.com/thumbs/2vaq7reiRAWC-UCBAb25Mg_pb_x600.png', 'Cabernet Sauvignon',
        'Mount Peak', 'United States', 45.99, 4.3, 2019, 'RED', 3.8443432, 4.8433743, 1.6908447,
        3.5305972, 15.9, 0),
       (14, 'Mount Peak Rattlesnake Zinfandel 2021',
        'mount peak california rattlesnake zinfandel 2021',
        'https://images.vivino.com/thumbs/NWPfIGYlTxOzTj9tADmo3w_pb_x600.png', 'Zinfandel',
        'Mount Peak', 'United States', 42.99, 4.3, 2021, 'RED', 1.9750872, 4.8018720, 2.4613438,
        2.5719392, 14.0, 0),
       (15, 'Orin Swift Slander Pinot Noir 2022', 'orin swift napa valley slander pinot noir 2022',
        'https://images.vivino.com/thumbs/IdIct_s1TciMRixFv0Anjw_pb_x600.png', 'Pinot Noir',
        'Orin Swift', 'United States', 49.99, 4.3, 2022, 'RED', 3.3828850, 3.3767686, 1.7835116,
        2.1892986, 15.4, 0),
       (16, 'Orin Swift Eight Years In The Desert 2022',
        'orin swift napa valley eight years in the desert 2022',
        'https://images.vivino.com/thumbs/Idmjm47oRtWK85oWJpRjgA_pb_x600.png', 'Shiraz/Syrah',
        'Orin Swift', 'United States', 45.99, 4.3, 2022, 'RED', 1.9374593, 4.7838373, 2.4342697,
        2.5607464, 15.6, 0),
       (17, 'Stéphane Usseglio Fragments Châteauneuf du Pape 2018',
        'stephane usseglio fragments chateauneuf du pape chateauneuf du pape 2018',
        'https://images.vivino.com/thumbs/fEXeQfSiQzOPKUhW8cAhiw_pb_x600.png', 'Mourvedre',
        'Stéphane Usseglio', 'France', 49.99, 4.2, 2018, 'RED', 3.0751898, 5.0000000, 1.0136709,
        2.8931646, 14.5, 0),
       (18, 'Austin Hope Austin Cabernet Sauvignon', 'austin hope austin cabernet sauvignon nv',
        'https://images.vivino.com/thumbs/3M591iy3TXyMspYGnvU9pg_pb_x600.png', 'Cabernet Sauvignon',
        'Austin Hope', 'United States', 19.99, 4.2, 0, 'RED', 2.9197025, 4.5105357, 2.0492610,
        3.0720065, 15.0, 0),
       (19, 'Frisson Napa Valley Cabernet Sauvignon 2020',
        'frisson napa valley cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/Ttvd0WhkRpGQqHh5uTloRA_pb_x600.png', 'Cabernet Sauvignon',
        'Frisson', 'United States', 36.99, 4.2, 2020, 'RED', 3.6274607, 4.5887456, 1.5604703,
        3.3924034, 14.5, 0),
       (20, 'Tori Magna Stareye Cabernet Sauvignon 2021',
        'tori magna stareye cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/K9Lct71hRKSNNERt_m3GDw_pb_x600.png', 'Cabernet Sauvignon',
        'Tori Magna', 'United States', 39.99, 4.2, 2021, 'RED', 3.3719947, 4.8054256, 1.5998404,
        3.5418750, 15.0, 0),
       (21, 'Paul Jaboulet Aîné Hermitage La Petite Chapelle 2014',
        'paul jaboulet aine rhone hermitage la petite chapelle 2014',
        'https://images.vivino.com/thumbs/sEtWZCfkQZCi0x8c_FAIqg_pb_x600.png', 'Shiraz/Syrah',
        'Paul Jaboulet Aîné', 'France', 199.99, 4.2, 2014, 'RED', 3.4593916, 4.7210836, 1.7794945,
        3.9914860, 13.0, 0),
       (22, 'Château du Grand Bos Graves Rouge 2015', 'grand bos graves rouge 2015',
        'https://images.vivino.com/thumbs/Ci68lD4WTSmRJFJF5jBLCg_pb_x600.png', 'Cabernet Franc',
        'Château du Grand Bos', 'France', 19.99, 4.2, 2015, 'RED', 4.2672590, 4.2376160, 1.3583709,
        4.2565160, 12.0, 0),
       (23, 'Santa Brasa Malbec 2020', 'santa brasa malbec 2020',
        'https://images.vivino.com/thumbs/6J_r5leMRo6KGgG2PATGoQ_pb_x600.png', 'Malbec',
        'Santa Brasa', 'Argentina', 13.99, 4.2, 2020, 'RED', 2.7870271, 3.4959278, 2.0030270,
        2.2366488, 13.5, 0),
       (24, 'Croce di Mezzo Brunello di Montalcino 2015',
        'croce di mezzo brunello di montalcino 2015',
        'https://images.vivino.com/thumbs/e4QAOyzXTaOSXunkXTbrpw_pb_x600.png', 'Sangiovese',
        'Croce di Mezzo', 'Italy', 54.99, 4.2, 2015, 'RED', 3.7799240, 3.0524762, 1.6176270,
        3.6012022, 13.5, 0),
       (25, 'Beau Vigne ICON Proprietary Red 2021', 'beau vigne icon proprietary red 2021',
        'https://images.vivino.com/thumbs/zPkuW5vVSKqEZTfCDpPfgw_pb_x600.png', 'Petit Verdot',
        'Beau Vigne', 'United States', 34.99, 4.2, 2021, 'RED', 3.3917391, 3.9465218, 1.4743478,
        3.0152173, 15.1, 0),
       (26, 'Schrader Cabernet Sauvignon RBS Beckstoffer To Kalon Vineyard 2019',
        'schrader cellars cabernet sauvignon rbs beckstoffer to kalon vineyard 2019',
        'https://images.vivino.com/thumbs/GpcSXs2ERS6niDxoAsvESA_pb_x600.png', 'Cabernet Sauvignon',
        'Schrader', 'United States', 425.00, 4.7, 2019, 'RED', 3.3543901, 4.6896834, 1.9561282,
        3.4103322, 14.5, 0),
       (27, 'Shafer Hillside Select Cabernet Sauvignon 2019',
        'shafer vineyards hillside select cabernet sauvignon 2019',
        'https://images.vivino.com/thumbs/Q71Yx3zaRQW9IqxN0vk64w_pb_x600.png', 'Cabernet Sauvignon',
        'Shafer', 'United States', 369.99, 4.6, 2019, 'RED', 3.3944690, 4.6892524, 1.7686377,
        3.4822200, 15.5, 0),
       (28, 'Caymus Vineyards Special Selection Cabernet Sauvignon 2019',
        'caymus vineyards rutherford special selection cabernet sauvignon 2019',
        'https://images.vivino.com/thumbs/ICtj7J6-Q0aH7c3GtLrs_w_pb_x600.png', 'Cabernet Sauvignon',
        'Caymus Vineyards', 'United States', 225.00, 4.6, 2019, 'RED', 3.3057390, 4.7562290,
        1.9229916, 3.1982672, 15.4, 0),
       (29, 'Revana Terroir Series Cabernet Sauvignon 2019',
        'revana terroir series cabernet sauvignon 2019',
        'https://images.vivino.com/thumbs/UwdLpKFwTYyPn15R-RZ42g_pb_x600.png', 'Cabernet Sauvignon',
        'Revana', 'United States', 99.99, 4.5, 2019, 'RED', 3.1395385, 4.7224855, 1.8374853,
        3.1739652, 14.7, 0),
       (30, 'Villa Poggio Salvi Pomona Brunello di Montalcino 2017',
        'it villa poggio salvi pomona brunello di montalcino 2017',
        'https://images.vivino.com/thumbs/UTQr8hifQl2Ne1Hfu5Vefw_pb_x600.png', 'Sangiovese',
        'Villa Poggio Salvi', 'Italy', 69.99, 4.5, 2017, 'RED', 3.7133000, 3.4888740, 1.4687243,
        3.6730149, 14.5, 0),
       (31, 'Cornell Courtship Cabernet Sauvignon 2019',
        'cornell courtship cabernet sauvignon 2019',
        'https://images.vivino.com/thumbs/84alvR2uRy-epluB7DfWHw_pb_x600.png', 'Cabernet Sauvignon',
        'Cornell', 'United States', 85.00, 4.5, 2019, 'RED', 3.0902330, 4.6511955, 1.3402333,
        3.5557141, 14.3, 0),
       (32, 'Caymus Vineyards Cabernet Sauvignon 2021',
        'caymus vineyards rutherford cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/y8_QSo4LQLOs3xzY-0LvUA_pb_x600.png', 'Cabernet Sauvignon',
        'Caymus Vineyards', 'United States', 79.99, 4.5, 2021, 'RED', 3.2789385, 4.7428284,
        1.9427402, 3.1412728, 14.8, 0),
       (33, 'Shafer One Point Five Cabernet Sauvignon 2021',
        'shafer vineyards one point five cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/OVloMWqBSsizWeIWnHXSdw_pb_x600.png', 'Cabernet Sauvignon',
        'Shafer', 'United States', 131.99, 4.5, 2021, 'RED', 3.6160479, 4.7886944, 1.6191167,
        3.4637883, 15.1, 0),
       (34, 'Gaja Costa Russi (Barbaresco) Langhe 2017', 'gaja costa russi barbaresco langhe 2017',
        'https://images.vivino.com/thumbs/KxNVSTY3QTScstQgRs6lcQ_pb_x600.png', 'Nebbiolo', 'Gaja',
        'Italy', 395.00, 4.4, 2017, 'RED', 4.6493125, 3.7385964, 1.7852416, 3.9713500, 14.0, 0),
       (35, 'Orin Swift Machete 2021', 'orin swift napa valley machete 2021',
        'https://images.vivino.com/thumbs/8aKn9RnDT6K6NS3pheY-pg_pb_x600.png', 'Grenache',
        'Orin Swift', 'United States', 59.99, 4.4, 2021, 'RED', 3.7970972, 4.8601894, 1.7417341,
        3.4756660, 16.1, 0),
       (36, 'Austin Hope Paso Robles Cabernet Sauvignon 2021',
        'austin hope paso robles cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/OuKH8BzBSoCcUvxbk8LTQA_pb_x600.png', 'Cabernet Sauvignon',
        'Austin Hope', 'United States', 56.00, 4.4, 2021, 'RED', 2.9100716, 4.8012530, 1.9164718,
        3.2007623, 15.0, 0),
       (37, 'Degani Amarone della Valpolicella Classico 2017',
        'degani amarone della valpolicella classico 2017',
        'https://images.vivino.com/thumbs/BSrZZl-kTT-5HlQwX2Ayug_pb_x600.png', 'Corvina', 'Degani',
        'Italy', 44.99, 4.3, 2017, 'RED', 2.2859466, 4.7229333, 3.1305570, 2.2311370, 15.5, 0),
       (38, 'Corte Lavel Amarone della Valpolicella 2019',
        'corte lavel amarone della valpolicella 2019',
        'https://images.vivino.com/thumbs/JiG0PoJRRpG_UYOwARTsXQ_pb_x600.png', 'Corvina',
        'Corte Lavel', 'Italy', 39.99, 4.3, 2019, 'RED', 2.5907555, 4.4640493, 3.0079339, 2.2098937,
        16.0, 0),
       (39, 'Erikson & Caradin Bilateral Cabernet Sauvignon 2021',
        'erikson caradin bilateral cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/2NHKUAWsTzShu2t71ak3Gw_pb_x600.png', 'Cabernet Sauvignon',
        'Erikson & Caradin', 'United States', 59.99, 4.3, 2021, 'RED', 3.2737880, 4.4764957,
        2.1077650, 3.4319885, 15.4, 0),
       (40, 'Thurlow Cellars Pit Viper Cabernet Sauvignon 2021',
        'thurlow cellars pit viper cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/KUODeGntR7Ovbpv23AZ8Jg_pb_x600.png', 'Cabernet Sauvignon',
        'Thurlow Cellars', 'United States', 44.99, 4.3, 2021, 'RED', 3.2016704, 4.7774143,
        1.4541991, 3.4314876, 15.2, 0),
       (41, 'Yount Ridge Proprietary Blend 2019', 'yount ridge proprietary blend 2019',
        'https://images.vivino.com/thumbs/seE2h_etSSOeyvJIdwQsXQ_pb_x600.png', 'Cabernet Sauvignon',
        'Yount Ridge', 'United States', 59.99, 4.4, 2019, 'RED', 3.6747386, 4.5555900, 1.5844495,
        3.3325882, 14.7, 0),
       (42, 'Beau Vigne Reserve Proprietary Red 2021', 'beau vigne reserve proprietary red 2021',
        'https://images.vivino.com/thumbs/KOTVVOXeR2iJQQR4nHJzDQ_pb_x600.png', 'Cabernet Sauvignon',
        'Beau Vigne', 'United States', 44.99, 4.4, 2021, 'RED', 3.9512308, 4.8841540, 1.8748205,
        3.4813333, 14.9, 0),
       (43, 'Château St. Jean Cinq Cépages 2017', 'chateau st jean cinq cepages 2017',
        'https://images.vivino.com/thumbs/XfoAvSHpQ-qzBJpIZpJlCw_pb_x600.png', 'Cabernet Sauvignon',
        'Château St. Jean', 'United States', 69.99, 4.4, 2017, 'RED', 3.5318367, 4.7975373,
        1.6539736, 3.6042385, 14.5, 0),
       (44, 'Caro (Catena and Rothschild) Caro 2019', 'bodegas caro caro 2019',
        'https://images.vivino.com/thumbs/M4Uo4rMRQeGTWraXjdyt9Q_pb_x600.png', 'Malbec',
        'Caro (Catena and Rothschild)', 'Argentina', 69.99, 4.4, 2019, 'RED', 3.0533903, 4.3061886,
        1.6491857, 3.1311562, 14.5, 0),
       (45, 'Croce di Mezzo Brunello di Montalcino Riserva 2015',
        'croce di mezzo brunello di montalcino riserva 2015',
        'https://images.vivino.com/thumbs/9ChC67WsQkGUP4Olc9m3Ag_pb_x600.png', 'Sangiovese',
        'Croce di Mezzo', 'Italy', 119.99, 4.4, 2015, 'RED', 3.4080799, 2.8311200, 1.8865600,
        3.3777602, 13.1, 0),
       (46, 'Bella Union Cabernet Sauvignon 2021', 'bella union cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/OtTKlRkbSsGSZKeGQrH-lQ_pb_x600.png', 'Cabernet Sauvignon',
        'Bella Union', 'United States', 54.99, 4.4, 2021, 'RED', 3.4014160, 4.8036130, 1.5834732,
        3.3306134, 14.5, 0),
       (47, 'Giusti Umberto I Rosso Veneto 2015', 'giusti umberto i rosso veneto 2015',
        'https://images.vivino.com/thumbs/bpB9lWmORjaiCB-BshxuuQ_pb_x600.png', 'Cabernet Sauvignon',
        'Giusti', 'Italy', 69.99, 4.4, 2015, 'RED', 2.2182844, 4.0592313, 1.9450932, 2.9706366,
        14.5, 0),
       (48, 'Zenato Amarone della Valpolicella Classico 2018',
        'zenato amarone della valpolicella classico 2018',
        'https://images.vivino.com/thumbs/Es37D9nmRfa3BXnce--7BQ_pb_x600.png', 'Corvina', 'Zenato',
        'Italy', 49.99, 4.4, 2018, 'RED', 2.2192578, 4.7963510, 3.3383281, 2.2510414, 15.0, 0),
       (49, 'Aviara Prana Block M5 Cabernet Sauvignon 2020',
        'aviara prana block m5 cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/kxjg9DF5Qgyl3Xxti2MkOw_pb_x600.png', 'Cabernet Sauvignon',
        'Aviara Prana', 'United States', 44.99, 4.4, 2020, 'RED', 3.4624248, 4.6915827, 1.6478266,
        3.7339320, 14.5, 0),
       (50, 'Miner The Oracle 2016', 'miner oak ville the oracle 2016',
        'https://images.vivino.com/thumbs/tuWhEoC3RM2GHurUf3RZxw_pb_x600.png', 'Cabernet Sauvignon',
        'Miner', 'United States', 99.99, 4.4, 2016, 'RED', 3.8152300, 4.7893990, 1.4656692,
        3.3591468, 14.3, 0),
       (51, 'Cakebread Cabernet Sauvignon 2021', 'cakebread cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/ZYpgwfRFRWqKpSvfVKZjIA_pb_x600.png', 'Cabernet Sauvignon',
        'Cakebread', 'United States', 79.99, 4.4, 2021, 'RED', 3.3914664, 4.7552786, 1.5937899,
        3.2826705, 14.4, 0),
       (52, 'E. Guigal Ermitage Ex-Voto 2018', 'e guigal northern rhne ermitage ex voto 2018',
        'https://images.vivino.com/thumbs/ZZ7B6x7-TNucy0v7EWaHqw_pb_x600.png', 'Shiraz/Syrah',
        'E. Guigal', 'France', 450.00, 4.4, 2018, 'RED', 3.5583098, 4.6093507, 1.8386673, 4.0977750,
        14.5, 0),
       (53, 'Beringer Private Reserve Cabernet Sauvignon 2017',
        'beringer private reserve cabernet sauvignon 2017',
        'https://images.vivino.com/thumbs/ip-aEsX1T1qaHdDmQrKjfw_pb_x600.png', 'Cabernet Sauvignon',
        'Beringer', 'United States', 129.99, 4.4, 2017, 'RED', 3.3555396, 4.6901665, 1.7050230,
        3.4323378, 15.5, 0),
       (54, 'Don Melchor Cabernet Sauvignon 2020', 'don melchor cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/gsh_noaoQv-7Xm8ofes8mg_pb_x600.png', 'Cabernet Sauvignon',
        'Don Melchor', 'Chile', 109.99, 4.4, 2020, 'RED', 2.9960954, 4.2712520, 1.7933307,
        3.2079750, 14.5, 0),
       (55, 'DAOU Unbound Reserve 2020', 'daou unbound reserve 2020',
        'https://images.vivino.com/thumbs/M4uHsQ7mTummsW_qrj5Lww_pb_x600.png', 'Tempranillo',
        'DAOU', 'United States', 59.00, 4.4, 2020, 'RED', 3.7313936, 4.7954750, 1.7186342,
        3.5550250, 14.2, 0),
       (56, 'Orin Swift Papillon 2021', 'orin swift napa valley papillon 2021',
        'https://images.vivino.com/thumbs/RYvZIJbWQO2x7Oj5zIUbYg_pb_x600.png', 'Cabernet Sauvignon',
        'Orin Swift', 'United States', 89.99, 4.4, 2021, 'RED', 3.8739274, 4.8671710, 1.6913253,
        3.4358964, 15.5, 0),
       (57, 'Mount Peak Sentinel Cabernet Sauvignon 2020',
        'mount peak california sentinel cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/b2lxddaJRtqPA4HP16vkSw_pb_x600.png', 'Cabernet Sauvignon',
        'Mount Peak', 'United States', 64.99, 4.4, 2020, 'RED', 2.9912732, 4.7708430, 1.6878982,
        3.4643760, 14.5, 0),
       (58, 'Tori Magna Stareye Cabernet Sauvignon 2020',
        'tori magna stareye cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/K9Lct71hRKSNNERt_m3GDw_pb_x600.png', 'Cabernet Sauvignon',
        'Tori Magna', 'United States', 39.99, 4.2, 2020, 'RED', 3.3719947, 4.8054256, 1.5998404,
        3.5418750, 15.0, 0),
       (59, 'Podere Sette L''Invidio Bolgheri Rosso 2022',
        'podere sette l invidio bolgheri rosso 2022',
        'https://images.vivino.com/thumbs/mAzb1ydST4Cye2tZpDG6eA_pb_x600.png', 'Cabernet Sauvignon',
        'Podere Sette', 'Italy', 23.99, 4.2, 2022, 'RED', 3.1695533, 3.7372305, 1.6707816,
        3.5415413, 14.5, 0),
       (60, 'Bodega 202 Ansa 2016', 'bodega 202 ansa 2016',
        'https://images.vivino.com/thumbs/A3WJzM09RXq44mPUnzpo-g_pb_x600.png', 'Tempranillo',
        'Bodega 202', 'Spain', 42.99, 4.2, 2016, 'RED', 3.9038806, 4.0056343, 1.5895149, 4.1004477,
        14.0, 0),
       (61, 'Félix Solís Mucho Más Tinto', 'felix solis valdepenas mucho mas tinto nv',
        'https://images.vivino.com/thumbs/nMRl6FutRX26zFRR1iqtqQ_pb_x600.png', 'Shiraz/Syrah',
        'Félix Solís', 'Spain', 12.99, 4.2, 0, 'RED', 2.6201880, 3.7801090, 2.7191480, 2.7901042,
        13.5, 0),
       (62, 'Yarra Yering Underhill Shiraz 2012', 'yarra yering underhill shiraz 2012',
        'https://images.vivino.com/thumbs/1hZmsVIYS1CQpE9bReCGtg_pb_x600.png', 'Shiraz/Syrah',
        'Yarra Yering', 'Australia', 49.99, 4.2, 2012, 'RED', 3.1059413, 4.4494790, 2.0728302,
        3.0865805, 13.5, 0),
       (63, 'Château des Bachelards - Comtesse de Vazeilles Saint-Amour 2018',
        'les bachelards saint amour 2018',
        'https://images.vivino.com/thumbs/pjp-BcgjTweDHHxALJALJg_pb_x600.png', 'Gamay',
        'Château des Bachelards - Comtesse de Vazeilles', 'France', 44.99, 4.2, 2018, 'RED',
        4.3458366, 1.9278498, 1.5898634, 2.3002730, 13.5, 0),
       (64, 'Bastioni della Rocca Appassimento 2021', 'bastioni della rocca appassimento 2021',
        'https://images.vivino.com/thumbs/whi1S0WPTe6pDVBBk8hXcw_pb_x600.png', 'Primitivo',
        'Bastioni della Rocca', 'Italy', 14.99, 4.2, 2021, 'RED', 2.0888388, 4.2119180, 3.2117965,
        2.4070046, 15.0, 0),
       (65, 'Beringer Knights Valley Cabernet Sauvignon 2020',
        'beringer knights valley cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/vBuYA663QEapvDs-C6u0vA_pb_x600.png', 'Cabernet Sauvignon',
        'Beringer', 'United States', 29.99, 4.2, 2020, 'RED', 3.0234354, 4.7862920, 1.6650468,
        3.4146516, 14.5, 0),
       (66, 'El Enemigo Malbec 2020', 'el enemigo malbec 2020',
        'https://images.vivino.com/thumbs/S0m-9WKZRfKqjuvZbpy8Vg_pb_x600.png', 'Cabernet Franc',
        'El Enemigo', 'Argentina', 24.99, 4.2, 2020, 'RED', 2.6945703, 3.9007943, 2.1291234,
        2.7056900, 13.5, 0),
       (67, 'Illahe Bon Sauvage Pinot Noir 2021', 'illahe bon sauvage pinot noir 2021',
        'https://images.vivino.com/thumbs/ZafHZj9bQ1S9baP4nF26sA_pb_x600.png', 'Pinot Noir',
        'Illahe', 'United States', 39.99, 4.2, 2021, 'RED', 4.0085483, 2.2335408, 1.5325273,
        2.2343497, 13.5, 0),
       (68, 'Michael David Winery Earthquake Zinfandel 2020',
        'michael david winery earthquake zinfandel 2020',
        'https://images.vivino.com/thumbs/UdIG6xqGQ_i-6aC3xJTlWQ_pb_x600.png', 'Zinfandel',
        'Michael David Winery', 'United States', 21.99, 4.2, 2020, 'RED', 1.7785132, 4.8746676,
        2.5422919, 2.5100055, 15.5, 0),
       (69, 'Beau Vigne Legacy Cabernet Sauvignon 2020',
        'beau vigne legacy cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/V7l3ksRKQneu2tt-OA6izw_pb_x600.png', 'Cabernet Sauvignon',
        'Beau Vigne', 'United States', 39.99, 4.2, 2020, 'RED', 3.3433735, 4.5685020, 1.6454995,
        3.4777896, 14.5, 0),
       (70, 'The Hess Collection Lion Tamer Cabernet Sauvignon 2019',
        'hess collection winery lion tamer cabernet sauvignon 2019',
        'https://images.vivino.com/thumbs/rtU1w_GxTl2UNUj3us1gNQ_pb_x600.png', 'Cabernet Sauvignon',
        'The Hess Collection', 'United States', 49.99, 4.2, 2019, 'RED', 3.3313140, 4.7034290,
        2.0239230, 3.3107927, 14.8, 0),
       (71, 'Axr Proprietary Red 2021', 'axr proprietary red 2021',
        'https://images.vivino.com/thumbs/V2vME4XGQMK4clxSWGrB0w_pb_x600.png', 'Cabernet Sauvignon',
        'Axr', 'United States', 38.99, 4.2, 2021, 'RED', 3.8358760, 4.6753110, 1.8025895, 4.0404990,
        14.8, 0),
       (72, 'Beaulieu Vineyard (BV) Napa Valley Cabernet Sauvignon 2020',
        'beaulieu vineyard napa valley cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/yL_Hsr9MSOKgN7dAyHVobQ_pb_x600.png', 'Cabernet Sauvignon',
        'Beaulieu Vineyard (BV)', 'United States', 36.99, 4.1, 2020, 'RED', 3.4014263, 4.6966476,
        1.6740588, 3.3793678, 14.7, 0),
       (73, 'Donne Fittipaldi Bolgheri 2021', 'donne fittipaldi bolgheri 2021',
        'https://images.vivino.com/thumbs/zZYw-EPtQoyjKOIPT6_s_g_pb_x600.png', 'Merlot',
        'Donne Fittipaldi', 'Italy', 27.99, 4.1, 2021, 'RED', 3.4531120, 3.8901432, 1.6010262,
        3.8396833, 14.0, 0),
       (74, 'Henri Musso Château Les Landes de Cach Pauillac 2017',
        'henri musso chateau les landes de cach pauillac 2017',
        'https://images.vivino.com/thumbs/ZO4QvhQoSo2Vp10n4GCGsQ_pb_x600.png', 'Cabernet Sauvignon',
        'Henri Musso', 'France', 39.99, 4.1, 2017, 'RED', 4.2603507, 4.0184503, 1.6010331,
        4.1626650, 13.0, 0),
       (75, 'Bodegas Vilano Reserva 2019', 'bodegas vilano castilla and leon reserva 2019',
        'https://images.vivino.com/thumbs/jAAuM-FWTVyZP08U-2F1eg_pb_x600.png', 'Tempranillo',
        'Bodegas Vilano', 'Spain', 29.99, 4.1, 2019, 'RED', 3.8168972, 4.0257897, 1.4728527,
        3.5939152, 13.5, 0),
       (76, 'William Hill Napa Valley Cabernet Sauvignon 2019',
        'william hill napa valley cabernet sauvignon 2019',
        'https://images.vivino.com/thumbs/cf7YOfAVRaO2duOVVKwGaA_pb_x600.png', 'Cabernet Sauvignon',
        'William Hill', 'United States', 39.99, 4.2, 2019, 'RED', 3.4316600, 4.7573514, 1.6566638,
        3.4243530, 14.8, 0),
       (77, 'DAOU Cabernet Sauvignon 2022', 'daou cabernet sauvignon 2022',
        'https://images.vivino.com/thumbs/D8yV6B8pQGGs2GBE9GnLnA_pb_x600.png', 'Cabernet Sauvignon',
        'DAOU', 'United States', 21.99, 4.1, 2022, 'RED', 3.0007823, 4.7031927, 1.7660148,
        3.3249080, 14.5, 0),
       (78, 'Emmolo Merlot 2021', 'emmolo merlot 2021',
        'https://images.vivino.com/thumbs/9npNBZOmS0y7lTUN7OYPCQ_pb_x600.png', 'Merlot', 'Emmolo',
        'United States', 38.99, 4.2, 2021, 'RED', 1.6814263, 4.0123370, 2.1340373, 2.0812094, 14.4,
        0),
       (79, 'Quest Proprietary Red 2022', 'quest paso robles proprietary red 2022',
        'https://images.vivino.com/thumbs/R0OChKxXROqmgxC9htjBGA_pb_x600.png', 'Cabernet Sauvignon',
        'Quest', 'United States', 27.99, 4.1, 2022, 'RED', 3.5636718, 4.6937310, 1.8345038,
        3.4447095, 14.5, 0),
       (80, 'Verdon Estate Proprietary Red Reserve No. 8 2019',
        'verdon estate rutherford proprietary red reserve no 8 2019',
        'https://images.vivino.com/thumbs/OlSFtDIUQBei6e0a9QI2ag_pb_x600.png', 'Cabernet Sauvignon',
        'Verdon Estate', 'United States', 26.99, 4.1, 2019, 'RED', 3.7752820, 4.7988715, 1.7349230,
        3.6606522, 15.5, 0),
       (81, 'Orin Swift Abstract 2022', 'orin swift napa valley abstract 2022',
        'https://images.vivino.com/thumbs/JjR4EBrPQvWmiilAR2vJMQ_pb_x600.png', 'Petite Sirah',
        'Orin Swift', 'United States', 39.99, 4.1, 2022, 'RED', 3.7950590, 4.8417234, 1.7755991,
        3.4089150, 15.3, 0),
       (82, 'Michael David Winery Earthquake Cabernet Sauvignon 2020',
        'michael david winery earthquake cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/WZ33unrQSBmpyTgA79KoFQ_pb_x600.png', 'Cabernet Sauvignon',
        'Michael David Winery', 'United States', 21.99, 4.1, 2020, 'RED', 3.0165558, 4.8158317,
        1.7357463, 3.3823974, 15.0, 0),
       (83, 'The Prisoner Unshackled Red Blend 2021', 'the prisoner unshackled red blend 2021',
        'https://images.vivino.com/thumbs/HOZLXttHRE2fnLKyGrio6w_pb_x600.png', 'Shiraz/Syrah',
        'The Prisoner', 'United States', 19.98, 4.1, 2021, 'RED', 3.6246900, 4.5880100, 1.8289036,
        3.2763147, 14.5, 0),
       (84, 'Sling & Spear Zinfandel 2017', 'sling spear zinfandel 2017',
        'https://images.vivino.com/thumbs/9cJqwpN6TFCyQEcrLUrJLg_pb_x600.png', 'Zinfandel',
        'Sling & Spear', 'United States', 17.99, 4.1, 2017, 'RED', 1.9264253, 4.7398868, 2.6055653,
        2.5730996, 14.3, 0),
       (85, 'Quilt The Woven Cellar Aged Release 2016', 'quilt the woven cellar aged release 2016',
        'https://images.vivino.com/thumbs/k7NVEvKiR0uO67XyeGrrUw_pb_x600.png', 'Zinfandel', 'Quilt',
        'United States', 24.99, 4.0, 2016, 'RED', 3.6350000, 4.6741667, 1.7108333, 3.3227777, 15.1,
        0),
       (86, 'Château Saincrit Fougue 2019', 'saincrit fougue 2019',
        'https://images.vivino.com/thumbs/ttTpmEqxRtCB2_iMc79yQA_pb_x600.png', 'Merlot',
        'Château Saincrit', 'France', 14.99, 4.1, 2019, 'RED', 3.9089230, 3.9579000, 1.6962786,
        3.7595322, 15.0, 0),
       (87, 'Rockslide Vineyards Sawtooth Ridge Cabernet Sauvignon 2021',
        'rockslide vineyards sawtooth ridge cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/etYCnqjPQ6O8pDSLsf070A_pb_x600.png', 'Cabernet Sauvignon',
        'Rockslide Vineyards', 'United States', 19.99, 4.0, 2021, 'RED', 3.1339330, 4.4478850,
        1.4328387, 3.4058998, 14.1, 0),
       (88, 'Ty Caton Vineyards Caton Vineyard Cabernet Sauvignon 2019',
        'ty caton vineyards caton vineyard cabernet sauvignon 2019',
        'https://images.vivino.com/thumbs/5L_ejTZbRjq6HKY2kwOkWA_pb_x600.png', 'Cabernet Sauvignon',
        'Ty Caton Vineyards', 'United States', 24.99, 4.1, 2019, 'RED', 3.0593886, 4.7897706,
        1.5218034, 3.4895816, 15.2, 0),
       (89, 'Beringer Knights Valley Reserve Cabernet Sauvignon 2020',
        'beringer knights valley reserve cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/ySnvqrR4SF-EFOtQN252-Q_pb_x600.png', 'Cabernet Sauvignon',
        'Beringer', 'United States', 39.99, 4.1, 2020, 'RED', 2.9974425, 4.8252215, 1.6423483,
        3.3708138, 14.9, 0),
       (90, 'Bonanza Cabernet Sauvignon Lot', 'bonanza california cabernet sauvignon lot nv',
        'https://images.vivino.com/thumbs/cVhc_50LTqOAE9KGlKJUCw_pb_x600.png', 'Cabernet Sauvignon',
        'Bonanza', 'United States', 17.99, 4.1, 0, 'RED', 2.8500938, 4.4703320, 2.1692670,
        2.9806392, 13.9, 0),
       (91, 'Edict Napa Valley Reserve Cabernet Sauvignon 2020',
        'edict napa valley reserve cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/Qxzn6JLjT6mZrZTU9yOD9w_pb_x600.png', 'Cabernet Sauvignon',
        'Edict', 'United States', 39.99, 4.1, 2020, 'RED', 3.4320743, 4.7154360, 1.6205004,
        3.4441460, 14.5, 0),
       (92, 'Domaine de Cabasse Gigondas 2020', 'domaine de cabasse gigondas 2020',
        'https://images.vivino.com/thumbs/Llr5qeARSwm3gdoY7YPskA_pb_x600.png', 'Shiraz/Syrah',
        'Domaine de Cabasse', 'France', 26.99, 4.0, 2020, 'RED', 3.3289897, 3.8467472, 1.8411306,
        3.1610842, 15.0, 0),
       (93, 'Ketcham Estate Five Clone Pinot Noir 2018',
        'ketcham estate five clone pinot noir 2018',
        'https://images.vivino.com/thumbs/GlLpzMYzTfuohChVkcdJ2A_pb_x600.png', 'Pinot Noir',
        'Ketcham Estate', 'United States', 19.99, 4.1, 2018, 'RED', 3.4056900, 3.3139696, 1.8034405,
        2.1167486, 14.5, 0),
       (94, 'On Q Cabernet Sauvignon 2020', 'q 146909 cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/9h0wx9YZSQSZTueciEdcfA_pb_x600.png', 'Cabernet Sauvignon',
        'On Q', 'United States', 36.99, 4.0, 2020, 'RED', 3.1923034, 4.8673716, 1.7355283,
        3.4367073, 14.8, 0),
       (95, 'Locations CA (California)', 'locations california ca california nv',
        'https://images.vivino.com/thumbs/MPxxeBarRAy2Ey5GI38W9A_pb_x600.png', 'Grüner Veltliner',
        'Locations', 'United States', 15.99, 4.0, 0, 'RED', 3.6402900, 4.6063995, 1.9481845,
        3.2441185, 15.5, 0),
       (96, 'The Prisoner Saldo Red Blend 2019', 'the prisoner saldo red blend 2019',
        'https://images.vivino.com/thumbs/_QYuTc6USley0S-keYKkxA_pb_x600.png', 'Shiraz/Syrah',
        'The Prisoner', 'United States', 29.98, 4.0, 2019, 'RED', 3.7290199, 4.7131860, 1.7893198,
        3.5199575, 15.0, 0),
       (97, 'Clos du Bois Sonoma Reserve Cabernet Sauvignon 2018',
        'clos du bois sonoma reserve cabernet sauvignon 2018',
        'https://images.vivino.com/thumbs/zG7evDg4S_ut68nbNWxfTQ_pb_x600.png', 'Cabernet Sauvignon',
        'Clos du Bois', 'United States', 22.99, 4.0, 2018, 'RED', 3.0172320, 4.8141160, 1.4003476,
        3.4726086, 14.5, 0),
       (98, 'Wines from Hahn Estate SLH Pinot Noir 2021',
        'wines from hahn estate santa lucia highlands slh pinot noir 2021',
        'https://images.vivino.com/thumbs/ALZK21CqTUSc4bpi6__MKw_pb_x600.png', 'Pinot Noir',
        'Wines from Hahn Estate', 'United States', 18.99, 3.9, 2021, 'RED', 3.3922443, 3.1103897,
        1.6784797, 2.1067824, 14.5, 0),
       (99, 'Smith & Hook Cabernet Sauvignon 2021', 'smith hook cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/H4p3bCe-TpyZVjx_I5_AZA_pb_x600.png', 'Cabernet Sauvignon',
        'Smith & Hook', 'United States', 19.99, 3.9, 2021, 'RED', 3.0428680, 4.7985630, 1.5586635,
        3.4453118, 14.8, 0),
       (100, 'Liberty School Cabernet Sauvignon 2021',
        'liberty school winery cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/NX8S9e1OQvCnmguwUYzRLg_pb_x600.png', 'Cabernet Sauvignon',
        'Liberty School', 'United States', 15.99, 3.9, 2021, 'RED', 2.9777071, 4.7778620, 1.6837260,
        3.2665138, 14.5, 0),
       (101, 'Apothic Dark (Red Blend) 2021',
        'apothic dark red blend california red wine v nmrtk 2021',
        'https://images.vivino.com/thumbs/-FHTCbcTRoin8zd48EJdEQ_pb_x600.png', 'Zinfandel',
        'Apothic', 'United States', 13.99, 3.9, 2021, 'RED', 3.8047776, 4.8515490, 1.9830303,
        3.3137958, 14.0, 0),
       (102, 'Ghost Pines Cabernet Sauvignon 2021', 'ghost pines cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/B1X-a37kQuGlwXOsvVPjUA_pb_x600.png', 'Cabernet Sauvignon',
        'Ghost Pines', 'United States', 17.99, 3.8, 2021, 'RED', 3.0312605, 4.8204813, 1.6096148,
        3.3981905, 14.5, 0),
       (103, 'Kallan Vintners Anza Diem Zinfandel 2020', 'kallan vintners anza diem zinfandel 2020',
        'https://images.vivino.com/thumbs/UcXomW0eTySZVQBkjVMLlA_pb_x600.png', 'Zinfandel',
        'Kallan Vintners', 'United States', 13.99, 3.7, 2020, 'RED', 1.9318919, 4.7351894,
        2.4878920, 2.5356216, 14.8, 0),
       (104, 'Apothic Red (Winemaker''s Blend) 2021', 'apothic red winemaker s blend 2021',
        'https://images.vivino.com/thumbs/8Zw4qf4IQA-MFtP8rf1QVA_pb_x600.png', 'Shiraz/Syrah',
        'Apothic', 'United States', 11.99, 3.7, 2021, 'RED', 3.8172238, 4.8215013, 2.2400770,
        3.3255646, 13.5, 0),
       (105, 'Dolum Estates Cask 14 Cabernet Sauvignon 2019',
        'dolum estates cask 14 cabernet sauvignon 2019',
        'https://images.vivino.com/thumbs/-2LAs2X2Q4-9l4B9KjHmqg_pb_x600.png', 'Cabernet Sauvignon',
        'Dolum Estates', 'United States', 38.00, 0.0, 2019, 'RED', 3.3767440, 5.0000000, 1.3744186,
        3.9186046, 15.0, 0),
       (106, 'Ashby Park Estates Pinot Noir Reserve 3 Barrel Select Coastal 2020',
        'ashby park estates pinot noir reserve 3 barrel select coastal 2020',
        'https://images.vivino.com/thumbs/3uOk4vBzTNGM2kqhMSduDw_pb_x600.png', 'Pinot Noir',
        'Ashby Park Estates', 'United States', 14.99, 0.0, 2020, 'RED', 3.2777777, 3.0000000,
        1.8888888, 2.4444444, 13.5, 0),
       (107, 'Frisson Alluvium Coombsville Napa Valley Cabernet Sauvignon 2020',
        'frisson alluvium coombsville napa valley cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/64KOZkvfQSua7XoMG6IW-g_pb_x600.png', 'Cabernet Sauvignon',
        'Frisson', 'United States', 39.99, 0.0, 2020, 'RED', 3.5000000, 4.7602130, 1.3944680,
        3.7419147, 14.9, 0),
       (108, 'Tori Magna Felsong Zinfandel 2020', 'tori magna felsong zinfandel 2020',
        'https://images.vivino.com/thumbs/tBxD9MXXT-SQ8QBK59XF5w_pb_x600.png', 'Zinfandel',
        'Tori Magna', 'United States', 16.99, 0.0, 2020, 'RED', 2.1900000, 5.0000000, 2.0000000,
        2.5000000, 15.2, 0),
       (109, 'Tenuta Carretta Barolo Poderi in Cannubi 2013',
        'tenuta carretta barolo poderi in cannubi 2013',
        'https://images.vivino.com/thumbs/T-F4O4bSTci6HL284fYgsw_pb_x600.png', 'Nebbiolo',
        'Tenuta Carretta', 'Italy', 59.99, 4.3, 2013, 'RED', 4.5098180, 3.7373881, 1.4024773,
        4.2927938, 13.5, 0),
       (110, 'Frank Family Cabernet Sauvignon 2021',
        'frank family calistoga cabernet sauvignon 2021',
        'https://images.vivino.com/thumbs/bIDaOh1SQyCjkdOZZm0TuA_pb_x600.png', 'Cabernet Sauvignon',
        'Frank Family', 'United States', 54.99, 4.3, 2021, 'RED', 3.4006293, 4.7126665, 1.5808395,
        3.2313786, 14.5, 0),
       (111, 'Erikson & Caradin Reserve Cabernet Sauvignon 2020',
        'erikson caradin reserve cabernet sauvignon 2020',
        'https://images.vivino.com/thumbs/B8mrmvt3Rqqcp4P6icBTzw_pb_x600.png', 'Cabernet Sauvignon',
        'Erikson & Caradin', 'United States', 32.99, 4.2, 2020, 'RED', 3.5103674, 4.7481313,
        1.2645209, 3.6460063, 14.9, 0),
       (112, 'Viñedos de Páganos La Nieta 2019', 'vinedos de paganos la nieta 2019',
        'https://images.vivino.com/thumbs/k8OSp-QDQC2L-yrytuBPiw_pb_x600.png', 'Tempranillo',
        'Viñedos de Páganos', 'Spain', 159.99, 4.6, 2019, 'RED', 3.6053438, 3.8032527, 2.0032450,
        3.6621000, 14.0, 0),
       (113, 'Terre Nere Campigli Vallone Brunello di Montalcino 2017',
        'terre nere brunello di montalcino 2017',
        'https://images.vivino.com/thumbs/_k4HoOTQTDmTjNVdzi3OzA_pb_x600.png', 'Sangiovese',
        'Terre Nere Campigli Vallone', 'Italy', 49.99, 4.2, 2017, 'RED', 3.8051124, 3.2405367,
        1.4275372, 3.6730185, 14.5, 0),
       (114, 'Roger Sabon Châteauneuf-du-Pape Le Secret Des Sabon 2020',
        'roger sabon chateauneuf du pape le secret des sabon 2020',
        'https://images.vivino.com/thumbs/aJISsgMpQSqzwzG4Rs8msQ_pb_x600.png', 'Grenache',
        'Roger Sabon', 'France', 199.99, 4.5, 2020, 'RED', 3.1660573, 4.4296527, 1.9671246,
        2.8833020, 15.5, 0),
       (115, 'Carodorum Selección Especial 2015', 'carmen rodriguez seleccion especial 2015',
        'https://images.vivino.com/thumbs/nAHg7C4aQBqQ9OhrMlzcLw_pb_x600.png', 'Tempranillo',
        'Carodorum', 'Spain', 32.99, 4.3, 2015, 'RED', 2.7265406, 4.4497920, 1.7454000, 3.3049502,
        15.0, 0),
       (116, 'Lenotti Amarone della Valpolicella Classico 2018',
        'lenotti amarone della valpolicella classico 2018',
        'https://images.vivino.com/thumbs/Th1YaDCGSZCM8t8oMqpATA_pb_x600.png', 'Corvina', 'Lenotti',
        'Italy', 36.99, 4.3, 2018, 'RED', 2.1712866, 4.7247140, 3.1884840, 2.2579465, 15.5, 0),
       (117, 'Gritos Estate  Malbec 2021', 'gritos estate malbec 2021',
        'https://images.vivino.com/thumbs/sRhY3a1XQd6sAXzMtHB-hw_pb_x600.png', 'Malbec', 'Gritos',
        'Argentina', 19.99, 4.3, 2021, 'RED', 2.9330270, 4.0385137, 1.7871081, 2.5647838, 13.5, 0),
       (118, 'Ca'' Erto Amarone della Valpolicella 2017', 'ca erto amarone della valpolicella 2017',
        'https://images.vivino.com/thumbs/w7hqZ3mfSEmAo6RxAwQM_Q_pb_x600.png', 'Rondinella',
        'Ca'' Erto', 'Italy', 44.99, 4.2, 2017, 'RED', 2.1199155, 4.9888453, 3.1184504, 2.1256902,
        16.0, 0),
       (119, 'Château Haut Grela Blaye Côtes De Bordeaux 2019',
        'chateau haut grela blaye cotes de bordeaux 2019',
        'https://images.vivino.com/thumbs/AUCnjUiLQpCRhNca_qlHqw_pb_x600.png', 'Cabernet Sauvignon',
        'Château Haut Grela', 'France', 15.99, 4.1, 2019, 'RED', 3.8280609, 3.6827790, 1.9237028,
        3.8214126, 14.0, 0),
       (120, 'Château la Rose Beaumont Blaye Côtes de Bordeaux Rouge 2019',
        'chateau la rose beaumont blaye cotes de bordeaux rouge 2019',
        'https://images.vivino.com/thumbs/spSdOn-RTHKS0dE6g9lIgQ_pb_x600.png', 'Merlot',
        'Château la Rose Beaumont', 'France', 12.99, 3.8, 2019, 'RED', 3.5434039, 3.3814020,
        1.4735802, 3.2599473, 13.5, 0),
       (121, 'Bodega Iaccarini Via Blanca Malbec 2022', 'iaccarini malbec 2022',
        'https://images.vivino.com/thumbs/UYJiEQh-TjmkONNivqvfDQ_pb_x600.png', 'Malbec',
        'Bodega Iaccarini', 'Argentina', 19.99, 4.2, 2022, 'RED', 2.4033034, 3.2021878, 2.5629017,
        2.0285268, 13.5, 0);

INSERT INTO `wine_flavour`
  (wine_id, flavour_taste_id)
VALUES (1, 83),    -- 바닐라
       (1, 82),    -- 담배
       (1, 89),    -- 초콜릿
       (1, 92),    -- 코코넛
       (1, 86),    -- 삼나무
       (1, 90),    -- 캐러멜
       (1, 103),   -- 감초
       (1, 109),   -- 후추
       (1, 6),     -- 민트
       (1, 98),    -- 블루베리
       (1, 1),     -- 블랙체리
       (1, 4),     -- 자두
       (1, 80),    -- 가죽
       (1, 19),    -- 돌
       (1, 28),    -- 석연슬레이트
       (1, 32),    -- 염분
       (1, 59),    -- 무화과
       (2, 86),    -- 삼나무
       (2, 83),    -- 바닐라
       (2, 82),    -- 담배
       (2, 89),    -- 초콜릿
       (2, 107),   -- 정향
       (2, 90),    -- 캐러멜
       (2, 94),    -- 콜라
       (2, 1),     -- 블랙체리
       (2, 98),    -- 블루베리
       (2, 80),    -- 가죽
       (2, 93),    -- 코코아
       (2, 32),    -- 염분
       (2, 62),    -- 라즈베리
       (2, 64),    -- 석류
       (2, 103),   -- 감초
       (2, 8),     -- 세이지
       (2, 59),    -- 무화과
       (2, 100),   -- 복숭아
       (3, 83),    -- 바닐라
       (3, 89),    -- 초콜릿
       (3, 82),    -- 담배
       (3, 106),   -- 육두구
       (3, 91),    -- 커피
       (3, 107),   -- 정향
       (3, 86),    -- 삼나무
       (3, 88),    -- 에스프레소
       (3, 94),    -- 콜라
       (3, 92),    -- 코코넛
       (3, 25),    -- 버터
       (3, 87),    -- 시가박스
       (3, 62),    -- 라즈베리
       (3, 65),    -- 체리
       (3, 66),    -- 크랜베리
       (3, 63),    -- 붉은자두
       (3, 61),    -- 딸기
       (3, 97),    -- 흑설탕
       (3, 9),     -- 아몬드
       (3, 103),   -- 감초
       (3, 109),   -- 후추
       (3, 104),   -- 계피
       (3, 6),     -- 민트
       (3, 8),     -- 세이지
       (3, 11),    -- 유칼립투스
       (3, 80),    -- 가죽
       (3, 93),    -- 코코아
       (3, 24),    -- 버섯
       (3, 29),    -- 숲바닥
       (3, 40),    -- 타르
       (3, 30),    -- 야생고기
       (3, 28),    -- 석연슬레이트
       (3, 26),    -- 분필
       (3, 1),     -- 블랙체리
       (3, 98),    -- 블루베리
       (3, 3),     -- 올리브
       (3, 58),    -- 건포도
       (3, 59),    -- 무화과
       (3, 38),    -- 치즈
       (3, 39),    -- 크림
       (3, 100),   -- 복숭아
       (3, 101),   -- 사과
       (3, 57),    -- 청배
       (3, 52),    -- 제비꽃
       (3, 70),    -- 마멀레이드
       (3, 71),    -- 오렌지
       (3, 75),    -- 망고
       (4, 83),    -- 바닐라
       (4, 89),    -- 초콜릿
       (4, 82),    -- 담배
       (4, 91),    -- 커피
       (4, 92),    -- 코코넛
       (4, 86),    -- 삼나무
       (4, 90),    -- 캐러멜
       (4, 88),    -- 에스프레소
       (4, 106),   -- 육두구
       (4, 87),    -- 시가박스
       (4, 107),   -- 정향
       (4, 25),    -- 버터
       (4, 84),    -- 백단
       (4, 95),    -- 파이프담배
       (4, 94),    -- 콜라
       (4, 1),     -- 블랙체리
       (4, 98),    -- 블루베리
       (4, 4),     -- 자두
       (4, 3),     -- 올리브
       (4, 2),     -- 오디
       (4, 9),     -- 아몬드
       (4, 109),   -- 후추
       (4, 103),   -- 감초
       (4, 104),   -- 계피
       (4, 6),     -- 민트
       (4, 11),    -- 유칼립투스
       (4, 8),     -- 세이지
       (4, 80),    -- 가죽
       (4, 93),    -- 코코아
       (4, 40),    -- 타르
       (4, 24),    -- 버섯
       (4, 28),    -- 석연슬레이트
       (4, 31),    -- 연필심
       (4, 30),    -- 야생고기
       (4, 29),    -- 숲바닥
       (4, 20),    -- 마른낙엽
       (4, 19),    -- 돌
       (4, 26),    -- 분필
       (4, 32),    -- 염분
       (4, 18),    -- 꿀
       (4, 62),    -- 라즈베리
       (4, 61),    -- 딸기
       (4, 66),    -- 크랜베리
       (4, 63),    -- 붉은자두
       (4, 65),    -- 체리
       (4, 64),    -- 석류
       (4, 39),    -- 크림
       (4, 38),    -- 치즈
       (4, 76),    -- 바나나
       (4, 43),    -- 라벤더
       (4, 52),    -- 제비꽃
       (4, 47),    -- 인동덩굴
       (4, 53),    -- 포푸리
       (4, 45),    -- 아카시아
       (4, 58),    -- 건포도
       (4, 59),    -- 무화과
       (4, 67),    -- 토마토
       (4, 13),    -- 피망
       (4, 101),   -- 사과
       (4, 100),   -- 복숭아
       (4, 79),    -- 풍선껌
       (5, 62),    -- 라즈베리
       (5, 61),    -- 딸기
       (5, 65),    -- 체리
       (5, 64),    -- 석류
       (5, 66),    -- 크랜베리
       (5, 63),    -- 붉은자두
       (5, 1),     -- 블랙체리
       (5, 98),    -- 블루베리
       (5, 3),     -- 올리브
       (5, 4),     -- 자두
       (5, 2),     -- 오디
       (5, 103),   -- 감초
       (5, 109),   -- 후추
       (5, 6),     -- 민트
       (5, 104),   -- 계피
       (5, 8),     -- 세이지
       (5, 108),   -- 팔각
       (5, 11),    -- 유칼립투스
       (5, 83),    -- 바닐라
       (5, 82),    -- 담배
       (5, 89),    -- 초콜릿
       (5, 86),    -- 삼나무
       (5, 107),   -- 정향
       (5, 90),    -- 캐러멜
       (5, 88),    -- 에스프레소
       (5, 91),    -- 커피
       (5, 84),    -- 백단
       (5, 87),    -- 시가박스
       (5, 94),    -- 콜라
       (5, 25),    -- 버터
       (5, 92),    -- 코코넛
       (5, 80),    -- 가죽
       (5, 24),    -- 버섯
       (5, 40),    -- 타르
       (5, 29),    -- 숲바닥
       (5, 19),    -- 돌
       (5, 30),    -- 야생고기
       (5, 18),    -- 꿀
       (5, 93),    -- 코코아
       (5, 20),    -- 마른낙엽
       (5, 28),    -- 석연슬레이트
       (5, 31),    -- 연필심
       (5, 26),    -- 분필
       (5, 97),    -- 흑설탕
       (5, 9),     -- 아몬드
       (5, 85),    -- 브리오슈
       (5, 43),    -- 라벤더
       (5, 52),    -- 제비꽃
       (5, 54),    -- 히비스커스
       (5, 59),    -- 무화과
       (5, 58),    -- 건포도
       (5, 39),    -- 크림
       (5, 38),    -- 치즈
       (5, 5),     -- 구스베리
       (5, 67),    -- 토마토
       (5, 13),    -- 피망
       (5, 71),    -- 오렌지
       (5, 99),    -- 모과
       (5, 101),   -- 사과
       (5, 102),   -- 살구
       (6, 83),    -- 바닐라
       (6, 82),    -- 담배
       (6, 89),    -- 초콜릿
       (6, 94),    -- 콜라
       (6, 91),    -- 커피
       (6, 86),    -- 삼나무
       (6, 90),    -- 캐러멜
       (6, 106),   -- 육두구
       (6, 107),   -- 정향
       (6, 88),    -- 에스프레소
       (6, 1),     -- 블랙체리
       (6, 98),    -- 블루베리
       (6, 4),     -- 자두
       (6, 97),    -- 흑설탕
       (6, 80),    -- 가죽
       (6, 93),    -- 코코아
       (6, 41),    -- 화분흙
       (6, 26),    -- 분필
       (6, 40),    -- 타르
       (6, 29),    -- 숲바닥
       (6, 103),   -- 감초
       (6, 109),   -- 후추
       (6, 104),   -- 계피
       (6, 6),     -- 민트
       (6, 61),    -- 딸기
       (6, 64),    -- 석류
       (6, 65),    -- 체리
       (6, 62),    -- 라즈베리
       (6, 38),    -- 치즈
       (6, 77),    -- 키위
       (7, 65),    -- 체리
       (7, 62),    -- 라즈베리
       (7, 61),    -- 딸기
       (7, 63),    -- 붉은자두
       (7, 64),    -- 석류
       (7, 66),    -- 크랜베리
       (7, 83),    -- 바닐라
       (7, 89),    -- 초콜릿
       (7, 82),    -- 담배
       (7, 86),    -- 삼나무
       (7, 91),    -- 커피
       (7, 94),    -- 콜라
       (7, 92),    -- 코코넛
       (7, 84),    -- 백단
       (7, 90),    -- 캐러멜
       (7, 1),     -- 블랙체리
       (7, 98),    -- 블루베리
       (7, 4),     -- 자두
       (7, 97),    -- 흑설탕
       (7, 103),   -- 감초
       (7, 104),   -- 계피
       (7, 109),   -- 후추
       (7, 11),    -- 유칼립투스
       (7, 10),    -- 오레가노
       (7, 6),     -- 민트
       (7, 108),   -- 팔각
       (7, 58),    -- 건포도
       (7, 59),    -- 무화과
       (7, 80),    -- 가죽
       (7, 93),    -- 코코아
       (7, 24),    -- 버섯
       (7, 19),    -- 돌
       (7, 38),    -- 치즈
       (7, 39),    -- 크림
       (7, 67),    -- 토마토
       (7, 13),    -- 피망
       (7, 43),    -- 라벤더
       (7, 52),    -- 제비꽃
       (8, 61),    -- 딸기
       (8, 62),    -- 라즈베리
       (8, 65),    -- 체리
       (8, 66),    -- 크랜베리
       (8, 64),    -- 석류
       (8, 80),    -- 가죽
       (8, 29),    -- 숲바닥
       (8, 24),    -- 버섯
       (8, 1),     -- 블랙체리
       (8, 82),    -- 담배
       (8, 90),    -- 캐러멜
       (8, 83),    -- 바닐라
       (8, 107),   -- 정향
       (8, 6),     -- 민트
       (8, 39),    -- 크림
       (8, 54),    -- 히비스커스
       (9, 61),    -- 딸기
       (9, 62),    -- 라즈베리
       (9, 65),    -- 체리
       (9, 66),    -- 크랜베리
       (9, 63),    -- 붉은자두
       (9, 80),    -- 가죽
       (9, 40),    -- 타르
       (9, 30),    -- 야생고기
       (9, 29),    -- 숲바닥
       (9, 19),    -- 돌
       (9, 24),    -- 버섯
       (9, 18),    -- 꿀
       (9, 93),    -- 코코아
       (9, 33),    -- 절인고기
       (9, 82),    -- 담배
       (9, 83),    -- 바닐라
       (9, 86),    -- 삼나무
       (9, 89),    -- 초콜릿
       (9, 25),    -- 버터
       (9, 107),   -- 정향
       (9, 94),    -- 콜라
       (9, 91),    -- 커피
       (9, 90),    -- 캐러멜
       (9, 106),   -- 육두구
       (9, 87),    -- 시가박스
       (9, 109),   -- 후추
       (9, 103),   -- 감초
       (9, 104),   -- 계피
       (9, 11),    -- 유칼립투스
       (9, 108),   -- 팔각
       (9, 1),     -- 블랙체리
       (9, 2),     -- 오디
       (9, 3),     -- 올리브
       (9, 98),    -- 블루베리
       (9, 4),     -- 자두
       (9, 9),     -- 아몬드
       (9, 97),    -- 흑설탕
       (9, 38),    -- 치즈
       (9, 39),    -- 크림
       (9, 76),    -- 바나나
       (9, 59),    -- 무화과
       (9, 58),    -- 건포도
       (9, 52),    -- 제비꽃
       (9, 43),    -- 라벤더
       (9, 5),     -- 구스베리
       (9, 13),    -- 피망
       (9, 71),    -- 오렌지
       (9, 69),    -- 레몬
       (10, 83),   -- 바닐라
       (10, 89),   -- 초콜릿
       (10, 82),   -- 담배
       (10, 86),   -- 삼나무
       (10, 94),   -- 콜라
       (10, 90),   -- 캐러멜
       (10, 91),   -- 커피
       (10, 25),   -- 버터
       (10, 107),  -- 정향
       (10, 87),   -- 시가박스
       (10, 106),  -- 육두구
       (10, 88),   -- 에스프레소
       (10, 1),    -- 블랙체리
       (10, 98),   -- 블루베리
       (10, 4),    -- 자두
       (10, 3),    -- 올리브
       (10, 97),   -- 흑설탕
       (10, 9),    -- 아몬드
       (10, 62),   -- 라즈베리
       (10, 61),   -- 딸기
       (10, 65),   -- 체리
       (10, 66),   -- 크랜베리
       (10, 63),   -- 붉은자두
       (10, 64),   -- 석류
       (10, 109),  -- 후추
       (10, 103),  -- 감초
       (10, 104),  -- 계피
       (10, 11),   -- 유칼립투스
       (10, 6),    -- 민트
       (10, 8),    -- 세이지
       (10, 80),   -- 가죽
       (10, 93),   -- 코코아
       (10, 24),   -- 버섯
       (10, 19),   -- 돌
       (10, 18),   -- 꿀
       (10, 40),   -- 타르
       (10, 26),   -- 분필
       (10, 29),   -- 숲바닥
       (10, 28),   -- 석연슬레이트
       (10, 30),   -- 야생고기
       (10, 27),   -- 생강
       (10, 32),   -- 염분
       (10, 23),   -- 반창고
       (10, 31),   -- 연필심
       (10, 38),   -- 치즈
       (10, 39),   -- 크림
       (10, 76),   -- 바나나
       (10, 58),   -- 건포도
       (10, 59),   -- 무화과
       (10, 13),   -- 피망
       (10, 67),   -- 토마토
       (10, 52),   -- 제비꽃
       (10, 43),   -- 라벤더
       (10, 54),   -- 히비스커스
       (10, 101),  -- 사과
       (10, 102),  -- 살구
       (10, 71),   -- 오렌지
       (10, 72),   -- 자몽
       (10, 69),   -- 레몬
       (10, 78),   -- 파인애플
       (10, 77),   -- 키위
       (11, 83),   -- 바닐라
       (11, 86),   -- 삼나무
       (11, 89),   -- 초콜릿
       (11, 82),   -- 담배
       (11, 25),   -- 버터
       (11, 107),  -- 정향
       (11, 91),   -- 커피
       (11, 94),   -- 콜라
       (11, 90),   -- 캐러멜
       (11, 87),   -- 시가박스
       (11, 95),   -- 파이프담배
       (11, 106),  -- 육두구
       (11, 88),   -- 에스프레소
       (11, 92),   -- 코코넛
       (11, 1),    -- 블랙체리
       (11, 98),   -- 블루베리
       (11, 4),    -- 자두
       (11, 3),    -- 올리브
       (11, 62),   -- 라즈베리
       (11, 61),   -- 딸기
       (11, 65),   -- 체리
       (11, 63),   -- 붉은자두
       (11, 97),   -- 흑설탕
       (11, 109),  -- 후추
       (11, 103),  -- 감초
       (11, 6),    -- 민트
       (11, 11),   -- 유칼립투스
       (11, 104),  -- 계피
       (11, 14),   -- 할라피뇨
       (11, 8),    -- 세이지
       (11, 80),   -- 가죽
       (11, 93),   -- 코코아
       (11, 19),   -- 돌
       (11, 28),   -- 석연슬레이트
       (11, 29),   -- 숲바닥
       (11, 31),   -- 연필심
       (11, 18),   -- 꿀
       (11, 24),   -- 버섯
       (11, 36),   -- 젖은자갈
       (11, 26),   -- 분필
       (11, 32),   -- 염분
       (11, 30),   -- 야생고기
       (11, 27),   -- 생강
       (11, 39),   -- 크림
       (11, 38),   -- 치즈
       (11, 13),   -- 피망
       (11, 67),   -- 토마토
       (11, 59),   -- 무화과
       (11, 58),   -- 건포도
       (11, 52),   -- 제비꽃
       (11, 72),   -- 자몽
       (11, 71),   -- 오렌지
       (11, 69),   -- 레몬
       (12, 83),   -- 바닐라
       (12, 89),   -- 초콜릿
       (12, 82),   -- 담배
       (12, 86),   -- 삼나무
       (12, 91),   -- 커피
       (12, 87),   -- 시가박스
       (12, 94),   -- 콜라
       (12, 25),   -- 버터
       (12, 88),   -- 에스프레소
       (12, 90),   -- 캐러멜
       (12, 107),  -- 정향
       (12, 106),  -- 육두구
       (12, 95),   -- 파이프담배
       (12, 98),   -- 블루베리
       (12, 1),    -- 블랙체리
       (12, 4),    -- 자두
       (12, 2),    -- 오디
       (12, 3),    -- 올리브
       (12, 80),   -- 가죽
       (12, 93),   -- 코코아
       (12, 24),   -- 버섯
       (12, 19),   -- 돌
       (12, 31),   -- 연필심
       (12, 26),   -- 분필
       (12, 18),   -- 꿀
       (12, 30),   -- 야생고기
       (12, 27),   -- 생강
       (12, 28),   -- 석연슬레이트
       (12, 40),   -- 타르
       (12, 96),   -- 헤이즐넛
       (12, 97),   -- 흑설탕
       (12, 62),   -- 라즈베리
       (12, 61),   -- 딸기
       (12, 66),   -- 크랜베리
       (12, 65),   -- 체리
       (12, 63),   -- 붉은자두
       (12, 64),   -- 석류
       (12, 109),  -- 후추
       (12, 103),  -- 감초
       (12, 104),  -- 계피
       (12, 6),    -- 민트
       (12, 8),    -- 세이지
       (12, 11),   -- 유칼립투스
       (12, 14),   -- 할라피뇨
       (12, 108),  -- 팔각
       (12, 58),   -- 건포도
       (12, 59),   -- 무화과
       (12, 39),   -- 크림
       (12, 38),   -- 치즈
       (12, 76),   -- 바나나
       (12, 52),   -- 제비꽃
       (12, 43),   -- 라벤더
       (12, 47),   -- 인동덩굴
       (12, 53),   -- 포푸리
       (12, 51),   -- 제라늄
       (12, 13),   -- 피망
       (12, 101),  -- 사과
       (12, 102),  -- 살구
       (12, 71),   -- 오렌지
       (12, 75),   -- 망고
       (12, 78),   -- 파인애플
       (13, 89),   -- 초콜릿
       (13, 83),   -- 바닐라
       (13, 82),   -- 담배
       (13, 86),   -- 삼나무
       (13, 91),   -- 커피
       (13, 90),   -- 캐러멜
       (13, 94),   -- 콜라
       (13, 25),   -- 버터
       (13, 87),   -- 시가박스
       (13, 92),   -- 코코넛
       (13, 107),  -- 정향
       (13, 95),   -- 파이프담배
       (13, 98),   -- 블루베리
       (13, 1),    -- 블랙체리
       (13, 4),    -- 자두
       (13, 2),    -- 오디
       (13, 3),    -- 올리브
       (13, 80),   -- 가죽
       (13, 93),   -- 코코아
       (13, 24),   -- 버섯
       (13, 29),   -- 숲바닥
       (13, 19),   -- 돌
       (13, 26),   -- 분필
       (13, 30),   -- 야생고기
       (13, 40),   -- 타르
       (13, 32),   -- 염분
       (13, 18),   -- 꿀
       (13, 41),   -- 화분흙
       (13, 28),   -- 석연슬레이트
       (13, 9),    -- 아몬드
       (13, 109),  -- 후추
       (13, 103),  -- 감초
       (13, 104),  -- 계피
       (13, 11),   -- 유칼립투스
       (13, 6),    -- 민트
       (13, 62),   -- 라즈베리
       (13, 61),   -- 딸기
       (13, 66),   -- 크랜베리
       (13, 63),   -- 붉은자두
       (13, 64),   -- 석류
       (13, 59),   -- 무화과
       (13, 58),   -- 건포도
       (13, 60),   -- 용과
       (13, 38),   -- 치즈
       (13, 39),   -- 크림
       (13, 52),   -- 제비꽃
       (13, 43),   -- 라벤더
       (13, 54),   -- 히비스커스
       (13, 45),   -- 아카시아
       (13, 5),    -- 구스베리
       (13, 67),   -- 토마토
       (13, 101),  -- 사과
       (13, 102),  -- 살구
       (14, 83),   -- 바닐라
       (14, 89),   -- 초콜릿
       (14, 82),   -- 담배
       (14, 86),   -- 삼나무
       (14, 107),  -- 정향
       (14, 91),   -- 커피
       (14, 106),  -- 육두구
       (14, 25),   -- 버터
       (14, 94),   -- 콜라
       (14, 90),   -- 캐러멜
       (14, 87),   -- 시가박스
       (14, 84),   -- 백단
       (14, 92),   -- 코코넛
       (14, 95),   -- 파이프담배
       (14, 1),    -- 블랙체리
       (14, 98),   -- 블루베리
       (14, 4),    -- 자두
       (14, 3),    -- 올리브
       (14, 2),    -- 오디
       (14, 109),  -- 후추
       (14, 103),  -- 감초
       (14, 104),  -- 계피
       (14, 11),   -- 유칼립투스
       (14, 8),    -- 세이지
       (14, 62),   -- 라즈베리
       (14, 61),   -- 딸기
       (14, 66),   -- 크랜베리
       (14, 65),   -- 체리
       (14, 64),   -- 석류
       (14, 63),   -- 붉은자두
       (14, 9),    -- 아몬드
       (14, 97),   -- 흑설탕
       (14, 80),   -- 가죽
       (14, 93),   -- 코코아
       (14, 24),   -- 버섯
       (14, 31),   -- 연필심
       (14, 18),   -- 꿀
       (14, 28),   -- 석연슬레이트
       (14, 32),   -- 염분
       (14, 40),   -- 타르
       (14, 19),   -- 돌
       (14, 33),   -- 절인고기
       (14, 30),   -- 야생고기
       (14, 42),   -- 훈제육
       (14, 29),   -- 숲바닥
       (14, 59),   -- 무화과
       (14, 58),   -- 건포도
       (14, 38),   -- 치즈
       (14, 39),   -- 크림
       (14, 52),   -- 제비꽃
       (14, 43),   -- 라벤더
       (14, 13),   -- 피망
       (14, 67),   -- 토마토
       (14, 101),  -- 사과
       (14, 99),   -- 모과
       (14, 100),  -- 복숭아
       (14, 102),  -- 살구
       (15, 61),   -- 딸기
       (15, 62),   -- 라즈베리
       (15, 66),   -- 크랜베리
       (15, 65),   -- 체리
       (15, 64),   -- 석류
       (15, 63),   -- 붉은자두
       (15, 83),   -- 바닐라
       (15, 94),   -- 콜라
       (15, 82),   -- 담배
       (15, 89),   -- 초콜릿
       (15, 107),  -- 정향
       (15, 90),   -- 캐러멜
       (15, 91),   -- 커피
       (15, 86),   -- 삼나무
       (15, 25),   -- 버터
       (15, 106),  -- 육두구
       (15, 87),   -- 시가박스
       (15, 95),   -- 파이프담배
       (15, 85),   -- 브리오슈
       (15, 9),    -- 아몬드
       (15, 97),   -- 흑설탕
       (15, 109),  -- 후추
       (15, 103),  -- 감초
       (15, 104),  -- 계피
       (15, 8),    -- 세이지
       (15, 11),   -- 유칼립투스
       (15, 6),    -- 민트
       (15, 108),  -- 팔각
       (15, 10),   -- 오레가노
       (15, 80),   -- 가죽
       (15, 24),   -- 버섯
       (15, 93),   -- 코코아
       (15, 29),   -- 숲바닥
       (15, 40),   -- 타르
       (15, 30),   -- 야생고기
       (15, 28),   -- 석연슬레이트
       (15, 19),   -- 돌
       (15, 20),   -- 마른낙엽
       (15, 42),   -- 훈제육
       (15, 26),   -- 분필
       (15, 41),   -- 화분흙
       (15, 1),    -- 블랙체리
       (15, 98),   -- 블루베리
       (15, 4),    -- 자두
       (15, 2),    -- 오디
       (15, 39),   -- 크림
       (15, 38),   -- 치즈
       (15, 76),   -- 바나나
       (15, 59),   -- 무화과
       (15, 58),   -- 건포도
       (15, 52),   -- 제비꽃
       (15, 48),   -- 자스민
       (15, 53),   -- 포푸리
       (15, 43),   -- 라벤더
       (15, 47),   -- 인동덩굴
       (15, 13),   -- 피망
       (15, 70),   -- 마멀레이드
       (15, 55),   -- 라임
       (15, 69),   -- 레몬
       (15, 101),  -- 사과
       (15, 102),  -- 살구
       (15, 57),   -- 청배
       (15, 100),  -- 복숭아
       (15, 79),   -- 풍선껌
       (15, 73),   -- 구아바
       (16, 98),   -- 블루베리
       (16, 1),    -- 블랙체리
       (16, 4),    -- 자두
       (16, 2),    -- 오디
       (16, 83),   -- 바닐라
       (16, 89),   -- 초콜릿
       (16, 82),   -- 담배
       (16, 86),   -- 삼나무
       (16, 107),  -- 정향
       (16, 91),   -- 커피
       (16, 25),   -- 버터
       (16, 90),   -- 캐러멜
       (16, 94),   -- 콜라
       (16, 88),   -- 에스프레소
       (16, 106),  -- 육두구
       (16, 87),   -- 시가박스
       (16, 84),   -- 백단
       (16, 95),   -- 파이프담배
       (16, 97),   -- 흑설탕
       (16, 9),    -- 아몬드
       (16, 85),   -- 브리오슈
       (16, 96),   -- 헤이즐넛
       (16, 109),  -- 후추
       (16, 103),  -- 감초
       (16, 104),  -- 계피
       (16, 11),   -- 유칼립투스
       (16, 8),    -- 세이지
       (16, 6),    -- 민트
       (16, 10),   -- 오레가노
       (16, 108),  -- 팔각
       (16, 14),   -- 할라피뇨
       (16, 62),   -- 라즈베리
       (16, 61),   -- 딸기
       (16, 66),   -- 크랜베리
       (16, 64),   -- 석류
       (16, 65),   -- 체리
       (16, 63),   -- 붉은자두
       (16, 80),   -- 가죽
       (16, 93),   -- 코코아
       (16, 29),   -- 숲바닥
       (16, 19),   -- 돌
       (16, 18),   -- 꿀
       (16, 40),   -- 타르
       (16, 24),   -- 버섯
       (16, 30),   -- 야생고기
       (16, 28),   -- 석연슬레이트
       (16, 32),   -- 염분
       (16, 26),   -- 분필
       (16, 31),   -- 연필심
       (16, 42),   -- 훈제육
       (16, 33),   -- 절인고기
       (16, 27),   -- 생강
       (16, 59),   -- 무화과
       (16, 58),   -- 건포도
       (16, 39),   -- 크림
       (16, 38),   -- 치즈
       (16, 76),   -- 바나나
       (16, 52),   -- 제비꽃
       (16, 43),   -- 라벤더
       (16, 53),   -- 포푸리
       (16, 47),   -- 인동덩굴
       (16, 54),   -- 히비스커스
       (16, 46),   -- 오렌지꽃
       (16, 45),   -- 아카시아
       (16, 67),   -- 토마토
       (16, 13),   -- 피망
       (16, 101),  -- 사과
       (16, 102),  -- 살구
       (16, 57),   -- 청배
       (16, 100),  -- 복숭아
       (16, 70),   -- 마멀레이드
       (16, 71),   -- 오렌지
       (16, 69),   -- 레몬
       (16, 72),   -- 자몽
       (16, 79),   -- 풍선껌
       (17, 62),   -- 라즈베리
       (17, 66),   -- 크랜베리
       (17, 65),   -- 체리
       (17, 80),   -- 가죽
       (17, 106),  -- 육두구
       (17, 89),   -- 초콜릿
       (17, 86),   -- 삼나무
       (17, 25),   -- 버터
       (17, 83),   -- 바닐라
       (17, 82),   -- 담배
       (17, 2),    -- 오디
       (17, 103),  -- 감초
       (17, 8),    -- 세이지
       (17, 109),  -- 후추
       (17, 43),   -- 라벤더
       (17, 52),   -- 제비꽃
       (17, 68),   -- 귤
       (18, 83),   -- 바닐라
       (18, 82),   -- 담배
       (18, 89),   -- 초콜릿
       (18, 91),   -- 커피
       (18, 86),   -- 삼나무
       (18, 107),  -- 정향
       (18, 94),   -- 콜라
       (18, 25),   -- 버터
       (18, 106),  -- 육두구
       (18, 90),   -- 캐러멜
       (18, 84),   -- 백단
       (18, 95),   -- 파이프담배
       (18, 87),   -- 시가박스
       (18, 1),    -- 블랙체리
       (18, 98),   -- 블루베리
       (18, 4),    -- 자두
       (18, 97),   -- 흑설탕
       (18, 109),  -- 후추
       (18, 103),  -- 감초
       (18, 104),  -- 계피
       (18, 8),    -- 세이지
       (18, 11),   -- 유칼립투스
       (18, 6),    -- 민트
       (18, 14),   -- 할라피뇨
       (18, 62),   -- 라즈베리
       (18, 61),   -- 딸기
       (18, 66),   -- 크랜베리
       (18, 65),   -- 체리
       (18, 63),   -- 붉은자두
       (18, 80),   -- 가죽
       (18, 93),   -- 코코아
       (18, 18),   -- 꿀
       (18, 19),   -- 돌
       (18, 29),   -- 숲바닥
       (18, 24),   -- 버섯
       (18, 27),   -- 생강
       (18, 28),   -- 석연슬레이트
       (18, 26),   -- 분필
       (18, 30),   -- 야생고기
       (18, 59),   -- 무화과
       (18, 58),   -- 건포도
       (18, 39),   -- 크림
       (18, 38),   -- 치즈
       (18, 52),   -- 제비꽃
       (18, 67),   -- 토마토
       (18, 101),  -- 사과
       (18, 57),   -- 청배
       (18, 102),  -- 살구
       (18, 71),   -- 오렌지
       (18, 68),   -- 귤
       (18, 78),   -- 파인애플
       (19, 86),   -- 삼나무
       (19, 89),   -- 초콜릿
       (19, 82),   -- 담배
       (19, 83),   -- 바닐라
       (19, 94),   -- 콜라
       (19, 62),   -- 라즈베리
       (19, 61),   -- 딸기
       (19, 80),   -- 가죽
       (19, 93),   -- 코코아
       (19, 24),   -- 버섯
       (19, 29),   -- 숲바닥
       (19, 103),  -- 감초
       (19, 109),  -- 후추
       (19, 6),    -- 민트
       (19, 10),   -- 오레가노
       (19, 1),    -- 블랙체리
       (19, 98),   -- 블루베리
       (19, 71),   -- 오렌지
       (19, 101),  -- 사과
       (19, 75),   -- 망고
       (19, 78),   -- 파인애플
       (19, 52),   -- 제비꽃
       (20, 83),   -- 바닐라
       (20, 89),   -- 초콜릿
       (20, 86),   -- 삼나무
       (20, 82),   -- 담배
       (20, 90),   -- 캐러멜
       (20, 1),    -- 블랙체리
       (20, 80),   -- 가죽
       (20, 93),   -- 코코아
       (20, 61),   -- 딸기
       (20, 62),   -- 라즈베리
       (20, 103),  -- 감초
       (20, 11),   -- 유칼립투스
       (20, 6),    -- 민트
       (20, 109),  -- 후추
       (20, 39),   -- 크림
       (20, 52),   -- 제비꽃
       (21, 82),   -- 담배
       (21, 89),   -- 초콜릿
       (21, 83),   -- 바닐라
       (21, 86),   -- 삼나무
       (21, 91),   -- 커피
       (21, 107),  -- 정향
       (21, 106),  -- 육두구
       (21, 90),   -- 캐러멜
       (21, 87),   -- 시가박스
       (21, 94),   -- 콜라
       (21, 25),   -- 버터
       (21, 84),   -- 백단
       (21, 88),   -- 에스프레소
       (21, 1),    -- 블랙체리
       (21, 98),   -- 블루베리
       (21, 3),    -- 올리브
       (21, 4),    -- 자두
       (21, 2),    -- 오디
       (21, 80),   -- 가죽
       (21, 29),   -- 숲바닥
       (21, 24),   -- 버섯
       (21, 40),   -- 타르
       (21, 30),   -- 야생고기
       (21, 19),   -- 돌
       (21, 33),   -- 절인고기
       (21, 93),   -- 코코아
       (21, 18),   -- 꿀
       (21, 31),   -- 연필심
       (21, 41),   -- 화분흙
       (21, 20),   -- 마른낙엽
       (21, 26),   -- 분필
       (21, 32),   -- 염분
       (21, 109),  -- 후추
       (21, 103),  -- 감초
       (21, 104),  -- 계피
       (21, 6),    -- 민트
       (21, 11),   -- 유칼립투스
       (21, 8),    -- 세이지
       (21, 108),  -- 팔각
       (21, 10),   -- 오레가노
       (21, 97),   -- 흑설탕
       (21, 96),   -- 헤이즐넛
       (21, 62),   -- 라즈베리
       (21, 65),   -- 체리
       (21, 61),   -- 딸기
       (21, 63),   -- 붉은자두
       (21, 66),   -- 크랜베리
       (21, 64),   -- 석류
       (21, 39),   -- 크림
       (21, 38),   -- 치즈
       (21, 52),   -- 제비꽃
       (21, 43),   -- 라벤더
       (21, 49),   -- 작약
       (21, 44),   -- 백합
       (21, 58),   -- 건포도
       (21, 59),   -- 무화과
       (21, 67),   -- 토마토
       (21, 5),    -- 구스베리
       (21, 13),   -- 피망
       (21, 71),   -- 오렌지
       (21, 70),   -- 마멀레이드
       (21, 101),  -- 사과
       (21, 102),  -- 살구
       (22, 80),   -- 가죽
       (22, 24),   -- 버섯
       (22, 29),   -- 숲바닥
       (22, 19),   -- 돌
       (22, 33),   -- 절인고기
       (22, 31),   -- 연필심
       (22, 40),   -- 타르
       (22, 28),   -- 석연슬레이트
       (22, 93),   -- 코코아
       (22, 82),   -- 담배
       (22, 83),   -- 바닐라
       (22, 86),   -- 삼나무
       (22, 89),   -- 초콜릿
       (22, 87),   -- 시가박스
       (22, 91),   -- 커피
       (22, 25),   -- 버터
       (22, 106),  -- 육두구
       (22, 1),    -- 블랙체리
       (22, 98),   -- 블루베리
       (22, 4),    -- 자두
       (22, 2),    -- 오디
       (22, 3),    -- 올리브
       (22, 62),   -- 라즈베리
       (22, 61),   -- 딸기
       (22, 66),   -- 크랜베리
       (22, 65),   -- 체리
       (22, 109),  -- 후추
       (22, 6),    -- 민트
       (22, 103),  -- 감초
       (22, 104),  -- 계피
       (22, 8),    -- 세이지
       (22, 11),   -- 유칼립투스
       (22, 39),   -- 크림
       (22, 38),   -- 치즈
       (22, 13),   -- 피망
       (22, 67),   -- 토마토
       (22, 58),   -- 건포도
       (22, 59),   -- 무화과
       (22, 52),   -- 제비꽃
       (22, 101),  -- 사과
       (23, 62),   -- 라즈베리
       (23, 65),   -- 체리
       (23, 61),   -- 딸기
       (23, 80),   -- 가죽
       (23, 59),   -- 무화과
       (23, 103),  -- 감초
       (23, 109),  -- 후추
       (23, 89),   -- 초콜릿
       (23, 82),   -- 담배
       (24, 83),   -- 바닐라
       (24, 89),   -- 초콜릿
       (24, 82),   -- 담배
       (24, 91),   -- 커피
       (24, 107),  -- 정향
       (24, 86),   -- 삼나무
       (24, 90),   -- 캐러멜
       (24, 106),  -- 육두구
       (24, 88),   -- 에스프레소
       (24, 94),   -- 콜라
       (24, 62),   -- 라즈베리
       (24, 61),   -- 딸기
       (24, 65),   -- 체리
       (24, 66),   -- 크랜베리
       (24, 64),   -- 석류
       (24, 80),   -- 가죽
       (24, 24),   -- 버섯
       (24, 19),   -- 돌
       (24, 29),   -- 숲바닥
       (24, 20),   -- 마른낙엽
       (24, 93),   -- 코코아
       (24, 18),   -- 꿀
       (24, 40),   -- 타르
       (24, 9),    -- 아몬드
       (24, 109),  -- 후추
       (24, 104),  -- 계피
       (24, 103),  -- 감초
       (24, 6),    -- 민트
       (24, 11),   -- 유칼립투스
       (24, 10),   -- 오레가노
       (24, 98),   -- 블루베리
       (24, 1),    -- 블랙체리
       (24, 4),    -- 자두
       (24, 38),   -- 치즈
       (24, 67),   -- 토마토
       (24, 71),   -- 오렌지
       (24, 70),   -- 마멀레이드
       (24, 69),   -- 레몬
       (24, 43),   -- 라벤더
       (24, 58),   -- 건포도
       (24, 101),  -- 사과
       (25, 93),   -- 코코아
       (25, 91),   -- 커피
       (25, 98),   -- 블루베리
       (26, 98),   -- 블루베리
       (26, 1),    -- 블랙체리
       (26, 4),    -- 자두
       (26, 83),   -- 바닐라
       (26, 89),   -- 초콜릿
       (26, 82),   -- 담배
       (26, 86),   -- 삼나무
       (26, 90),   -- 캐러멜
       (26, 91),   -- 커피
       (26, 88),   -- 에스프레소
       (26, 87),   -- 시가박스
       (26, 106),  -- 육두구
       (26, 25),   -- 버터
       (26, 84),   -- 백단
       (26, 92),   -- 코코넛
       (26, 80),   -- 가죽
       (26, 93),   -- 코코아
       (26, 40),   -- 타르
       (26, 24),   -- 버섯
       (26, 28),   -- 석연슬레이트
       (26, 18),   -- 꿀
       (26, 109),  -- 후추
       (26, 103),  -- 감초
       (26, 11),   -- 유칼립투스
       (26, 104),  -- 계피
       (26, 6),    -- 민트
       (26, 8),    -- 세이지
       (26, 62),   -- 라즈베리
       (26, 61),   -- 딸기
       (26, 63),   -- 붉은자두
       (26, 65),   -- 체리
       (26, 64),   -- 석류
       (26, 39),   -- 크림
       (26, 38),   -- 치즈
       (26, 58),   -- 건포도
       (26, 59),   -- 무화과
       (26, 52),   -- 제비꽃
       (26, 43),   -- 라벤더
       (27, 83),   -- 바닐라
       (27, 89),   -- 초콜릿
       (27, 82),   -- 담배
       (27, 86),   -- 삼나무
       (27, 91),   -- 커피
       (27, 87),   -- 시가박스
       (27, 88),   -- 에스프레소
       (27, 107),  -- 정향
       (27, 90),   -- 캐러멜
       (27, 25),   -- 버터
       (27, 106),  -- 육두구
       (27, 84),   -- 백단
       (27, 92),   -- 코코넛
       (27, 95),   -- 파이프담배
       (27, 94),   -- 콜라
       (27, 98),   -- 블루베리
       (27, 1),    -- 블랙체리
       (27, 4),    -- 자두
       (27, 2),    -- 오디
       (27, 3),    -- 올리브
       (27, 96),   -- 헤이즐넛
       (27, 9),    -- 아몬드
       (27, 80),   -- 가죽
       (27, 93),   -- 코코아
       (27, 40),   -- 타르
       (27, 24),   -- 버섯
       (27, 31),   -- 연필심
       (27, 29),   -- 숲바닥
       (27, 19),   -- 돌
       (27, 26),   -- 분필
       (27, 28),   -- 석연슬레이트
       (27, 30),   -- 야생고기
       (27, 18),   -- 꿀
       (27, 20),   -- 마른낙엽
       (27, 103),  -- 감초
       (27, 109),  -- 후추
       (27, 6),    -- 민트
       (27, 11),   -- 유칼립투스
       (27, 104),  -- 계피
       (27, 8),    -- 세이지
       (27, 10),   -- 오레가노
       (27, 62),   -- 라즈베리
       (27, 66),   -- 크랜베리
       (27, 61),   -- 딸기
       (27, 65),   -- 체리
       (27, 63),   -- 붉은자두
       (27, 39),   -- 크림
       (27, 38),   -- 치즈
       (27, 76),   -- 바나나
       (27, 52),   -- 제비꽃
       (27, 43),   -- 라벤더
       (27, 48),   -- 자스민
       (27, 45),   -- 아카시아
       (27, 53),   -- 포푸리
       (27, 58),   -- 건포도
       (27, 59),   -- 무화과
       (27, 13),   -- 피망
       (27, 67),   -- 토마토
       (27, 68),   -- 귤
       (27, 101),  -- 사과
       (28, 83),   -- 바닐라
       (28, 89),   -- 초콜릿
       (28, 82),   -- 담배
       (28, 86),   -- 삼나무
       (28, 91),   -- 커피
       (28, 90),   -- 캐러멜
       (28, 25),   -- 버터
       (28, 87),   -- 시가박스
       (28, 88),   -- 에스프레소
       (28, 107),  -- 정향
       (28, 106),  -- 육두구
       (28, 94),   -- 콜라
       (28, 92),   -- 코코넛
       (28, 84),   -- 백단
       (28, 95),   -- 파이프담배
       (28, 98),   -- 블루베리
       (28, 1),    -- 블랙체리
       (28, 4),    -- 자두
       (28, 3),    -- 올리브
       (28, 2),    -- 오디
       (28, 97),   -- 흑설탕
       (28, 9),    -- 아몬드
       (28, 96),   -- 헤이즐넛
       (28, 103),  -- 감초
       (28, 109),  -- 후추
       (28, 104),  -- 계피
       (28, 11),   -- 유칼립투스
       (28, 6),    -- 민트
       (28, 8),    -- 세이지
       (28, 108),  -- 팔각
       (28, 10),   -- 오레가노
       (28, 80),   -- 가죽
       (28, 93),   -- 코코아
       (28, 24),   -- 버섯
       (28, 29),   -- 숲바닥
       (28, 18),   -- 꿀
       (28, 40),   -- 타르
       (28, 30),   -- 야생고기
       (28, 19),   -- 돌
       (28, 31),   -- 연필심
       (28, 28),   -- 석연슬레이트
       (28, 20),   -- 마른낙엽
       (28, 26),   -- 분필
       (28, 27),   -- 생강
       (28, 36),   -- 젖은자갈
       (28, 62),   -- 라즈베리
       (28, 61),   -- 딸기
       (28, 65),   -- 체리
       (28, 66),   -- 크랜베리
       (28, 64),   -- 석류
       (28, 63),   -- 붉은자두
       (28, 39),   -- 크림
       (28, 38),   -- 치즈
       (28, 76),   -- 바나나
       (28, 58),   -- 건포도
       (28, 59),   -- 무화과
       (28, 52),   -- 제비꽃
       (28, 43),   -- 라벤더
       (28, 47),   -- 인동덩굴
       (28, 53),   -- 포푸리
       (28, 44),   -- 백합
       (28, 67),   -- 토마토
       (28, 13),   -- 피망
       (28, 5),    -- 구스베리
       (28, 102),  -- 살구
       (28, 101),  -- 사과
       (28, 100),  -- 복숭아
       (28, 57),   -- 청배
       (28, 69),   -- 레몬
       (28, 70),   -- 마멀레이드
       (28, 55),   -- 라임
       (28, 71),   -- 오렌지
       (28, 79),   -- 풍선껌
       (28, 75),   -- 망고
       (28, 78),   -- 파인애플
       (29, 83),   -- 바닐라
       (29, 89),   -- 초콜릿
       (29, 82),   -- 담배
       (29, 86),   -- 삼나무
       (29, 90),   -- 캐러멜
       (29, 91),   -- 커피
       (29, 87),   -- 시가박스
       (29, 88),   -- 에스프레소
       (29, 94),   -- 콜라
       (29, 92),   -- 코코넛
       (29, 106),  -- 육두구
       (29, 107),  -- 정향
       (29, 98),   -- 블루베리
       (29, 1),    -- 블랙체리
       (29, 3),    -- 올리브
       (29, 80),   -- 가죽
       (29, 93),   -- 코코아
       (29, 28),   -- 석연슬레이트
       (29, 24),   -- 버섯
       (29, 29),   -- 숲바닥
       (29, 31),   -- 연필심
       (29, 18),   -- 꿀
       (29, 19),   -- 돌
       (29, 27),   -- 생강
       (29, 40),   -- 타르
       (29, 97),   -- 흑설탕
       (29, 103),  -- 감초
       (29, 109),  -- 후추
       (29, 104),  -- 계피
       (29, 6),    -- 민트
       (29, 8),    -- 세이지
       (29, 105),  -- 붉은고추
       (29, 62),   -- 라즈베리
       (29, 61),   -- 딸기
       (29, 66),   -- 크랜베리
       (29, 39),   -- 크림
       (29, 38),   -- 치즈
       (29, 59),   -- 무화과
       (29, 48),   -- 자스민
       (29, 43),   -- 라벤더
       (29, 52),   -- 제비꽃
       (29, 13),   -- 피망
       (30, 83),   -- 바닐라
       (30, 82),   -- 담배
       (30, 89),   -- 초콜릿
       (30, 86),   -- 삼나무
       (30, 88),   -- 에스프레소
       (30, 91),   -- 커피
       (30, 87),   -- 시가박스
       (30, 80),   -- 가죽
       (30, 40),   -- 타르
       (30, 18),   -- 꿀
       (30, 29),   -- 숲바닥
       (30, 93),   -- 코코아
       (30, 62),   -- 라즈베리
       (30, 61),   -- 딸기
       (30, 65),   -- 체리
       (30, 66),   -- 크랜베리
       (30, 63),   -- 붉은자두
       (30, 103),  -- 감초
       (30, 6),    -- 민트
       (30, 8),    -- 세이지
       (30, 104),  -- 계피
       (30, 1),    -- 블랙체리
       (30, 52),   -- 제비꽃
       (30, 38),   -- 치즈
       (30, 58),   -- 건포도
       (30, 68),   -- 귤
       (31, 62),   -- 라즈베리
       (31, 83),   -- 바닐라
       (32, 83),   -- 바닐라
       (32, 89),   -- 초콜릿
       (32, 82),   -- 담배
       (32, 86),   -- 삼나무
       (32, 25),   -- 버터
       (32, 91),   -- 커피
       (32, 90),   -- 캐러멜
       (32, 107),  -- 정향
       (32, 94),   -- 콜라
       (32, 106),  -- 육두구
       (32, 87),   -- 시가박스
       (32, 88),   -- 에스프레소
       (32, 92),   -- 코코넛
       (32, 95),   -- 파이프담배
       (32, 84),   -- 백단
       (32, 1),    -- 블랙체리
       (32, 98),   -- 블루베리
       (32, 4),    -- 자두
       (32, 2),    -- 오디
       (32, 3),    -- 올리브
       (32, 97),   -- 흑설탕
       (32, 9),    -- 아몬드
       (32, 96),   -- 헤이즐넛
       (32, 85),   -- 브리오슈
       (32, 109),  -- 후추
       (32, 103),  -- 감초
       (32, 104),  -- 계피
       (32, 6),    -- 민트
       (32, 11),   -- 유칼립투스
       (32, 8),    -- 세이지
       (32, 108),  -- 팔각
       (32, 10),   -- 오레가노
       (32, 14),   -- 할라피뇨
       (32, 62),   -- 라즈베리
       (32, 61),   -- 딸기
       (32, 66),   -- 크랜베리
       (32, 65),   -- 체리
       (32, 64),   -- 석류
       (32, 63),   -- 붉은자두
       (32, 80),   -- 가죽
       (32, 93),   -- 코코아
       (32, 24),   -- 버섯
       (32, 19),   -- 돌
       (32, 18),   -- 꿀
       (32, 30),   -- 야생고기
       (32, 29),   -- 숲바닥
       (32, 40),   -- 타르
       (32, 31),   -- 연필심
       (32, 26),   -- 분필
       (32, 28),   -- 석연슬레이트
       (32, 32),   -- 염분
       (32, 42),   -- 훈제육
       (32, 20),   -- 마른낙엽
       (32, 27),   -- 생강
       (32, 23),   -- 반창고
       (32, 39),   -- 크림
       (32, 38),   -- 치즈
       (32, 76),   -- 바나나
       (32, 58),   -- 건포도
       (32, 59),   -- 무화과
       (32, 60),   -- 용과
       (32, 52),   -- 제비꽃
       (32, 43),   -- 라벤더
       (32, 48),   -- 자스민
       (32, 44),   -- 백합
       (32, 54),   -- 히비스커스
       (32, 53),   -- 포푸리
       (32, 46),   -- 오렌지꽃
       (32, 13),   -- 피망
       (32, 67),   -- 토마토
       (32, 101),  -- 사과
       (32, 102),  -- 살구
       (32, 100),  -- 복숭아
       (32, 57),   -- 청배
       (32, 99),   -- 모과
       (32, 71),   -- 오렌지
       (32, 69),   -- 레몬
       (32, 70),   -- 마멀레이드
       (32, 68),   -- 귤
       (32, 72),   -- 자몽
       (32, 55),   -- 라임
       (32, 75),   -- 망고
       (32, 73),   -- 구아바
       (32, 79),   -- 풍선껌
       (32, 78),   -- 파인애플
       (32, 77),   -- 키위
       (32, 74),   -- 리치
       (33, 83),   -- 바닐라
       (33, 89),   -- 초콜릿
       (33, 82),   -- 담배
       (33, 86),   -- 삼나무
       (33, 91),   -- 커피
       (33, 90),   -- 캐러멜
       (33, 25),   -- 버터
       (33, 87),   -- 시가박스
       (33, 107),  -- 정향
       (33, 88),   -- 에스프레소
       (33, 94),   -- 콜라
       (33, 92),   -- 코코넛
       (33, 106),  -- 육두구
       (33, 95),   -- 파이프담배
       (33, 1),    -- 블랙체리
       (33, 98),   -- 블루베리
       (33, 4),    -- 자두
       (33, 2),    -- 오디
       (33, 3),    -- 올리브
       (33, 96),   -- 헤이즐넛
       (33, 97),   -- 흑설탕
       (33, 9),    -- 아몬드
       (33, 80),   -- 가죽
       (33, 93),   -- 코코아
       (33, 40),   -- 타르
       (33, 24),   -- 버섯
       (33, 31),   -- 연필심
       (33, 29),   -- 숲바닥
       (33, 19),   -- 돌
       (33, 26),   -- 분필
       (33, 30),   -- 야생고기
       (33, 28),   -- 석연슬레이트
       (33, 18),   -- 꿀
       (33, 36),   -- 젖은자갈
       (33, 33),   -- 절인고기
       (33, 32),   -- 염분
       (33, 42),   -- 훈제육
       (33, 109),  -- 후추
       (33, 103),  -- 감초
       (33, 104),  -- 계피
       (33, 11),   -- 유칼립투스
       (33, 6),    -- 민트
       (33, 8),    -- 세이지
       (33, 108),  -- 팔각
       (33, 62),   -- 라즈베리
       (33, 61),   -- 딸기
       (33, 66),   -- 크랜베리
       (33, 65),   -- 체리
       (33, 64),   -- 석류
       (33, 39),   -- 크림
       (33, 38),   -- 치즈
       (33, 76),   -- 바나나
       (33, 52),   -- 제비꽃
       (33, 43),   -- 라벤더
       (33, 53),   -- 포푸리
       (33, 48),   -- 자스민
       (33, 54),   -- 히비스커스
       (33, 59),   -- 무화과
       (33, 58),   -- 건포도
       (33, 13),   -- 피망
       (33, 72),   -- 자몽
       (33, 71),   -- 오렌지
       (33, 101),  -- 사과
       (33, 102),  -- 살구
       (34, 80),   -- 가죽
       (34, 40),   -- 타르
       (34, 24),   -- 버섯
       (34, 93),   -- 코코아
       (34, 29),   -- 숲바닥
       (34, 30),   -- 야생고기
       (34, 18),   -- 꿀
       (34, 19),   -- 돌
       (34, 31),   -- 연필심
       (34, 26),   -- 분필
       (34, 82),   -- 담배
       (34, 91),   -- 커피
       (34, 89),   -- 초콜릿
       (34, 86),   -- 삼나무
       (34, 83),   -- 바닐라
       (34, 107),  -- 정향
       (34, 87),   -- 시가박스
       (34, 90),   -- 캐러멜
       (34, 94),   -- 콜라
       (34, 88),   -- 에스프레소
       (34, 84),   -- 백단
       (34, 106),  -- 육두구
       (34, 1),    -- 블랙체리
       (34, 98),   -- 블루베리
       (34, 3),    -- 올리브
       (34, 4),    -- 자두
       (34, 62),   -- 라즈베리
       (34, 65),   -- 체리
       (34, 61),   -- 딸기
       (34, 66),   -- 크랜베리
       (34, 63),   -- 붉은자두
       (34, 103),  -- 감초
       (34, 109),  -- 후추
       (34, 6),    -- 민트
       (34, 11),   -- 유칼립투스
       (34, 10),   -- 오레가노
       (34, 104),  -- 계피
       (34, 39),   -- 크림
       (34, 38),   -- 치즈
       (34, 52),   -- 제비꽃
       (34, 43),   -- 라벤더
       (34, 53),   -- 포푸리
       (34, 67),   -- 토마토
       (34, 13),   -- 피망
       (34, 59),   -- 무화과
       (34, 71),   -- 오렌지
       (34, 69),   -- 레몬
       (34, 101),  -- 사과
       (35, 98),   -- 블루베리
       (35, 1),    -- 블랙체리
       (35, 4),    -- 자두
       (35, 2),    -- 오디
       (35, 3),    -- 올리브
       (35, 83),   -- 바닐라
       (35, 89),   -- 초콜릿
       (35, 82),   -- 담배
       (35, 91),   -- 커피
       (35, 86),   -- 삼나무
       (35, 107),  -- 정향
       (35, 88),   -- 에스프레소
       (35, 90),   -- 캐러멜
       (35, 25),   -- 버터
       (35, 94),   -- 콜라
       (35, 106),  -- 육두구
       (35, 84),   -- 백단
       (35, 87),   -- 시가박스
       (35, 92),   -- 코코넛
       (35, 95),   -- 파이프담배
       (35, 97),   -- 흑설탕
       (35, 9),    -- 아몬드
       (35, 85),   -- 브리오슈
       (35, 80),   -- 가죽
       (35, 93),   -- 코코아
       (35, 29),   -- 숲바닥
       (35, 24),   -- 버섯
       (35, 19),   -- 돌
       (35, 30),   -- 야생고기
       (35, 18),   -- 꿀
       (35, 40),   -- 타르
       (35, 32),   -- 염분
       (35, 33),   -- 절인고기
       (35, 23),   -- 반창고
       (35, 41),   -- 화분흙
       (35, 26),   -- 분필
       (35, 27),   -- 생강
       (35, 42),   -- 훈제육
       (35, 31),   -- 연필심
       (35, 28),   -- 석연슬레이트
       (35, 20),   -- 마른낙엽
       (35, 109),  -- 후추
       (35, 103),  -- 감초
       (35, 104),  -- 계피
       (35, 6),    -- 민트
       (35, 11),   -- 유칼립투스
       (35, 8),    -- 세이지
       (35, 14),   -- 할라피뇨
       (35, 10),   -- 오레가노
       (35, 62),   -- 라즈베리
       (35, 61),   -- 딸기
       (35, 66),   -- 크랜베리
       (35, 65),   -- 체리
       (35, 63),   -- 붉은자두
       (35, 64),   -- 석류
       (35, 59),   -- 무화과
       (35, 58),   -- 건포도
       (35, 39),   -- 크림
       (35, 38),   -- 치즈
       (35, 76),   -- 바나나
       (35, 52),   -- 제비꽃
       (35, 43),   -- 라벤더
       (35, 53),   -- 포푸리
       (35, 45),   -- 아카시아
       (35, 13),   -- 피망
       (35, 67),   -- 토마토
       (35, 71),   -- 오렌지
       (35, 69),   -- 레몬
       (35, 55),   -- 라임
       (35, 101),  -- 사과
       (35, 100),  -- 복숭아
       (35, 75),   -- 망고
       (35, 73),   -- 구아바
       (36, 83),   -- 바닐라
       (36, 89),   -- 초콜릿
       (36, 82),   -- 담배
       (36, 91),   -- 커피
       (36, 90),   -- 캐러멜
       (36, 86),   -- 삼나무
       (36, 107),  -- 정향
       (36, 25),   -- 버터
       (36, 94),   -- 콜라
       (36, 106),  -- 육두구
       (36, 88),   -- 에스프레소
       (36, 87),   -- 시가박스
       (36, 92),   -- 코코넛
       (36, 95),   -- 파이프담배
       (36, 84),   -- 백단
       (36, 1),    -- 블랙체리
       (36, 98),   -- 블루베리
       (36, 4),    -- 자두
       (36, 2),    -- 오디
       (36, 3),    -- 올리브
       (36, 97),   -- 흑설탕
       (36, 9),    -- 아몬드
       (36, 85),   -- 브리오슈
       (36, 96),   -- 헤이즐넛
       (36, 109),  -- 후추
       (36, 103),  -- 감초
       (36, 104),  -- 계피
       (36, 6),    -- 민트
       (36, 11),   -- 유칼립투스
       (36, 8),    -- 세이지
       (36, 10),   -- 오레가노
       (36, 108),  -- 팔각
       (36, 14),   -- 할라피뇨
       (36, 62),   -- 라즈베리
       (36, 61),   -- 딸기
       (36, 66),   -- 크랜베리
       (36, 65),   -- 체리
       (36, 64),   -- 석류
       (36, 63),   -- 붉은자두
       (36, 80),   -- 가죽
       (36, 93),   -- 코코아
       (36, 18),   -- 꿀
       (36, 24),   -- 버섯
       (36, 19),   -- 돌
       (36, 30),   -- 야생고기
       (36, 40),   -- 타르
       (36, 26),   -- 분필
       (36, 29),   -- 숲바닥
       (36, 28),   -- 석연슬레이트
       (36, 32),   -- 염분
       (36, 27),   -- 생강
       (36, 33),   -- 절인고기
       (36, 42),   -- 훈제육
       (36, 41),   -- 화분흙
       (36, 23),   -- 반창고
       (36, 20),   -- 마른낙엽
       (36, 31),   -- 연필심
       (36, 59),   -- 무화과
       (36, 58),   -- 건포도
       (36, 39),   -- 크림
       (36, 38),   -- 치즈
       (36, 76),   -- 바나나
       (36, 17),   -- 구운빵
       (36, 52),   -- 제비꽃
       (36, 43),   -- 라벤더
       (36, 48),   -- 자스민
       (36, 44),   -- 백합
       (36, 47),   -- 인동덩굴
       (36, 45),   -- 아카시아
       (36, 51),   -- 제라늄
       (36, 13),   -- 피망
       (36, 67),   -- 토마토
       (36, 5),    -- 구스베리
       (36, 71),   -- 오렌지
       (36, 70),   -- 마멀레이드
       (36, 69),   -- 레몬
       (36, 72),   -- 자몽
       (36, 101),  -- 사과
       (36, 102),  -- 살구
       (36, 79),   -- 풍선껌
       (37, 65),   -- 체리
       (37, 62),   -- 라즈베리
       (37, 61),   -- 딸기
       (37, 63),   -- 붉은자두
       (37, 66),   -- 크랜베리
       (37, 64),   -- 석류
       (37, 83),   -- 바닐라
       (37, 89),   -- 초콜릿
       (37, 82),   -- 담배
       (37, 86),   -- 삼나무
       (37, 91),   -- 커피
       (37, 94),   -- 콜라
       (37, 84),   -- 백단
       (37, 90),   -- 캐러멜
       (37, 92),   -- 코코넛
       (37, 1),    -- 블랙체리
       (37, 98),   -- 블루베리
       (37, 4),    -- 자두
       (37, 97),   -- 흑설탕
       (37, 103),  -- 감초
       (37, 104),  -- 계피
       (37, 109),  -- 후추
       (37, 11),   -- 유칼립투스
       (37, 10),   -- 오레가노
       (37, 108),  -- 팔각
       (37, 6),    -- 민트
       (37, 58),   -- 건포도
       (37, 59),   -- 무화과
       (37, 80),   -- 가죽
       (37, 93),   -- 코코아
       (37, 24),   -- 버섯
       (37, 19),   -- 돌
       (37, 38),   -- 치즈
       (37, 39),   -- 크림
       (37, 67),   -- 토마토
       (37, 13),   -- 피망
       (37, 52),   -- 제비꽃
       (37, 43),   -- 라벤더
       (38, 82),   -- 담배
       (38, 89),   -- 초콜릿
       (38, 83),   -- 바닐라
       (38, 107),  -- 정향
       (38, 86),   -- 삼나무
       (38, 90),   -- 캐러멜
       (38, 91),   -- 커피
       (38, 62),   -- 라즈베리
       (38, 65),   -- 체리
       (38, 61),   -- 딸기
       (38, 63),   -- 붉은자두
       (38, 66),   -- 크랜베리
       (38, 80),   -- 가죽
       (38, 93),   -- 코코아
       (38, 30),   -- 야생고기
       (38, 32),   -- 염분
       (38, 19),   -- 돌
       (38, 103),  -- 감초
       (38, 104),  -- 계피
       (38, 109),  -- 후추
       (38, 6),    -- 민트
       (38, 11),   -- 유칼립투스
       (38, 8),    -- 세이지
       (38, 1),    -- 블랙체리
       (38, 98),   -- 블루베리
       (38, 58),   -- 건포도
       (38, 59),   -- 무화과
       (38, 38),   -- 치즈
       (38, 52),   -- 제비꽃
       (39, 89),   -- 초콜릿
       (39, 83),   -- 바닐라
       (39, 86),   -- 삼나무
       (39, 82),   -- 담배
       (39, 98),   -- 블루베리
       (39, 1),    -- 블랙체리
       (39, 103),  -- 감초
       (39, 6),    -- 민트
       (39, 61),   -- 딸기
       (39, 80),   -- 가죽
       (40, 83),   -- 바닐라
       (40, 89),   -- 초콜릿
       (40, 91),   -- 커피
       (40, 82),   -- 담배
       (40, 86),   -- 삼나무
       (40, 98),   -- 블루베리
       (40, 1),    -- 블랙체리
       (40, 4),    -- 자두
       (40, 80),   -- 가죽
       (40, 93),   -- 코코아
       (40, 61),   -- 딸기
       (40, 65),   -- 체리
       (40, 109),  -- 후추
       (40, 55),   -- 라임
       (41, 83),   -- 바닐라
       (41, 82),   -- 담배
       (41, 86),   -- 삼나무
       (41, 89),   -- 초콜릿
       (41, 88),   -- 에스프레소
       (41, 91),   -- 커피
       (41, 107),  -- 정향
       (41, 94),   -- 콜라
       (41, 106),  -- 육두구
       (41, 90),   -- 캐러멜
       (41, 87),   -- 시가박스
       (41, 84),   -- 백단
       (41, 98),   -- 블루베리
       (41, 1),    -- 블랙체리
       (41, 4),    -- 자두
       (41, 80),   -- 가죽
       (41, 24),   -- 버섯
       (41, 32),   -- 염분
       (41, 29),   -- 숲바닥
       (41, 31),   -- 연필심
       (41, 93),   -- 코코아
       (41, 62),   -- 라즈베리
       (41, 66),   -- 크랜베리
       (41, 61),   -- 딸기
       (41, 65),   -- 체리
       (41, 64),   -- 석류
       (41, 63),   -- 붉은자두
       (41, 103),  -- 감초
       (41, 109),  -- 후추
       (41, 104),  -- 계피
       (41, 52),   -- 제비꽃
       (41, 43),   -- 라벤더
       (41, 53),   -- 포푸리
       (41, 39),   -- 크림
       (41, 58),   -- 건포도
       (41, 59),   -- 무화과
       (41, 13),   -- 피망
       (42, 80),   -- 가죽
       (42, 93),   -- 코코아
       (42, 40),   -- 타르
       (42, 83),   -- 바닐라
       (42, 86),   -- 삼나무
       (42, 89),   -- 초콜릿
       (42, 82),   -- 담배
       (42, 94),   -- 콜라
       (42, 90),   -- 캐러멜
       (42, 98),   -- 블루베리
       (42, 1),    -- 블랙체리
       (42, 62),   -- 라즈베리
       (42, 103),  -- 감초
       (42, 11),   -- 유칼립투스
       (42, 59),   -- 무화과
       (42, 39),   -- 크림
       (43, 82),   -- 담배
       (43, 89),   -- 초콜릿
       (43, 83),   -- 바닐라
       (43, 86),   -- 삼나무
       (43, 91),   -- 커피
       (43, 87),   -- 시가박스
       (43, 107),  -- 정향
       (43, 25),   -- 버터
       (43, 94),   -- 콜라
       (43, 88),   -- 에스프레소
       (43, 90),   -- 캐러멜
       (43, 92),   -- 코코넛
       (43, 106),  -- 육두구
       (43, 84),   -- 백단
       (43, 1),    -- 블랙체리
       (43, 98),   -- 블루베리
       (43, 4),    -- 자두
       (43, 2),    -- 오디
       (43, 3),    -- 올리브
       (43, 80),   -- 가죽
       (43, 93),   -- 코코아
       (43, 24),   -- 버섯
       (43, 19),   -- 돌
       (43, 40),   -- 타르
       (43, 31),   -- 연필심
       (43, 29),   -- 숲바닥
       (43, 26),   -- 분필
       (43, 30),   -- 야생고기
       (43, 27),   -- 생강
       (43, 23),   -- 반창고
       (43, 97),   -- 흑설탕
       (43, 9),    -- 아몬드
       (43, 96),   -- 헤이즐넛
       (43, 62),   -- 라즈베리
       (43, 61),   -- 딸기
       (43, 66),   -- 크랜베리
       (43, 65),   -- 체리
       (43, 64),   -- 석류
       (43, 63),   -- 붉은자두
       (43, 109),  -- 후추
       (43, 103),  -- 감초
       (43, 104),  -- 계피
       (43, 6),    -- 민트
       (43, 8),    -- 세이지
       (43, 11),   -- 유칼립투스
       (43, 10),   -- 오레가노
       (43, 108),  -- 팔각
       (43, 39),   -- 크림
       (43, 38),   -- 치즈
       (43, 76),   -- 바나나
       (43, 58),   -- 건포도
       (43, 59),   -- 무화과
       (43, 52),   -- 제비꽃
       (43, 43),   -- 라벤더
       (43, 53),   -- 포푸리
       (43, 13),   -- 피망
       (43, 67),   -- 토마토
       (43, 5),    -- 구스베리
       (43, 57),   -- 청배
       (43, 101),  -- 사과
       (43, 77),   -- 키위
       (43, 70),   -- 마멀레이드
       (44, 83),   -- 바닐라
       (44, 89),   -- 초콜릿
       (44, 82),   -- 담배
       (44, 86),   -- 삼나무
       (44, 91),   -- 커피
       (44, 107),  -- 정향
       (44, 87),   -- 시가박스
       (44, 106),  -- 육두구
       (44, 25),   -- 버터
       (44, 88),   -- 에스프레소
       (44, 92),   -- 코코넛
       (44, 90),   -- 캐러멜
       (44, 84),   -- 백단
       (44, 98),   -- 블루베리
       (44, 1),    -- 블랙체리
       (44, 4),    -- 자두
       (44, 3),    -- 올리브
       (44, 96),   -- 헤이즐넛
       (44, 9),    -- 아몬드
       (44, 80),   -- 가죽
       (44, 93),   -- 코코아
       (44, 24),   -- 버섯
       (44, 29),   -- 숲바닥
       (44, 40),   -- 타르
       (44, 32),   -- 염분
       (44, 19),   -- 돌
       (44, 28),   -- 석연슬레이트
       (44, 31),   -- 연필심
       (44, 18),   -- 꿀
       (44, 26),   -- 분필
       (44, 23),   -- 반창고
       (44, 30),   -- 야생고기
       (44, 20),   -- 마른낙엽
       (44, 109),  -- 후추
       (44, 103),  -- 감초
       (44, 104),  -- 계피
       (44, 6),    -- 민트
       (44, 11),   -- 유칼립투스
       (44, 8),    -- 세이지
       (44, 62),   -- 라즈베리
       (44, 61),   -- 딸기
       (44, 64),   -- 석류
       (44, 66),   -- 크랜베리
       (44, 65),   -- 체리
       (44, 39),   -- 크림
       (44, 38),   -- 치즈
       (44, 52),   -- 제비꽃
       (44, 43),   -- 라벤더
       (44, 53),   -- 포푸리
       (44, 59),   -- 무화과
       (44, 58),   -- 건포도
       (44, 67),   -- 토마토
       (44, 70),   -- 마멀레이드
       (44, 72),   -- 자몽
       (44, 68),   -- 귤
       (44, 71),   -- 오렌지
       (45, 82),   -- 담배
       (45, 83),   -- 바닐라
       (45, 107),  -- 정향
       (45, 98),   -- 블루베리
       (45, 80),   -- 가죽
       (45, 93),   -- 코코아
       (45, 24),   -- 버섯
       (45, 62),   -- 라즈베리
       (45, 63),   -- 붉은자두
       (45, 103),  -- 감초
       (45, 109),  -- 후추
       (45, 38),   -- 치즈
       (46, 83),   -- 바닐라
       (46, 89),   -- 초콜릿
       (46, 82),   -- 담배
       (46, 86),   -- 삼나무
       (46, 91),   -- 커피
       (46, 107),  -- 정향
       (46, 94),   -- 콜라
       (46, 90),   -- 캐러멜
       (46, 106),  -- 육두구
       (46, 88),   -- 에스프레소
       (46, 87),   -- 시가박스
       (46, 25),   -- 버터
       (46, 92),   -- 코코넛
       (46, 1),    -- 블랙체리
       (46, 98),   -- 블루베리
       (46, 4),    -- 자두
       (46, 3),    -- 올리브
       (46, 62),   -- 라즈베리
       (46, 66),   -- 크랜베리
       (46, 61),   -- 딸기
       (46, 65),   -- 체리
       (46, 64),   -- 석류
       (46, 63),   -- 붉은자두
       (46, 85),   -- 브리오슈
       (46, 109),  -- 후추
       (46, 103),  -- 감초
       (46, 104),  -- 계피
       (46, 11),   -- 유칼립투스
       (46, 8),    -- 세이지
       (46, 6),    -- 민트
       (46, 80),   -- 가죽
       (46, 93),   -- 코코아
       (46, 19),   -- 돌
       (46, 24),   -- 버섯
       (46, 18),   -- 꿀
       (46, 30),   -- 야생고기
       (46, 59),   -- 무화과
       (46, 58),   -- 건포도
       (46, 39),   -- 크림
       (46, 38),   -- 치즈
       (46, 52),   -- 제비꽃
       (46, 54),   -- 히비스커스
       (46, 47),   -- 인동덩굴
       (46, 45),   -- 아카시아
       (46, 101),  -- 사과
       (46, 71),   -- 오렌지
       (46, 69),   -- 레몬
       (46, 72),   -- 자몽
       (46, 67),   -- 토마토
       (46, 78),   -- 파인애플
       (47, 89),   -- 초콜릿
       (47, 82),   -- 담배
       (47, 83),   -- 바닐라
       (47, 91),   -- 커피
       (47, 1),    -- 블랙체리
       (47, 4),    -- 자두
       (47, 98),   -- 블루베리
       (47, 80),   -- 가죽
       (47, 29),   -- 숲바닥
       (47, 40),   -- 타르
       (47, 24),   -- 버섯
       (47, 18),   -- 꿀
       (47, 97),   -- 흑설탕
       (47, 9),    -- 아몬드
       (47, 62),   -- 라즈베리
       (47, 65),   -- 체리
       (47, 61),   -- 딸기
       (47, 64),   -- 석류
       (47, 103),  -- 감초
       (47, 109),  -- 후추
       (47, 104),  -- 계피
       (47, 6),    -- 민트
       (47, 58),   -- 건포도
       (47, 59),   -- 무화과
       (47, 39),   -- 크림
       (47, 67),   -- 토마토
       (48, 89),   -- 초콜릿
       (48, 83),   -- 바닐라
       (48, 82),   -- 담배
       (48, 91),   -- 커피
       (48, 86),   -- 삼나무
       (48, 90),   -- 캐러멜
       (48, 107),  -- 정향
       (48, 88),   -- 에스프레소
       (48, 106),  -- 육두구
       (48, 25),   -- 버터
       (48, 87),   -- 시가박스
       (48, 95),   -- 파이프담배
       (48, 94),   -- 콜라
       (48, 92),   -- 코코넛
       (48, 84),   -- 백단
       (48, 1),    -- 블랙체리
       (48, 98),   -- 블루베리
       (48, 4),    -- 자두
       (48, 3),    -- 올리브
       (48, 2),    -- 오디
       (48, 58),   -- 건포도
       (48, 59),   -- 무화과
       (48, 9),    -- 아몬드
       (48, 97),   -- 흑설탕
       (48, 96),   -- 헤이즐넛
       (48, 62),   -- 라즈베리
       (48, 61),   -- 딸기
       (48, 65),   -- 체리
       (48, 66),   -- 크랜베리
       (48, 64),   -- 석류
       (48, 63),   -- 붉은자두
       (48, 80),   -- 가죽
       (48, 93),   -- 코코아
       (48, 24),   -- 버섯
       (48, 40),   -- 타르
       (48, 18),   -- 꿀
       (48, 30),   -- 야생고기
       (48, 19),   -- 돌
       (48, 32),   -- 염분
       (48, 29),   -- 숲바닥
       (48, 28),   -- 석연슬레이트
       (48, 27),   -- 생강
       (48, 33),   -- 절인고기
       (48, 26),   -- 분필
       (48, 31),   -- 연필심
       (48, 42),   -- 훈제육
       (48, 23),   -- 반창고
       (48, 109),  -- 후추
       (48, 103),  -- 감초
       (48, 104),  -- 계피
       (48, 6),    -- 민트
       (48, 11),   -- 유칼립투스
       (48, 8),    -- 세이지
       (48, 10),   -- 오레가노
       (48, 14),   -- 할라피뇨
       (48, 105),  -- 붉은고추
       (48, 108),  -- 팔각
       (48, 38),   -- 치즈
       (48, 39),   -- 크림
       (48, 76),   -- 바나나
       (48, 67),   -- 토마토
       (48, 13),   -- 피망
       (48, 43),   -- 라벤더
       (48, 52),   -- 제비꽃
       (48, 53),   -- 포푸리
       (48, 54),   -- 히비스커스
       (48, 51),   -- 제라늄
       (48, 47),   -- 인동덩굴
       (48, 71),   -- 오렌지
       (48, 72),   -- 자몽
       (48, 69),   -- 레몬
       (48, 70),   -- 마멀레이드
       (48, 68),   -- 귤
       (48, 55),   -- 라임
       (48, 102),  -- 살구
       (48, 101),  -- 사과
       (48, 57),   -- 청배
       (48, 100),  -- 복숭아
       (48, 99),   -- 모과
       (48, 75),   -- 망고
       (48, 77),   -- 키위
       (48, 79),   -- 풍선껌
       (48, 74),   -- 리치
       (48, 78),   -- 파인애플
       (49, 82),   -- 담배
       (49, 83),   -- 바닐라
       (49, 107),  -- 정향
       (49, 86),   -- 삼나무
       (49, 95),   -- 파이프담배
       (49, 89),   -- 초콜릿
       (49, 1),    -- 블랙체리
       (49, 98),   -- 블루베리
       (49, 80),   -- 가죽
       (49, 26),   -- 분필
       (49, 93),   -- 코코아
       (49, 62),   -- 라즈베리
       (49, 61),   -- 딸기
       (49, 109),  -- 후추
       (49, 103),  -- 감초
       (49, 108),  -- 팔각
       (49, 52),   -- 제비꽃
       (49, 39),   -- 크림
       (49, 38),   -- 치즈
       (49, 71),   -- 오렌지
       (50, 82),   -- 담배
       (50, 86),   -- 삼나무
       (50, 83),   -- 바닐라
       (50, 89),   -- 초콜릿
       (50, 107),  -- 정향
       (50, 91),   -- 커피
       (50, 88),   -- 에스프레소
       (50, 87),   -- 시가박스
       (50, 84),   -- 백단
       (50, 95),   -- 파이프담배
       (50, 1),    -- 블랙체리
       (50, 98),   -- 블루베리
       (50, 4),    -- 자두
       (50, 80),   -- 가죽
       (50, 24),   -- 버섯
       (50, 93),   -- 코코아
       (50, 29),   -- 숲바닥
       (50, 40),   -- 타르
       (50, 19),   -- 돌
       (50, 18),   -- 꿀
       (50, 30),   -- 야생고기
       (50, 26),   -- 분필
       (50, 42),   -- 훈제육
       (50, 109),  -- 후추
       (50, 103),  -- 감초
       (50, 104),  -- 계피
       (50, 11),   -- 유칼립투스
       (50, 6),    -- 민트
       (50, 108),  -- 팔각
       (50, 14),   -- 할라피뇨
       (50, 62),   -- 라즈베리
       (50, 66),   -- 크랜베리
       (50, 61),   -- 딸기
       (50, 65),   -- 체리
       (50, 64),   -- 석류
       (50, 39),   -- 크림
       (50, 38),   -- 치즈
       (50, 59),   -- 무화과
       (50, 58),   -- 건포도
       (50, 67),   -- 토마토
       (50, 13),   -- 피망
       (50, 53),   -- 포푸리
       (50, 52),   -- 제비꽃
       (50, 43),   -- 라벤더
       (50, 101),  -- 사과
       (50, 100),  -- 복숭아
       (51, 89),   -- 초콜릿
       (51, 83),   -- 바닐라
       (51, 82),   -- 담배
       (51, 86),   -- 삼나무
       (51, 91),   -- 커피
       (51, 25),   -- 버터
       (51, 107),  -- 정향
       (51, 90),   -- 캐러멜
       (51, 87),   -- 시가박스
       (51, 106),  -- 육두구
       (51, 94),   -- 콜라
       (51, 88),   -- 에스프레소
       (51, 95),   -- 파이프담배
       (51, 92),   -- 코코넛
       (51, 84),   -- 백단
       (51, 1),    -- 블랙체리
       (51, 98),   -- 블루베리
       (51, 3),    -- 올리브
       (51, 4),    -- 자두
       (51, 2),    -- 오디
       (51, 80),   -- 가죽
       (51, 93),   -- 코코아
       (51, 24),   -- 버섯
       (51, 40),   -- 타르
       (51, 30),   -- 야생고기
       (51, 19),   -- 돌
       (51, 26),   -- 분필
       (51, 18),   -- 꿀
       (51, 29),   -- 숲바닥
       (51, 31),   -- 연필심
       (51, 23),   -- 반창고
       (51, 41),   -- 화분흙
       (51, 20),   -- 마른낙엽
       (51, 28),   -- 석연슬레이트
       (51, 9),    -- 아몬드
       (51, 96),   -- 헤이즐넛
       (51, 97),   -- 흑설탕
       (51, 62),   -- 라즈베리
       (51, 61),   -- 딸기
       (51, 65),   -- 체리
       (51, 66),   -- 크랜베리
       (51, 64),   -- 석류
       (51, 109),  -- 후추
       (51, 103),  -- 감초
       (51, 104),  -- 계피
       (51, 6),    -- 민트
       (51, 11),   -- 유칼립투스
       (51, 8),    -- 세이지
       (51, 14),   -- 할라피뇨
       (51, 38),   -- 치즈
       (51, 39),   -- 크림
       (51, 76),   -- 바나나
       (51, 59),   -- 무화과
       (51, 58),   -- 건포도
       (51, 67),   -- 토마토
       (51, 13),   -- 피망
       (51, 12),   -- 처빌
       (51, 5),    -- 구스베리
       (51, 52),   -- 제비꽃
       (51, 43),   -- 라벤더
       (51, 54),   -- 히비스커스
       (51, 48),   -- 자스민
       (51, 47),   -- 인동덩굴
       (51, 57),   -- 청배
       (51, 101),  -- 사과
       (51, 102),  -- 살구
       (51, 99),   -- 모과
       (51, 100),  -- 복숭아
       (51, 72),   -- 자몽
       (51, 71),   -- 오렌지
       (51, 78),   -- 파인애플
       (51, 73),   -- 구아바
       (52, 82),   -- 담배
       (52, 83),   -- 바닐라
       (52, 107),  -- 정향
       (52, 89),   -- 초콜릿
       (52, 91),   -- 커피
       (52, 90),   -- 캐러멜
       (52, 25),   -- 버터
       (52, 106),  -- 육두구
       (52, 86),   -- 삼나무
       (52, 87),   -- 시가박스
       (52, 80),   -- 가죽
       (52, 24),   -- 버섯
       (52, 18),   -- 꿀
       (52, 40),   -- 타르
       (52, 29),   -- 숲바닥
       (52, 19),   -- 돌
       (52, 30),   -- 야생고기
       (52, 28),   -- 석연슬레이트
       (52, 93),   -- 코코아
       (52, 1),    -- 블랙체리
       (52, 98),   -- 블루베리
       (52, 3),    -- 올리브
       (52, 4),    -- 자두
       (52, 2),    -- 오디
       (52, 85),   -- 브리오슈
       (52, 9),    -- 아몬드
       (52, 109),  -- 후추
       (52, 103),  -- 감초
       (52, 6),    -- 민트
       (52, 8),    -- 세이지
       (52, 11),   -- 유칼립투스
       (52, 10),   -- 오레가노
       (52, 108),  -- 팔각
       (52, 62),   -- 라즈베리
       (52, 61),   -- 딸기
       (52, 63),   -- 붉은자두
       (52, 39),   -- 크림
       (52, 38),   -- 치즈
       (52, 76),   -- 바나나
       (52, 52),   -- 제비꽃
       (52, 47),   -- 인동덩굴
       (52, 43),   -- 라벤더
       (52, 45),   -- 아카시아
       (52, 100),  -- 복숭아
       (52, 102),  -- 살구
       (52, 101),  -- 사과
       (52, 57),   -- 청배
       (52, 71),   -- 오렌지
       (52, 70),   -- 마멀레이드
       (52, 5),    -- 구스베리
       (52, 78),   -- 파인애플
       (52, 75),   -- 망고
       (52, 74),   -- 리치
       (52, 58),   -- 건포도
       (53, 89),   -- 초콜릿
       (53, 82),   -- 담배
       (53, 83),   -- 바닐라
       (53, 86),   -- 삼나무
       (53, 91),   -- 커피
       (53, 87),   -- 시가박스
       (53, 88),   -- 에스프레소
       (53, 107),  -- 정향
       (53, 90),   -- 캐러멜
       (53, 25),   -- 버터
       (53, 94),   -- 콜라
       (53, 84),   -- 백단
       (53, 106),  -- 육두구
       (53, 92),   -- 코코넛
       (53, 1),    -- 블랙체리
       (53, 98),   -- 블루베리
       (53, 4),    -- 자두
       (53, 3),    -- 올리브
       (53, 2),    -- 오디
       (53, 80),   -- 가죽
       (53, 93),   -- 코코아
       (53, 24),   -- 버섯
       (53, 29),   -- 숲바닥
       (53, 40),   -- 타르
       (53, 31),   -- 연필심
       (53, 19),   -- 돌
       (53, 28),   -- 석연슬레이트
       (53, 27),   -- 생강
       (53, 26),   -- 분필
       (53, 32),   -- 염분
       (53, 18),   -- 꿀
       (53, 33),   -- 절인고기
       (53, 42),   -- 훈제육
       (53, 36),   -- 젖은자갈
       (53, 30),   -- 야생고기
       (53, 96),   -- 헤이즐넛
       (53, 9),    -- 아몬드
       (53, 103),  -- 감초
       (53, 109),  -- 후추
       (53, 6),    -- 민트
       (53, 104),  -- 계피
       (53, 11),   -- 유칼립투스
       (53, 108),  -- 팔각
       (53, 8),    -- 세이지
       (53, 62),   -- 라즈베리
       (53, 61),   -- 딸기
       (53, 66),   -- 크랜베리
       (53, 64),   -- 석류
       (53, 63),   -- 붉은자두
       (53, 65),   -- 체리
       (53, 39),   -- 크림
       (53, 38),   -- 치즈
       (53, 76),   -- 바나나
       (53, 58),   -- 건포도
       (53, 59),   -- 무화과
       (53, 43),   -- 라벤더
       (53, 52),   -- 제비꽃
       (53, 67),   -- 토마토
       (53, 13),   -- 피망
       (53, 57),   -- 청배
       (53, 100),  -- 복숭아
       (53, 101),  -- 사과
       (53, 102),  -- 살구
       (53, 71),   -- 오렌지
       (53, 70),   -- 마멀레이드
       (53, 78),   -- 파인애플
       (54, 82),   -- 담배
       (54, 89),   -- 초콜릿
       (54, 83),   -- 바닐라
       (54, 91),   -- 커피
       (54, 86),   -- 삼나무
       (54, 87),   -- 시가박스
       (54, 107),  -- 정향
       (54, 88),   -- 에스프레소
       (54, 90),   -- 캐러멜
       (54, 25),   -- 버터
       (54, 84),   -- 백단
       (54, 94),   -- 콜라
       (54, 106),  -- 육두구
       (54, 92),   -- 코코넛
       (54, 95),   -- 파이프담배
       (54, 1),    -- 블랙체리
       (54, 98),   -- 블루베리
       (54, 4),    -- 자두
       (54, 3),    -- 올리브
       (54, 2),    -- 오디
       (54, 80),   -- 가죽
       (54, 93),   -- 코코아
       (54, 40),   -- 타르
       (54, 24),   -- 버섯
       (54, 29),   -- 숲바닥
       (54, 19),   -- 돌
       (54, 31),   -- 연필심
       (54, 30),   -- 야생고기
       (54, 18),   -- 꿀
       (54, 28),   -- 석연슬레이트
       (54, 26),   -- 분필
       (54, 27),   -- 생강
       (54, 32),   -- 염분
       (54, 41),   -- 화분흙
       (54, 33),   -- 절인고기
       (54, 22),   -- 밀랍
       (54, 9),    -- 아몬드
       (54, 97),   -- 흑설탕
       (54, 96),   -- 헤이즐넛
       (54, 85),   -- 브리오슈
       (54, 109),  -- 후추
       (54, 103),  -- 감초
       (54, 6),    -- 민트
       (54, 11),   -- 유칼립투스
       (54, 104),  -- 계피
       (54, 8),    -- 세이지
       (54, 10),   -- 오레가노
       (54, 14),   -- 할라피뇨
       (54, 108),  -- 팔각
       (54, 105),  -- 붉은고추
       (54, 62),   -- 라즈베리
       (54, 61),   -- 딸기
       (54, 66),   -- 크랜베리
       (54, 65),   -- 체리
       (54, 64),   -- 석류
       (54, 63),   -- 붉은자두
       (54, 39),   -- 크림
       (54, 38),   -- 치즈
       (54, 76),   -- 바나나
       (54, 59),   -- 무화과
       (54, 58),   -- 건포도
       (54, 13),   -- 피망
       (54, 67),   -- 토마토
       (54, 5),    -- 구스베리
       (54, 52),   -- 제비꽃
       (54, 43),   -- 라벤더
       (54, 53),   -- 포푸리
       (54, 71),   -- 오렌지
       (54, 70),   -- 마멀레이드
       (54, 72),   -- 자몽
       (54, 69),   -- 레몬
       (54, 55),   -- 라임
       (54, 101),  -- 사과
       (54, 100),  -- 복숭아
       (54, 99),   -- 모과
       (54, 102),  -- 살구
       (54, 73),   -- 구아바
       (54, 74),   -- 리치
       (55, 1),    -- 블랙체리
       (55, 98),   -- 블루베리
       (55, 4),    -- 자두
       (55, 2),    -- 오디
       (55, 3),    -- 올리브
       (55, 83),   -- 바닐라
       (55, 89),   -- 초콜릿
       (55, 86),   -- 삼나무
       (55, 82),   -- 담배
       (55, 94),   -- 콜라
       (55, 87),   -- 시가박스
       (55, 107),  -- 정향
       (55, 25),   -- 버터
       (55, 106),  -- 육두구
       (55, 84),   -- 백단
       (55, 62),   -- 라즈베리
       (55, 66),   -- 크랜베리
       (55, 61),   -- 딸기
       (55, 80),   -- 가죽
       (55, 93),   -- 코코아
       (55, 28),   -- 석연슬레이트
       (55, 26),   -- 분필
       (55, 24),   -- 버섯
       (55, 20),   -- 마른낙엽
       (55, 30),   -- 야생고기
       (55, 42),   -- 훈제육
       (55, 19),   -- 돌
       (55, 31),   -- 연필심
       (55, 40),   -- 타르
       (55, 109),  -- 후추
       (55, 103),  -- 감초
       (55, 104),  -- 계피
       (55, 8),    -- 세이지
       (55, 6),    -- 민트
       (55, 11),   -- 유칼립투스
       (55, 96),   -- 헤이즐넛
       (55, 97),   -- 흑설탕
       (55, 9),    -- 아몬드
       (55, 59),   -- 무화과
       (55, 58),   -- 건포도
       (55, 52),   -- 제비꽃
       (55, 39),   -- 크림
       (55, 38),   -- 치즈
       (55, 69),   -- 레몬
       (55, 99),   -- 모과
       (56, 83),   -- 바닐라
       (56, 89),   -- 초콜릿
       (56, 82),   -- 담배
       (56, 86),   -- 삼나무
       (56, 91),   -- 커피
       (56, 25),   -- 버터
       (56, 87),   -- 시가박스
       (56, 107),  -- 정향
       (56, 88),   -- 에스프레소
       (56, 90),   -- 캐러멜
       (56, 94),   -- 콜라
       (56, 92),   -- 코코넛
       (56, 106),  -- 육두구
       (56, 84),   -- 백단
       (56, 95),   -- 파이프담배
       (56, 1),    -- 블랙체리
       (56, 98),   -- 블루베리
       (56, 4),    -- 자두
       (56, 2),    -- 오디
       (56, 3),    -- 올리브
       (56, 9),    -- 아몬드
       (56, 97),   -- 흑설탕
       (56, 85),   -- 브리오슈
       (56, 96),   -- 헤이즐넛
       (56, 80),   -- 가죽
       (56, 93),   -- 코코아
       (56, 24),   -- 버섯
       (56, 29),   -- 숲바닥
       (56, 40),   -- 타르
       (56, 31),   -- 연필심
       (56, 18),   -- 꿀
       (56, 19),   -- 돌
       (56, 30),   -- 야생고기
       (56, 28),   -- 석연슬레이트
       (56, 26),   -- 분필
       (56, 33),   -- 절인고기
       (56, 20),   -- 마른낙엽
       (56, 27),   -- 생강
       (56, 23),   -- 반창고
       (56, 109),  -- 후추
       (56, 103),  -- 감초
       (56, 6),    -- 민트
       (56, 104),  -- 계피
       (56, 11),   -- 유칼립투스
       (56, 8),    -- 세이지
       (56, 108),  -- 팔각
       (56, 14),   -- 할라피뇨
       (56, 62),   -- 라즈베리
       (56, 61),   -- 딸기
       (56, 65),   -- 체리
       (56, 66),   -- 크랜베리
       (56, 63),   -- 붉은자두
       (56, 64),   -- 석류
       (56, 38),   -- 치즈
       (56, 39),   -- 크림
       (56, 59),   -- 무화과
       (56, 58),   -- 건포도
       (56, 13),   -- 피망
       (56, 67),   -- 토마토
       (56, 52),   -- 제비꽃
       (56, 43),   -- 라벤더
       (56, 46),   -- 오렌지꽃
       (56, 48),   -- 자스민
       (56, 54),   -- 히비스커스
       (56, 70),   -- 마멀레이드
       (56, 71),   -- 오렌지
       (56, 69),   -- 레몬
       (56, 100),  -- 복숭아
       (56, 101),  -- 사과
       (56, 57),   -- 청배
       (56, 102),  -- 살구
       (57, 83),   -- 바닐라
       (57, 82),   -- 담배
       (57, 89),   -- 초콜릿
       (57, 86),   -- 삼나무
       (57, 90),   -- 캐러멜
       (57, 87),   -- 시가박스
       (57, 91),   -- 커피
       (57, 94),   -- 콜라
       (57, 25),   -- 버터
       (57, 106),  -- 육두구
       (57, 88),   -- 에스프레소
       (57, 95),   -- 파이프담배
       (57, 98),   -- 블루베리
       (57, 1),    -- 블랙체리
       (57, 4),    -- 자두
       (57, 97),   -- 흑설탕
       (57, 9),    -- 아몬드
       (57, 80),   -- 가죽
       (57, 93),   -- 코코아
       (57, 19),   -- 돌
       (57, 29),   -- 숲바닥
       (57, 20),   -- 마른낙엽
       (57, 32),   -- 염분
       (57, 24),   -- 버섯
       (57, 40),   -- 타르
       (57, 30),   -- 야생고기
       (57, 109),  -- 후추
       (57, 103),  -- 감초
       (57, 6),    -- 민트
       (57, 104),  -- 계피
       (57, 8),    -- 세이지
       (57, 11),   -- 유칼립투스
       (57, 62),   -- 라즈베리
       (57, 66),   -- 크랜베리
       (57, 63),   -- 붉은자두
       (57, 39),   -- 크림
       (57, 38),   -- 치즈
       (57, 59),   -- 무화과
       (57, 58),   -- 건포도
       (57, 60),   -- 용과
       (57, 13),   -- 피망
       (57, 52),   -- 제비꽃
       (57, 70),   -- 마멀레이드
       (57, 101),  -- 사과
       (58, 83),   -- 바닐라
       (58, 89),   -- 초콜릿
       (58, 86),   -- 삼나무
       (58, 82),   -- 담배
       (58, 90),   -- 캐러멜
       (58, 1),    -- 블랙체리
       (58, 80),   -- 가죽
       (58, 93),   -- 코코아
       (58, 61),   -- 딸기
       (58, 62),   -- 라즈베리
       (58, 103),  -- 감초
       (58, 109),  -- 후추
       (58, 11),   -- 유칼립투스
       (58, 6),    -- 민트
       (58, 39),   -- 크림
       (58, 52),   -- 제비꽃
       (59, 1),    -- 블랙체리
       (59, 98),   -- 블루베리
       (59, 2),    -- 오디
       (59, 82),   -- 담배
       (59, 83),   -- 바닐라
       (59, 107),  -- 정향
       (59, 89),   -- 초콜릿
       (59, 87),   -- 시가박스
       (59, 91),   -- 커피
       (59, 86),   -- 삼나무
       (59, 80),   -- 가죽
       (59, 24),   -- 버섯
       (59, 29),   -- 숲바닥
       (59, 40),   -- 타르
       (59, 28),   -- 석연슬레이트
       (59, 23),   -- 반창고
       (59, 26),   -- 분필
       (59, 61),   -- 딸기
       (59, 66),   -- 크랜베리
       (59, 63),   -- 붉은자두
       (59, 65),   -- 체리
       (59, 62),   -- 라즈베리
       (59, 109),  -- 후추
       (59, 11),   -- 유칼립투스
       (59, 103),  -- 감초
       (59, 38),   -- 치즈
       (59, 67),   -- 토마토
       (59, 59),   -- 무화과
       (59, 52),   -- 제비꽃
       (60, 83),   -- 바닐라
       (60, 91),   -- 커피
       (60, 92),   -- 코코넛
       (60, 82),   -- 담배
       (60, 80),   -- 가죽
       (60, 93),   -- 코코아
       (60, 19),   -- 돌
       (60, 62),   -- 라즈베리
       (60, 61),   -- 딸기
       (60, 104),  -- 계피
       (60, 39),   -- 크림
       (61, 83),   -- 바닐라
       (61, 82),   -- 담배
       (61, 89),   -- 초콜릿
       (61, 25),   -- 버터
       (61, 90),   -- 캐러멜
       (61, 91),   -- 커피
       (61, 86),   -- 삼나무
       (61, 107),  -- 정향
       (61, 94),   -- 콜라
       (61, 87),   -- 시가박스
       (61, 95),   -- 파이프담배
       (61, 106),  -- 육두구
       (61, 88),   -- 에스프레소
       (61, 98),   -- 블루베리
       (61, 1),    -- 블랙체리
       (61, 4),    -- 자두
       (61, 2),    -- 오디
       (61, 61),   -- 딸기
       (61, 62),   -- 라즈베리
       (61, 65),   -- 체리
       (61, 64),   -- 석류
       (61, 66),   -- 크랜베리
       (61, 63),   -- 붉은자두
       (61, 9),    -- 아몬드
       (61, 85),   -- 브리오슈
       (61, 109),  -- 후추
       (61, 103),  -- 감초
       (61, 104),  -- 계피
       (61, 6),    -- 민트
       (61, 11),   -- 유칼립투스
       (61, 10),   -- 오레가노
       (61, 108),  -- 팔각
       (61, 105),  -- 붉은고추
       (61, 8),    -- 세이지
       (61, 14),   -- 할라피뇨
       (61, 80),   -- 가죽
       (61, 93),   -- 코코아
       (61, 18),   -- 꿀
       (61, 24),   -- 버섯
       (61, 28),   -- 석연슬레이트
       (61, 23),   -- 반창고
       (61, 30),   -- 야생고기
       (61, 19),   -- 돌
       (61, 29),   -- 숲바닥
       (61, 58),   -- 건포도
       (61, 59),   -- 무화과
       (61, 38),   -- 치즈
       (61, 39),   -- 크림
       (61, 76),   -- 바나나
       (61, 101),  -- 사과
       (61, 100),  -- 복숭아
       (61, 102),  -- 살구
       (61, 57),   -- 청배
       (61, 99),   -- 모과
       (61, 67),   -- 토마토
       (61, 5),    -- 구스베리
       (61, 13),   -- 피망
       (61, 52),   -- 제비꽃
       (61, 45),   -- 아카시아
       (61, 44),   -- 백합
       (61, 70),   -- 마멀레이드
       (61, 71),   -- 오렌지
       (61, 69),   -- 레몬
       (61, 72),   -- 자몽
       (61, 79),   -- 풍선껌
       (61, 74),   -- 리치
       (62, 1),    -- 블랙체리
       (62, 98),   -- 블루베리
       (62, 4),    -- 자두
       (62, 2),    -- 오디
       (62, 3),    -- 올리브
       (62, 89),   -- 초콜릿
       (62, 82),   -- 담배
       (62, 83),   -- 바닐라
       (62, 107),  -- 정향
       (62, 91),   -- 커피
       (62, 86),   -- 삼나무
       (62, 95),   -- 파이프담배
       (62, 87),   -- 시가박스
       (62, 90),   -- 캐러멜
       (62, 94),   -- 콜라
       (62, 84),   -- 백단
       (62, 92),   -- 코코넛
       (62, 25),   -- 버터
       (62, 80),   -- 가죽
       (62, 24),   -- 버섯
       (62, 30),   -- 야생고기
       (62, 29),   -- 숲바닥
       (62, 18),   -- 꿀
       (62, 33),   -- 절인고기
       (62, 40),   -- 타르
       (62, 93),   -- 코코아
       (62, 28),   -- 석연슬레이트
       (62, 19),   -- 돌
       (62, 62),   -- 라즈베리
       (62, 61),   -- 딸기
       (62, 65),   -- 체리
       (62, 63),   -- 붉은자두
       (62, 66),   -- 크랜베리
       (62, 64),   -- 석류
       (62, 109),  -- 후추
       (62, 11),   -- 유칼립투스
       (62, 6),    -- 민트
       (62, 103),  -- 감초
       (62, 104),  -- 계피
       (62, 8),    -- 세이지
       (62, 39),   -- 크림
       (62, 38),   -- 치즈
       (62, 52),   -- 제비꽃
       (62, 43),   -- 라벤더
       (62, 44),   -- 백합
       (62, 53),   -- 포푸리
       (62, 67),   -- 토마토
       (62, 13),   -- 피망
       (62, 59),   -- 무화과
       (62, 58),   -- 건포도
       (62, 101),  -- 사과
       (62, 102),  -- 살구
       (62, 57),   -- 청배
       (62, 74),   -- 리치
       (63, 98),   -- 블루베리
       (63, 1),    -- 블랙체리
       (63, 2),    -- 오디
       (63, 65),   -- 체리
       (63, 61),   -- 딸기
       (63, 62),   -- 라즈베리
       (63, 64),   -- 석류
       (63, 63),   -- 붉은자두
       (63, 104),  -- 계피
       (63, 103),  -- 감초
       (63, 109),  -- 후추
       (63, 52),   -- 제비꽃
       (63, 43),   -- 라벤더
       (63, 19),   -- 돌
       (63, 80),   -- 가죽
       (63, 89),   -- 초콜릿
       (63, 82),   -- 담배
       (63, 94),   -- 콜라
       (64, 62),   -- 라즈베리
       (64, 61),   -- 딸기
       (64, 63),   -- 붉은자두
       (64, 66),   -- 크랜베리
       (64, 82),   -- 담배
       (64, 83),   -- 바닐라
       (64, 89),   -- 초콜릿
       (64, 107),  -- 정향
       (64, 106),  -- 육두구
       (64, 95),   -- 파이프담배
       (64, 94),   -- 콜라
       (64, 91),   -- 커피
       (64, 88),   -- 에스프레소
       (64, 1),    -- 블랙체리
       (64, 98),   -- 블루베리
       (64, 80),   -- 가죽
       (64, 27),   -- 생강
       (64, 93),   -- 코코아
       (64, 19),   -- 돌
       (64, 104),  -- 계피
       (64, 109),  -- 후추
       (64, 103),  -- 감초
       (64, 6),    -- 민트
       (64, 58),   -- 건포도
       (64, 59),   -- 무화과
       (64, 38),   -- 치즈
       (64, 52),   -- 제비꽃
       (64, 43),   -- 라벤더
       (64, 67),   -- 토마토
       (65, 83),   -- 바닐라
       (65, 89),   -- 초콜릿
       (65, 82),   -- 담배
       (65, 86),   -- 삼나무
       (65, 91),   -- 커피
       (65, 107),  -- 정향
       (65, 25),   -- 버터
       (65, 90),   -- 캐러멜
       (65, 87),   -- 시가박스
       (65, 94),   -- 콜라
       (65, 106),  -- 육두구
       (65, 88),   -- 에스프레소
       (65, 92),   -- 코코넛
       (65, 95),   -- 파이프담배
       (65, 84),   -- 백단
       (65, 1),    -- 블랙체리
       (65, 98),   -- 블루베리
       (65, 4),    -- 자두
       (65, 3),    -- 올리브
       (65, 2),    -- 오디
       (65, 97),   -- 흑설탕
       (65, 9),    -- 아몬드
       (65, 96),   -- 헤이즐넛
       (65, 85),   -- 브리오슈
       (65, 109),  -- 후추
       (65, 103),  -- 감초
       (65, 104),  -- 계피
       (65, 6),    -- 민트
       (65, 11),   -- 유칼립투스
       (65, 8),    -- 세이지
       (65, 108),  -- 팔각
       (65, 10),   -- 오레가노
       (65, 14),   -- 할라피뇨
       (65, 105),  -- 붉은고추
       (65, 62),   -- 라즈베리
       (65, 61),   -- 딸기
       (65, 64),   -- 석류
       (65, 66),   -- 크랜베리
       (65, 65),   -- 체리
       (65, 63),   -- 붉은자두
       (65, 80),   -- 가죽
       (65, 93),   -- 코코아
       (65, 24),   -- 버섯
       (65, 29),   -- 숲바닥
       (65, 40),   -- 타르
       (65, 18),   -- 꿀
       (65, 19),   -- 돌
       (65, 30),   -- 야생고기
       (65, 32),   -- 염분
       (65, 28),   -- 석연슬레이트
       (65, 31),   -- 연필심
       (65, 26),   -- 분필
       (65, 41),   -- 화분흙
       (65, 42),   -- 훈제육
       (65, 27),   -- 생강
       (65, 36),   -- 젖은자갈
       (65, 33),   -- 절인고기
       (65, 22),   -- 밀랍
       (65, 38),   -- 치즈
       (65, 39),   -- 크림
       (65, 76),   -- 바나나
       (65, 58),   -- 건포도
       (65, 59),   -- 무화과
       (65, 13),   -- 피망
       (65, 67),   -- 토마토
       (65, 52),   -- 제비꽃
       (65, 43),   -- 라벤더
       (65, 53),   -- 포푸리
       (65, 54),   -- 히비스커스
       (65, 47),   -- 인동덩굴
       (65, 45),   -- 아카시아
       (65, 101),  -- 사과
       (65, 102),  -- 살구
       (65, 57),   -- 청배
       (65, 100),  -- 복숭아
       (65, 99),   -- 모과
       (65, 69),   -- 레몬
       (65, 55),   -- 라임
       (65, 71),   -- 오렌지
       (65, 70),   -- 마멀레이드
       (65, 72),   -- 자몽
       (65, 75),   -- 망고
       (65, 78),   -- 파인애플
       (66, 83),   -- 바닐라
       (66, 89),   -- 초콜릿
       (66, 82),   -- 담배
       (66, 86),   -- 삼나무
       (66, 91),   -- 커피
       (66, 107),  -- 정향
       (66, 90),   -- 캐러멜
       (66, 25),   -- 버터
       (66, 87),   -- 시가박스
       (66, 106),  -- 육두구
       (66, 88),   -- 에스프레소
       (66, 94),   -- 콜라
       (66, 84),   -- 백단
       (66, 95),   -- 파이프담배
       (66, 92),   -- 코코넛
       (66, 98),   -- 블루베리
       (66, 1),    -- 블랙체리
       (66, 4),    -- 자두
       (66, 3),    -- 올리브
       (66, 2),    -- 오디
       (66, 9),    -- 아몬드
       (66, 97),   -- 흑설탕
       (66, 96),   -- 헤이즐넛
       (66, 80),   -- 가죽
       (66, 93),   -- 코코아
       (66, 40),   -- 타르
       (66, 19),   -- 돌
       (66, 24),   -- 버섯
       (66, 29),   -- 숲바닥
       (66, 31),   -- 연필심
       (66, 18),   -- 꿀
       (66, 26),   -- 분필
       (66, 32),   -- 염분
       (66, 30),   -- 야생고기
       (66, 33),   -- 절인고기
       (66, 20),   -- 마른낙엽
       (66, 41),   -- 화분흙
       (66, 23),   -- 반창고
       (66, 36),   -- 젖은자갈
       (66, 109),  -- 후추
       (66, 103),  -- 감초
       (66, 104),  -- 계피
       (66, 6),    -- 민트
       (66, 11),   -- 유칼립투스
       (66, 8),    -- 세이지
       (66, 108),  -- 팔각
       (66, 105),  -- 붉은고추
       (66, 10),   -- 오레가노
       (66, 62),   -- 라즈베리
       (66, 61),   -- 딸기
       (66, 65),   -- 체리
       (66, 66),   -- 크랜베리
       (66, 63),   -- 붉은자두
       (66, 64),   -- 석류
       (66, 39),   -- 크림
       (66, 38),   -- 치즈
       (66, 17),   -- 구운빵
       (66, 52),   -- 제비꽃
       (66, 43),   -- 라벤더
       (66, 48),   -- 자스민
       (66, 47),   -- 인동덩굴
       (66, 51),   -- 제라늄
       (66, 58),   -- 건포도
       (66, 59),   -- 무화과
       (66, 13),   -- 피망
       (66, 67),   -- 토마토
       (66, 5),    -- 구스베리
       (66, 71),   -- 오렌지
       (66, 70),   -- 마멀레이드
       (66, 72),   -- 자몽
       (66, 69),   -- 레몬
       (66, 101),  -- 사과
       (66, 102),  -- 살구
       (66, 100),  -- 복숭아
       (66, 57),   -- 청배
       (66, 99),   -- 모과
       (66, 78),   -- 파인애플
       (67, 62),   -- 라즈베리
       (67, 61),   -- 딸기
       (67, 66),   -- 크랜베리
       (67, 65),   -- 체리
       (67, 63),   -- 붉은자두
       (67, 64),   -- 석류
       (67, 83),   -- 바닐라
       (67, 86),   -- 삼나무
       (67, 82),   -- 담배
       (67, 94),   -- 콜라
       (67, 107),  -- 정향
       (67, 89),   -- 초콜릿
       (67, 87),   -- 시가박스
       (67, 106),  -- 육두구
       (67, 90),   -- 캐러멜
       (67, 92),   -- 코코넛
       (67, 80),   -- 가죽
       (67, 29),   -- 숲바닥
       (67, 24),   -- 버섯
       (67, 19),   -- 돌
       (67, 93),   -- 코코아
       (67, 30),   -- 야생고기
       (67, 109),  -- 후추
       (67, 104),  -- 계피
       (67, 6),    -- 민트
       (67, 103),  -- 감초
       (67, 11),   -- 유칼립투스
       (67, 98),   -- 블루베리
       (67, 1),    -- 블랙체리
       (67, 38),   -- 치즈
       (67, 52),   -- 제비꽃
       (67, 54),   -- 히비스커스
       (67, 53),   -- 포푸리
       (67, 58),   -- 건포도
       (67, 59),   -- 무화과
       (67, 70),   -- 마멀레이드
       (67, 69),   -- 레몬
       (67, 102),  -- 살구
       (67, 101),  -- 사과
       (68, 83),   -- 바닐라
       (68, 89),   -- 초콜릿
       (68, 82),   -- 담배
       (68, 91),   -- 커피
       (68, 86),   -- 삼나무
       (68, 107),  -- 정향
       (68, 25),   -- 버터
       (68, 90),   -- 캐러멜
       (68, 106),  -- 육두구
       (68, 94),   -- 콜라
       (68, 87),   -- 시가박스
       (68, 92),   -- 코코넛
       (68, 88),   -- 에스프레소
       (68, 95),   -- 파이프담배
       (68, 84),   -- 백단
       (68, 98),   -- 블루베리
       (68, 1),    -- 블랙체리
       (68, 4),    -- 자두
       (68, 2),    -- 오디
       (68, 97),   -- 흑설탕
       (68, 9),    -- 아몬드
       (68, 85),   -- 브리오슈
       (68, 109),  -- 후추
       (68, 103),  -- 감초
       (68, 104),  -- 계피
       (68, 6),    -- 민트
       (68, 8),    -- 세이지
       (68, 11),   -- 유칼립투스
       (68, 14),   -- 할라피뇨
       (68, 108),  -- 팔각
       (68, 80),   -- 가죽
       (68, 93),   -- 코코아
       (68, 24),   -- 버섯
       (68, 29),   -- 숲바닥
       (68, 18),   -- 꿀
       (68, 19),   -- 돌
       (68, 30),   -- 야생고기
       (68, 28),   -- 석연슬레이트
       (68, 40),   -- 타르
       (68, 32),   -- 염분
       (68, 26),   -- 분필
       (68, 33),   -- 절인고기
       (68, 31),   -- 연필심
       (68, 23),   -- 반창고
       (68, 42),   -- 훈제육
       (68, 62),   -- 라즈베리
       (68, 61),   -- 딸기
       (68, 66),   -- 크랜베리
       (68, 65),   -- 체리
       (68, 63),   -- 붉은자두
       (68, 64),   -- 석류
       (68, 58),   -- 건포도
       (68, 59),   -- 무화과
       (68, 38),   -- 치즈
       (68, 39),   -- 크림
       (68, 76),   -- 바나나
       (68, 67),   -- 토마토
       (68, 5),    -- 구스베리
       (68, 13),   -- 피망
       (68, 52),   -- 제비꽃
       (68, 43),   -- 라벤더
       (68, 45),   -- 아카시아
       (68, 53),   -- 포푸리
       (68, 51),   -- 제라늄
       (68, 54),   -- 히비스커스
       (68, 101),  -- 사과
       (68, 102),  -- 살구
       (68, 57),   -- 청배
       (68, 100),  -- 복숭아
       (68, 71),   -- 오렌지
       (68, 70),   -- 마멀레이드
       (68, 73),   -- 구아바
       (68, 79),   -- 풍선껌
       (68, 74),   -- 리치
       (69, 89),   -- 초콜릿
       (69, 83),   -- 바닐라
       (69, 86),   -- 삼나무
       (69, 94),   -- 콜라
       (69, 25),   -- 버터
       (69, 88),   -- 에스프레소
       (69, 91),   -- 커피
       (69, 107),  -- 정향
       (69, 82),   -- 담배
       (69, 106),  -- 육두구
       (69, 1),    -- 블랙체리
       (69, 98),   -- 블루베리
       (69, 4),    -- 자두
       (69, 2),    -- 오디
       (69, 62),   -- 라즈베리
       (69, 66),   -- 크랜베리
       (69, 61),   -- 딸기
       (69, 96),   -- 헤이즐넛
       (69, 109),  -- 후추
       (69, 103),  -- 감초
       (69, 11),   -- 유칼립투스
       (69, 80),   -- 가죽
       (69, 40),   -- 타르
       (69, 93),   -- 코코아
       (69, 38),   -- 치즈
       (69, 52),   -- 제비꽃
       (70, 83),   -- 바닐라
       (70, 89),   -- 초콜릿
       (70, 90),   -- 캐러멜
       (70, 91),   -- 커피
       (70, 86),   -- 삼나무
       (70, 82),   -- 담배
       (70, 25),   -- 버터
       (70, 94),   -- 콜라
       (70, 107),  -- 정향
       (70, 92),   -- 코코넛
       (70, 95),   -- 파이프담배
       (70, 106),  -- 육두구
       (70, 88),   -- 에스프레소
       (70, 87),   -- 시가박스
       (70, 1),    -- 블랙체리
       (70, 98),   -- 블루베리
       (70, 4),    -- 자두
       (70, 2),    -- 오디
       (70, 96),   -- 헤이즐넛
       (70, 97),   -- 흑설탕
       (70, 109),  -- 후추
       (70, 103),  -- 감초
       (70, 6),    -- 민트
       (70, 104),  -- 계피
       (70, 11),   -- 유칼립투스
       (70, 8),    -- 세이지
       (70, 80),   -- 가죽
       (70, 93),   -- 코코아
       (70, 29),   -- 숲바닥
       (70, 31),   -- 연필심
       (70, 18),   -- 꿀
       (70, 24),   -- 버섯
       (70, 62),   -- 라즈베리
       (70, 61),   -- 딸기
       (70, 66),   -- 크랜베리
       (70, 58),   -- 건포도
       (70, 59),   -- 무화과
       (70, 39),   -- 크림
       (70, 38),   -- 치즈
       (70, 52),   -- 제비꽃
       (70, 54),   -- 히비스커스
       (70, 101),  -- 사과
       (70, 13),   -- 피망
       (70, 71),   -- 오렌지
       (71, 1),    -- 블랙체리
       (71, 98),   -- 블루베리
       (71, 2),    -- 오디
       (71, 4),    -- 자두
       (71, 83),   -- 바닐라
       (71, 86),   -- 삼나무
       (71, 89),   -- 초콜릿
       (71, 82),   -- 담배
       (71, 88),   -- 에스프레소
       (71, 87),   -- 시가박스
       (71, 91),   -- 커피
       (71, 95),   -- 파이프담배
       (71, 90),   -- 캐러멜
       (71, 62),   -- 라즈베리
       (71, 61),   -- 딸기
       (71, 66),   -- 크랜베리
       (71, 63),   -- 붉은자두
       (71, 103),  -- 감초
       (71, 6),    -- 민트
       (71, 104),  -- 계피
       (71, 109),  -- 후추
       (71, 8),    -- 세이지
       (71, 80),   -- 가죽
       (71, 93),   -- 코코아
       (71, 29),   -- 숲바닥
       (71, 24),   -- 버섯
       (71, 59),   -- 무화과
       (71, 58),   -- 건포도
       (71, 43),   -- 라벤더
       (71, 52),   -- 제비꽃
       (71, 70),   -- 마멀레이드
       (71, 71),   -- 오렌지
       (71, 100),  -- 복숭아
       (71, 77),   -- 키위
       (72, 89),   -- 초콜릿
       (72, 83),   -- 바닐라
       (72, 82),   -- 담배
       (72, 86),   -- 삼나무
       (72, 107),  -- 정향
       (72, 91),   -- 커피
       (72, 90),   -- 캐러멜
       (72, 25),   -- 버터
       (72, 94),   -- 콜라
       (72, 87),   -- 시가박스
       (72, 106),  -- 육두구
       (72, 92),   -- 코코넛
       (72, 88),   -- 에스프레소
       (72, 84),   -- 백단
       (72, 95),   -- 파이프담배
       (72, 1),    -- 블랙체리
       (72, 98),   -- 블루베리
       (72, 4),    -- 자두
       (72, 2),    -- 오디
       (72, 62),   -- 라즈베리
       (72, 61),   -- 딸기
       (72, 66),   -- 크랜베리
       (72, 65),   -- 체리
       (72, 63),   -- 붉은자두
       (72, 64),   -- 석류
       (72, 97),   -- 흑설탕
       (72, 96),   -- 헤이즐넛
       (72, 80),   -- 가죽
       (72, 93),   -- 코코아
       (72, 24),   -- 버섯
       (72, 19),   -- 돌
       (72, 18),   -- 꿀
       (72, 40),   -- 타르
       (72, 28),   -- 석연슬레이트
       (72, 29),   -- 숲바닥
       (72, 26),   -- 분필
       (72, 32),   -- 염분
       (72, 30),   -- 야생고기
       (72, 23),   -- 반창고
       (72, 42),   -- 훈제육
       (72, 33),   -- 절인고기
       (72, 27),   -- 생강
       (72, 20),   -- 마른낙엽
       (72, 109),  -- 후추
       (72, 104),  -- 계피
       (72, 103),  -- 감초
       (72, 11),   -- 유칼립투스
       (72, 6),    -- 민트
       (72, 108),  -- 팔각
       (72, 8),    -- 세이지
       (72, 14),   -- 할라피뇨
       (72, 38),   -- 치즈
       (72, 39),   -- 크림
       (72, 59),   -- 무화과
       (72, 58),   -- 건포도
       (72, 13),   -- 피망
       (72, 67),   -- 토마토
       (72, 52),   -- 제비꽃
       (72, 43),   -- 라벤더
       (72, 54),   -- 히비스커스
       (72, 53),   -- 포푸리
       (72, 102),  -- 살구
       (72, 100),  -- 복숭아
       (72, 101),  -- 사과
       (72, 71),   -- 오렌지
       (72, 69),   -- 레몬
       (72, 73),   -- 구아바
       (73, 83),   -- 바닐라
       (73, 86),   -- 삼나무
       (73, 82),   -- 담배
       (73, 89),   -- 초콜릿
       (73, 107),  -- 정향
       (73, 106),  -- 육두구
       (73, 25),   -- 버터
       (73, 94),   -- 콜라
       (73, 91),   -- 커피
       (73, 1),    -- 블랙체리
       (73, 98),   -- 블루베리
       (73, 4),    -- 자두
       (73, 80),   -- 가죽
       (73, 24),   -- 버섯
       (73, 33),   -- 절인고기
       (73, 40),   -- 타르
       (73, 93),   -- 코코아
       (73, 18),   -- 꿀
       (73, 30),   -- 야생고기
       (73, 9),    -- 아몬드
       (73, 96),   -- 헤이즐넛
       (73, 61),   -- 딸기
       (73, 65),   -- 체리
       (73, 62),   -- 라즈베리
       (73, 63),   -- 붉은자두
       (73, 109),  -- 후추
       (73, 104),  -- 계피
       (73, 103),  -- 감초
       (73, 6),    -- 민트
       (73, 38),   -- 치즈
       (73, 39),   -- 크림
       (73, 58),   -- 건포도
       (73, 59),   -- 무화과
       (73, 71),   -- 오렌지
       (73, 52),   -- 제비꽃
       (73, 13),   -- 피망
       (74, 86),   -- 삼나무
       (74, 83),   -- 바닐라
       (74, 82),   -- 담배
       (74, 107),  -- 정향
       (74, 87),   -- 시가박스
       (74, 25),   -- 버터
       (74, 89),   -- 초콜릿
       (74, 80),   -- 가죽
       (74, 30),   -- 야생고기
       (74, 93),   -- 코코아
       (74, 109),  -- 후추
       (74, 103),  -- 감초
       (74, 6),    -- 민트
       (74, 11),   -- 유칼립투스
       (74, 61),   -- 딸기
       (74, 62),   -- 라즈베리
       (74, 52),   -- 제비꽃
       (74, 38),   -- 치즈
       (74, 71),   -- 오렌지
       (75, 83),   -- 바닐라
       (75, 89),   -- 초콜릿
       (75, 82),   -- 담배
       (75, 92),   -- 코코넛
       (75, 107),  -- 정향
       (75, 86),   -- 삼나무
       (75, 90),   -- 캐러멜
       (75, 88),   -- 에스프레소
       (75, 106),  -- 육두구
       (75, 91),   -- 커피
       (75, 25),   -- 버터
       (75, 98),   -- 블루베리
       (75, 1),    -- 블랙체리
       (75, 4),    -- 자두
       (75, 109),  -- 후추
       (75, 104),  -- 계피
       (75, 103),  -- 감초
       (75, 6),    -- 민트
       (75, 8),    -- 세이지
       (75, 80),   -- 가죽
       (75, 24),   -- 버섯
       (75, 93),   -- 코코아
       (75, 40),   -- 타르
       (75, 32),   -- 염분
       (75, 19),   -- 돌
       (75, 18),   -- 꿀
       (75, 20),   -- 마른낙엽
       (75, 62),   -- 라즈베리
       (75, 63),   -- 붉은자두
       (75, 65),   -- 체리
       (75, 66),   -- 크랜베리
       (75, 38),   -- 치즈
       (75, 39),   -- 크림
       (75, 101),  -- 사과
       (75, 52),   -- 제비꽃
       (76, 83),   -- 바닐라
       (76, 89),   -- 초콜릿
       (76, 82),   -- 담배
       (76, 86),   -- 삼나무
       (76, 90),   -- 캐러멜
       (76, 107),  -- 정향
       (76, 91),   -- 커피
       (76, 25),   -- 버터
       (76, 94),   -- 콜라
       (76, 88),   -- 에스프레소
       (76, 87),   -- 시가박스
       (76, 106),  -- 육두구
       (76, 92),   -- 코코넛
       (76, 84),   -- 백단
       (76, 1),    -- 블랙체리
       (76, 98),   -- 블루베리
       (76, 4),    -- 자두
       (76, 9),    -- 아몬드
       (76, 97),   -- 흑설탕
       (76, 62),   -- 라즈베리
       (76, 61),   -- 딸기
       (76, 66),   -- 크랜베리
       (76, 63),   -- 붉은자두
       (76, 109),  -- 후추
       (76, 103),  -- 감초
       (76, 104),  -- 계피
       (76, 6),    -- 민트
       (76, 80),   -- 가죽
       (76, 93),   -- 코코아
       (76, 40),   -- 타르
       (76, 19),   -- 돌
       (76, 24),   -- 버섯
       (76, 29),   -- 숲바닥
       (76, 26),   -- 분필
       (76, 30),   -- 야생고기
       (76, 31),   -- 연필심
       (76, 38),   -- 치즈
       (76, 39),   -- 크림
       (76, 76),   -- 바나나
       (76, 59),   -- 무화과
       (76, 58),   -- 건포도
       (76, 60),   -- 용과
       (76, 52),   -- 제비꽃
       (76, 53),   -- 포푸리
       (76, 45),   -- 아카시아
       (76, 43),   -- 라벤더
       (76, 57),   -- 청배
       (76, 101),  -- 사과
       (76, 100),  -- 복숭아
       (76, 72),   -- 자몽
       (76, 69),   -- 레몬
       (76, 78),   -- 파인애플
       (77, 83),   -- 바닐라
       (77, 89),   -- 초콜릿
       (77, 82),   -- 담배
       (77, 86),   -- 삼나무
       (77, 91),   -- 커피
       (77, 94),   -- 콜라
       (77, 90),   -- 캐러멜
       (77, 107),  -- 정향
       (77, 25),   -- 버터
       (77, 88),   -- 에스프레소
       (77, 87),   -- 시가박스
       (77, 106),  -- 육두구
       (77, 95),   -- 파이프담배
       (77, 84),   -- 백단
       (77, 1),    -- 블랙체리
       (77, 98),   -- 블루베리
       (77, 4),    -- 자두
       (77, 3),    -- 올리브
       (77, 2),    -- 오디
       (77, 62),   -- 라즈베리
       (77, 61),   -- 딸기
       (77, 66),   -- 크랜베리
       (77, 65),   -- 체리
       (77, 64),   -- 석류
       (77, 63),   -- 붉은자두
       (77, 9),    -- 아몬드
       (77, 97),   -- 흑설탕
       (77, 96),   -- 헤이즐넛
       (77, 109),  -- 후추
       (77, 103),  -- 감초
       (77, 104),  -- 계피
       (77, 8),    -- 세이지
       (77, 6),    -- 민트
       (77, 11),   -- 유칼립투스
       (77, 10),   -- 오레가노
       (77, 14),   -- 할라피뇨
       (77, 108),  -- 팔각
       (77, 105),  -- 붉은고추
       (77, 80),   -- 가죽
       (77, 93),   -- 코코아
       (77, 19),   -- 돌
       (77, 24),   -- 버섯
       (77, 18),   -- 꿀
       (77, 40),   -- 타르
       (77, 31),   -- 연필심
       (77, 29),   -- 숲바닥
       (77, 30),   -- 야생고기
       (77, 26),   -- 분필
       (77, 36),   -- 젖은자갈
       (77, 28),   -- 석연슬레이트
       (77, 32),   -- 염분
       (77, 23),   -- 반창고
       (77, 42),   -- 훈제육
       (77, 33),   -- 절인고기
       (77, 27),   -- 생강
       (77, 59),   -- 무화과
       (77, 58),   -- 건포도
       (77, 38),   -- 치즈
       (77, 39),   -- 크림
       (77, 76),   -- 바나나
       (77, 17),   -- 구운빵
       (77, 13),   -- 피망
       (77, 67),   -- 토마토
       (77, 5),    -- 구스베리
       (77, 52),   -- 제비꽃
       (77, 43),   -- 라벤더
       (77, 54),   -- 히비스커스
       (77, 48),   -- 자스민
       (77, 53),   -- 포푸리
       (77, 101),  -- 사과
       (77, 102),  -- 살구
       (77, 57),   -- 청배
       (77, 100),  -- 복숭아
       (77, 69),   -- 레몬
       (77, 71),   -- 오렌지
       (77, 72),   -- 자몽
       (77, 70),   -- 마멀레이드
       (77, 77),   -- 키위
       (77, 78),   -- 파인애플
       (77, 73),   -- 구아바
       (78, 83),   -- 바닐라
       (78, 89),   -- 초콜릿
       (78, 82),   -- 담배
       (78, 91),   -- 커피
       (78, 90),   -- 캐러멜
       (78, 86),   -- 삼나무
       (78, 107),  -- 정향
       (78, 25),   -- 버터
       (78, 87),   -- 시가박스
       (78, 88),   -- 에스프레소
       (78, 94),   -- 콜라
       (78, 106),  -- 육두구
       (78, 92),   -- 코코넛
       (78, 98),   -- 블루베리
       (78, 1),    -- 블랙체리
       (78, 4),    -- 자두
       (78, 2),    -- 오디
       (78, 97),   -- 흑설탕
       (78, 96),   -- 헤이즐넛
       (78, 9),    -- 아몬드
       (78, 109),  -- 후추
       (78, 103),  -- 감초
       (78, 104),  -- 계피
       (78, 6),    -- 민트
       (78, 11),   -- 유칼립투스
       (78, 8),    -- 세이지
       (78, 14),   -- 할라피뇨
       (78, 10),   -- 오레가노
       (78, 105),  -- 붉은고추
       (78, 108),  -- 팔각
       (78, 80),   -- 가죽
       (78, 93),   -- 코코아
       (78, 24),   -- 버섯
       (78, 19),   -- 돌
       (78, 18),   -- 꿀
       (78, 40),   -- 타르
       (78, 30),   -- 야생고기
       (78, 26),   -- 분필
       (78, 29),   -- 숲바닥
       (78, 27),   -- 생강
       (78, 28),   -- 석연슬레이트
       (78, 32),   -- 염분
       (78, 41),   -- 화분흙
       (78, 20),   -- 마른낙엽
       (78, 33),   -- 절인고기
       (78, 62),   -- 라즈베리
       (78, 61),   -- 딸기
       (78, 65),   -- 체리
       (78, 66),   -- 크랜베리
       (78, 64),   -- 석류
       (78, 63),   -- 붉은자두
       (78, 59),   -- 무화과
       (78, 58),   -- 건포도
       (78, 39),   -- 크림
       (78, 38),   -- 치즈
       (78, 76),   -- 바나나
       (78, 52),   -- 제비꽃
       (78, 43),   -- 라벤더
       (78, 54),   -- 히비스커스
       (78, 53),   -- 포푸리
       (78, 44),   -- 백합
       (78, 48),   -- 자스민
       (78, 13),   -- 피망
       (78, 67),   -- 토마토
       (78, 69),   -- 레몬
       (78, 71),   -- 오렌지
       (78, 72),   -- 자몽
       (78, 101),  -- 사과
       (78, 100),  -- 복숭아
       (78, 57),   -- 청배
       (78, 102),  -- 살구
       (79, 83),   -- 바닐라
       (79, 89),   -- 초콜릿
       (79, 82),   -- 담배
       (79, 107),  -- 정향
       (79, 90),   -- 캐러멜
       (79, 86),   -- 삼나무
       (79, 106),  -- 육두구
       (79, 91),   -- 커피
       (79, 94),   -- 콜라
       (79, 25),   -- 버터
       (79, 87),   -- 시가박스
       (79, 95),   -- 파이프담배
       (79, 88),   -- 에스프레소
       (79, 104),  -- 계피
       (79, 109),  -- 후추
       (79, 103),  -- 감초
       (79, 6),    -- 민트
       (79, 11),   -- 유칼립투스
       (79, 8),    -- 세이지
       (79, 10),   -- 오레가노
       (79, 108),  -- 팔각
       (79, 1),    -- 블랙체리
       (79, 98),   -- 블루베리
       (79, 4),    -- 자두
       (79, 3),    -- 올리브
       (79, 9),    -- 아몬드
       (79, 85),   -- 브리오슈
       (79, 96),   -- 헤이즐넛
       (79, 80),   -- 가죽
       (79, 93),   -- 코코아
       (79, 18),   -- 꿀
       (79, 24),   -- 버섯
       (79, 29),   -- 숲바닥
       (79, 19),   -- 돌
       (79, 30),   -- 야생고기
       (79, 42),   -- 훈제육
       (79, 27),   -- 생강
       (79, 62),   -- 라즈베리
       (79, 66),   -- 크랜베리
       (79, 61),   -- 딸기
       (79, 63),   -- 붉은자두
       (79, 65),   -- 체리
       (79, 64),   -- 석류
       (79, 39),   -- 크림
       (79, 38),   -- 치즈
       (79, 58),   -- 건포도
       (79, 59),   -- 무화과
       (79, 67),   -- 토마토
       (79, 102),  -- 살구
       (79, 52),   -- 제비꽃
       (79, 43),   -- 라벤더
       (79, 70),   -- 마멀레이드
       (79, 71),   -- 오렌지
       (79, 79),   -- 풍선껌
       (80, 83),   -- 바닐라
       (80, 82),   -- 담배
       (80, 89),   -- 초콜릿
       (80, 98),   -- 블루베리
       (80, 4),    -- 자두
       (80, 1),    -- 블랙체리
       (80, 80),   -- 가죽
       (80, 93),   -- 코코아
       (80, 22),   -- 밀랍
       (80, 40),   -- 타르
       (80, 66),   -- 크랜베리
       (80, 65),   -- 체리
       (80, 62),   -- 라즈베리
       (80, 61),   -- 딸기
       (80, 11),   -- 유칼립투스
       (80, 38),   -- 치즈
       (80, 55),   -- 라임
       (80, 69),   -- 레몬
       (81, 83),   -- 바닐라
       (81, 89),   -- 초콜릿
       (81, 82),   -- 담배
       (81, 91),   -- 커피
       (81, 90),   -- 캐러멜
       (81, 86),   -- 삼나무
       (81, 88),   -- 에스프레소
       (81, 107),  -- 정향
       (81, 94),   -- 콜라
       (81, 25),   -- 버터
       (81, 106),  -- 육두구
       (81, 87),   -- 시가박스
       (81, 92),   -- 코코넛
       (81, 84),   -- 백단
       (81, 95),   -- 파이프담배
       (81, 98),   -- 블루베리
       (81, 1),    -- 블랙체리
       (81, 4),    -- 자두
       (81, 2),    -- 오디
       (81, 3),    -- 올리브
       (81, 97),   -- 흑설탕
       (81, 9),    -- 아몬드
       (81, 96),   -- 헤이즐넛
       (81, 85),   -- 브리오슈
       (81, 62),   -- 라즈베리
       (81, 61),   -- 딸기
       (81, 66),   -- 크랜베리
       (81, 65),   -- 체리
       (81, 64),   -- 석류
       (81, 63),   -- 붉은자두
       (81, 109),  -- 후추
       (81, 103),  -- 감초
       (81, 104),  -- 계피
       (81, 8),    -- 세이지
       (81, 6),    -- 민트
       (81, 11),   -- 유칼립투스
       (81, 108),  -- 팔각
       (81, 14),   -- 할라피뇨
       (81, 10),   -- 오레가노
       (81, 80),   -- 가죽
       (81, 93),   -- 코코아
       (81, 40),   -- 타르
       (81, 19),   -- 돌
       (81, 24),   -- 버섯
       (81, 30),   -- 야생고기
       (81, 18),   -- 꿀
       (81, 29),   -- 숲바닥
       (81, 26),   -- 분필
       (81, 31),   -- 연필심
       (81, 32),   -- 염분
       (81, 42),   -- 훈제육
       (81, 33),   -- 절인고기
       (81, 41),   -- 화분흙
       (81, 27),   -- 생강
       (81, 28),   -- 석연슬레이트
       (81, 36),   -- 젖은자갈
       (81, 39),   -- 크림
       (81, 38),   -- 치즈
       (81, 76),   -- 바나나
       (81, 59),   -- 무화과
       (81, 58),   -- 건포도
       (81, 52),   -- 제비꽃
       (81, 43),   -- 라벤더
       (81, 53),   -- 포푸리
       (81, 45),   -- 아카시아
       (81, 54),   -- 히비스커스
       (81, 67),   -- 토마토
       (81, 5),    -- 구스베리
       (81, 70),   -- 마멀레이드
       (81, 71),   -- 오렌지
       (81, 69),   -- 레몬
       (81, 68),   -- 귤
       (81, 55),   -- 라임
       (81, 101),  -- 사과
       (81, 102),  -- 살구
       (81, 57),   -- 청배
       (81, 75),   -- 망고
       (81, 79),   -- 풍선껌
       (81, 77),   -- 키위
       (82, 83),   -- 바닐라
       (82, 82),   -- 담배
       (82, 89),   -- 초콜릿
       (82, 86),   -- 삼나무
       (82, 91),   -- 커피
       (82, 107),  -- 정향
       (82, 25),   -- 버터
       (82, 94),   -- 콜라
       (82, 90),   -- 캐러멜
       (82, 88),   -- 에스프레소
       (82, 106),  -- 육두구
       (82, 92),   -- 코코넛
       (82, 87),   -- 시가박스
       (82, 95),   -- 파이프담배
       (82, 84),   -- 백단
       (82, 1),    -- 블랙체리
       (82, 98),   -- 블루베리
       (82, 4),    -- 자두
       (82, 2),    -- 오디
       (82, 9),    -- 아몬드
       (82, 97),   -- 흑설탕
       (82, 80),   -- 가죽
       (82, 93),   -- 코코아
       (82, 40),   -- 타르
       (82, 18),   -- 꿀
       (82, 19),   -- 돌
       (82, 26),   -- 분필
       (82, 24),   -- 버섯
       (82, 29),   -- 숲바닥
       (82, 27),   -- 생강
       (82, 42),   -- 훈제육
       (82, 30),   -- 야생고기
       (82, 31),   -- 연필심
       (82, 32),   -- 염분
       (82, 41),   -- 화분흙
       (82, 62),   -- 라즈베리
       (82, 61),   -- 딸기
       (82, 64),   -- 석류
       (82, 66),   -- 크랜베리
       (82, 65),   -- 체리
       (82, 63),   -- 붉은자두
       (82, 109),  -- 후추
       (82, 103),  -- 감초
       (82, 104),  -- 계피
       (82, 11),   -- 유칼립투스
       (82, 6),    -- 민트
       (82, 14),   -- 할라피뇨
       (82, 10),   -- 오레가노
       (82, 8),    -- 세이지
       (82, 59),   -- 무화과
       (82, 58),   -- 건포도
       (82, 38),   -- 치즈
       (82, 39),   -- 크림
       (82, 52),   -- 제비꽃
       (82, 43),   -- 라벤더
       (82, 54),   -- 히비스커스
       (82, 47),   -- 인동덩굴
       (82, 67),   -- 토마토
       (82, 13),   -- 피망
       (82, 69),   -- 레몬
       (82, 71),   -- 오렌지
       (82, 70),   -- 마멀레이드
       (82, 55),   -- 라임
       (82, 101),  -- 사과
       (82, 102),  -- 살구
       (82, 75),   -- 망고
       (82, 77),   -- 키위
       (82, 73),   -- 구아바
       (83, 83),   -- 바닐라
       (83, 89),   -- 초콜릿
       (83, 82),   -- 담배
       (83, 94),   -- 콜라
       (83, 86),   -- 삼나무
       (83, 90),   -- 캐러멜
       (83, 91),   -- 커피
       (83, 107),  -- 정향
       (83, 25),   -- 버터
       (83, 92),   -- 코코넛
       (83, 88),   -- 에스프레소
       (83, 106),  -- 육두구
       (83, 87),   -- 시가박스
       (83, 98),   -- 블루베리
       (83, 1),    -- 블랙체리
       (83, 4),    -- 자두
       (83, 2),    -- 오디
       (83, 3),    -- 올리브
       (83, 109),  -- 후추
       (83, 104),  -- 계피
       (83, 103),  -- 감초
       (83, 6),    -- 민트
       (83, 108),  -- 팔각
       (83, 11),   -- 유칼립투스
       (83, 10),   -- 오레가노
       (83, 97),   -- 흑설탕
       (83, 85),   -- 브리오슈
       (83, 62),   -- 라즈베리
       (83, 61),   -- 딸기
       (83, 66),   -- 크랜베리
       (83, 63),   -- 붉은자두
       (83, 65),   -- 체리
       (83, 64),   -- 석류
       (83, 80),   -- 가죽
       (83, 93),   -- 코코아
       (83, 19),   -- 돌
       (83, 24),   -- 버섯
       (83, 30),   -- 야생고기
       (83, 29),   -- 숲바닥
       (83, 18),   -- 꿀
       (83, 32),   -- 염분
       (83, 40),   -- 타르
       (83, 39),   -- 크림
       (83, 38),   -- 치즈
       (83, 76),   -- 바나나
       (83, 58),   -- 건포도
       (83, 59),   -- 무화과
       (83, 52),   -- 제비꽃
       (83, 53),   -- 포푸리
       (83, 43),   -- 라벤더
       (83, 102),  -- 살구
       (83, 101),  -- 사과
       (83, 57),   -- 청배
       (83, 67),   -- 토마토
       (83, 13),   -- 피망
       (83, 72),   -- 자몽
       (84, 1),    -- 블랙체리
       (84, 98),   -- 블루베리
       (84, 4),    -- 자두
       (84, 83),   -- 바닐라
       (84, 89),   -- 초콜릿
       (84, 107),  -- 정향
       (84, 94),   -- 콜라
       (84, 106),  -- 육두구
       (84, 109),  -- 후추
       (84, 103),  -- 감초
       (84, 104),  -- 계피
       (84, 9),    -- 아몬드
       (84, 62),   -- 라즈베리
       (84, 61),   -- 딸기
       (84, 93),   -- 코코아
       (84, 80),   -- 가죽
       (84, 19),   -- 돌
       (84, 59),   -- 무화과
       (84, 68),   -- 귤
       (85, 1),    -- 블랙체리
       (85, 62),   -- 라즈베리
       (85, 65),   -- 체리
       (85, 109),  -- 후추
       (85, 83),   -- 바닐라
       (85, 29),   -- 숲바닥
       (86, 83),   -- 바닐라
       (86, 89),   -- 초콜릿
       (86, 94),   -- 콜라
       (86, 86),   -- 삼나무
       (86, 107),  -- 정향
       (86, 1),    -- 블랙체리
       (86, 61),   -- 딸기
       (86, 80),   -- 가죽
       (86, 28),   -- 석연슬레이트
       (86, 104),  -- 계피
       (87, 1),    -- 블랙체리
       (87, 98),   -- 블루베리
       (87, 82),   -- 담배
       (87, 83),   -- 바닐라
       (87, 25),   -- 버터
       (87, 89),   -- 초콜릿
       (87, 65),   -- 체리
       (87, 62),   -- 라즈베리
       (87, 61),   -- 딸기
       (87, 109),  -- 후추
       (87, 104),  -- 계피
       (87, 103),  -- 감초
       (87, 10),   -- 오레가노
       (87, 11),   -- 유칼립투스
       (87, 80),   -- 가죽
       (87, 24),   -- 버섯
       (87, 38),   -- 치즈
       (87, 43),   -- 라벤더
       (88, 83),   -- 바닐라
       (88, 82),   -- 담배
       (88, 89),   -- 초콜릿
       (88, 86),   -- 삼나무
       (88, 91),   -- 커피
       (88, 84),   -- 백단
       (88, 107),  -- 정향
       (88, 25),   -- 버터
       (88, 94),   -- 콜라
       (88, 88),   -- 에스프레소
       (88, 90),   -- 캐러멜
       (88, 87),   -- 시가박스
       (88, 1),    -- 블랙체리
       (88, 98),   -- 블루베리
       (88, 4),    -- 자두
       (88, 3),    -- 올리브
       (88, 80),   -- 가죽
       (88, 93),   -- 코코아
       (88, 29),   -- 숲바닥
       (88, 24),   -- 버섯
       (88, 40),   -- 타르
       (88, 62),   -- 라즈베리
       (88, 61),   -- 딸기
       (88, 66),   -- 크랜베리
       (88, 64),   -- 석류
       (88, 109),  -- 후추
       (88, 103),  -- 감초
       (88, 104),  -- 계피
       (88, 11),   -- 유칼립투스
       (88, 8),    -- 세이지
       (88, 6),    -- 민트
       (88, 39),   -- 크림
       (88, 38),   -- 치즈
       (88, 71),   -- 오렌지
       (88, 72),   -- 자몽
       (88, 52),   -- 제비꽃
       (88, 5),    -- 구스베리
       (89, 83),   -- 바닐라
       (89, 86),   -- 삼나무
       (89, 89),   -- 초콜릿
       (89, 82),   -- 담배
       (89, 91),   -- 커피
       (89, 87),   -- 시가박스
       (89, 107),  -- 정향
       (89, 25),   -- 버터
       (89, 90),   -- 캐러멜
       (89, 106),  -- 육두구
       (89, 88),   -- 에스프레소
       (89, 94),   -- 콜라
       (89, 98),   -- 블루베리
       (89, 1),    -- 블랙체리
       (89, 4),    -- 자두
       (89, 3),    -- 올리브
       (89, 97),   -- 흑설탕
       (89, 9),    -- 아몬드
       (89, 103),  -- 감초
       (89, 109),  -- 후추
       (89, 104),  -- 계피
       (89, 6),    -- 민트
       (89, 8),    -- 세이지
       (89, 11),   -- 유칼립투스
       (89, 108),  -- 팔각
       (89, 10),   -- 오레가노
       (89, 80),   -- 가죽
       (89, 93),   -- 코코아
       (89, 24),   -- 버섯
       (89, 40),   -- 타르
       (89, 26),   -- 분필
       (89, 31),   -- 연필심
       (89, 28),   -- 석연슬레이트
       (89, 18),   -- 꿀
       (89, 29),   -- 숲바닥
       (89, 32),   -- 염분
       (89, 36),   -- 젖은자갈
       (89, 19),   -- 돌
       (89, 62),   -- 라즈베리
       (89, 61),   -- 딸기
       (89, 64),   -- 석류
       (89, 66),   -- 크랜베리
       (89, 65),   -- 체리
       (89, 38),   -- 치즈
       (89, 39),   -- 크림
       (89, 59),   -- 무화과
       (89, 58),   -- 건포도
       (89, 52),   -- 제비꽃
       (89, 43),   -- 라벤더
       (89, 48),   -- 자스민
       (89, 53),   -- 포푸리
       (89, 13),   -- 피망
       (89, 69),   -- 레몬
       (89, 71),   -- 오렌지
       (90, 83),   -- 바닐라
       (90, 89),   -- 초콜릿
       (90, 82),   -- 담배
       (90, 94),   -- 콜라
       (90, 90),   -- 캐러멜
       (90, 25),   -- 버터
       (90, 86),   -- 삼나무
       (90, 91),   -- 커피
       (90, 107),  -- 정향
       (90, 106),  -- 육두구
       (90, 88),   -- 에스프레소
       (90, 87),   -- 시가박스
       (90, 84),   -- 백단
       (90, 95),   -- 파이프담배
       (90, 98),   -- 블루베리
       (90, 1),    -- 블랙체리
       (90, 4),    -- 자두
       (90, 3),    -- 올리브
       (90, 2),    -- 오디
       (90, 97),   -- 흑설탕
       (90, 9),    -- 아몬드
       (90, 96),   -- 헤이즐넛
       (90, 62),   -- 라즈베리
       (90, 61),   -- 딸기
       (90, 66),   -- 크랜베리
       (90, 65),   -- 체리
       (90, 63),   -- 붉은자두
       (90, 64),   -- 석류
       (90, 109),  -- 후추
       (90, 103),  -- 감초
       (90, 104),  -- 계피
       (90, 6),    -- 민트
       (90, 11),   -- 유칼립투스
       (90, 8),    -- 세이지
       (90, 14),   -- 할라피뇨
       (90, 108),  -- 팔각
       (90, 80),   -- 가죽
       (90, 93),   -- 코코아
       (90, 24),   -- 버섯
       (90, 30),   -- 야생고기
       (90, 19),   -- 돌
       (90, 40),   -- 타르
       (90, 18),   -- 꿀
       (90, 28),   -- 석연슬레이트
       (90, 29),   -- 숲바닥
       (90, 26),   -- 분필
       (90, 42),   -- 훈제육
       (90, 32),   -- 염분
       (90, 31),   -- 연필심
       (90, 23),   -- 반창고
       (90, 58),   -- 건포도
       (90, 59),   -- 무화과
       (90, 38),   -- 치즈
       (90, 39),   -- 크림
       (90, 17),   -- 구운빵
       (90, 76),   -- 바나나
       (90, 52),   -- 제비꽃
       (90, 43),   -- 라벤더
       (90, 53),   -- 포푸리
       (90, 44),   -- 백합
       (90, 101),  -- 사과
       (90, 102),  -- 살구
       (90, 57),   -- 청배
       (90, 100),  -- 복숭아
       (90, 13),   -- 피망
       (90, 67),   -- 토마토
       (90, 69),   -- 레몬
       (90, 71),   -- 오렌지
       (90, 70),   -- 마멀레이드
       (90, 55),   -- 라임
       (90, 72),   -- 자몽
       (90, 79),   -- 풍선껌
       (90, 78),   -- 파인애플
       (90, 77),   -- 키위
       (91, 89),   -- 초콜릿
       (91, 83),   -- 바닐라
       (91, 82),   -- 담배
       (91, 86),   -- 삼나무
       (91, 90),   -- 캐러멜
       (91, 91),   -- 커피
       (91, 87),   -- 시가박스
       (91, 88),   -- 에스프레소
       (91, 107),  -- 정향
       (91, 25),   -- 버터
       (91, 92),   -- 코코넛
       (91, 98),   -- 블루베리
       (91, 1),    -- 블랙체리
       (91, 4),    -- 자두
       (91, 2),    -- 오디
       (91, 80),   -- 가죽
       (91, 19),   -- 돌
       (91, 93),   -- 코코아
       (91, 24),   -- 버섯
       (91, 40),   -- 타르
       (91, 18),   -- 꿀
       (91, 62),   -- 라즈베리
       (91, 61),   -- 딸기
       (91, 65),   -- 체리
       (91, 64),   -- 석류
       (91, 9),    -- 아몬드
       (91, 109),  -- 후추
       (91, 103),  -- 감초
       (91, 104),  -- 계피
       (91, 11),   -- 유칼립투스
       (91, 39),   -- 크림
       (91, 38),   -- 치즈
       (91, 52),   -- 제비꽃
       (91, 100),  -- 복숭아
       (91, 57),   -- 청배
       (91, 75),   -- 망고
       (92, 80),   -- 가죽
       (92, 19),   -- 돌
       (92, 29),   -- 숲바닥
       (92, 93),   -- 코코아
       (92, 30),   -- 야생고기
       (92, 24),   -- 버섯
       (92, 107),  -- 정향
       (92, 82),   -- 담배
       (92, 89),   -- 초콜릿
       (92, 98),   -- 블루베리
       (92, 1),    -- 블랙체리
       (92, 62),   -- 라즈베리
       (92, 61),   -- 딸기
       (92, 64),   -- 석류
       (92, 63),   -- 붉은자두
       (92, 66),   -- 크랜베리
       (92, 109),  -- 후추
       (92, 103),  -- 감초
       (92, 104),  -- 계피
       (92, 6),    -- 민트
       (92, 43),   -- 라벤더
       (92, 52),   -- 제비꽃
       (92, 39),   -- 크림
       (92, 38),   -- 치즈
       (92, 59),   -- 무화과
       (92, 58),   -- 건포도
       (92, 101),  -- 사과
       (92, 102),  -- 살구
       (93, 86),   -- 삼나무
       (93, 83),   -- 바닐라
       (93, 107),  -- 정향
       (93, 94),   -- 콜라
       (93, 89),   -- 초콜릿
       (93, 106),  -- 육두구
       (93, 87),   -- 시가박스
       (93, 92),   -- 코코넛
       (93, 61),   -- 딸기
       (93, 62),   -- 라즈베리
       (93, 66),   -- 크랜베리
       (93, 64),   -- 석류
       (93, 97),   -- 흑설탕
       (93, 109),  -- 후추
       (93, 6),    -- 민트
       (93, 104),  -- 계피
       (93, 80),   -- 가죽
       (93, 30),   -- 야생고기
       (93, 1),    -- 블랙체리
       (94, 86),   -- 삼나무
       (94, 82),   -- 담배
       (94, 107),  -- 정향
       (94, 89),   -- 초콜릿
       (94, 1),    -- 블랙체리
       (94, 80),   -- 가죽
       (94, 93),   -- 코코아
       (94, 31),   -- 연필심
       (94, 40),   -- 타르
       (94, 62),   -- 라즈베리
       (94, 65),   -- 체리
       (94, 109),  -- 후추
       (94, 103),  -- 감초
       (94, 67),   -- 토마토
       (94, 39),   -- 크림
       (94, 71),   -- 오렌지
       (95, 89),   -- 초콜릿
       (95, 83),   -- 바닐라
       (95, 82),   -- 담배
       (95, 91),   -- 커피
       (95, 107),  -- 정향
       (95, 25),   -- 버터
       (95, 90),   -- 캐러멜
       (95, 94),   -- 콜라
       (95, 88),   -- 에스프레소
       (95, 86),   -- 삼나무
       (95, 106),  -- 육두구
       (95, 92),   -- 코코넛
       (95, 1),    -- 블랙체리
       (95, 98),   -- 블루베리
       (95, 4),    -- 자두
       (95, 2),    -- 오디
       (95, 62),   -- 라즈베리
       (95, 61),   -- 딸기
       (95, 66),   -- 크랜베리
       (95, 65),   -- 체리
       (95, 63),   -- 붉은자두
       (95, 64),   -- 석류
       (95, 97),   -- 흑설탕
       (95, 80),   -- 가죽
       (95, 93),   -- 코코아
       (95, 24),   -- 버섯
       (95, 32),   -- 염분
       (95, 19),   -- 돌
       (95, 28),   -- 석연슬레이트
       (95, 29),   -- 숲바닥
       (95, 33),   -- 절인고기
       (95, 40),   -- 타르
       (95, 18),   -- 꿀
       (95, 109),  -- 후추
       (95, 103),  -- 감초
       (95, 104),  -- 계피
       (95, 8),    -- 세이지
       (95, 6),    -- 민트
       (95, 14),   -- 할라피뇨
       (95, 11),   -- 유칼립투스
       (95, 39),   -- 크림
       (95, 38),   -- 치즈
       (95, 58),   -- 건포도
       (95, 59),   -- 무화과
       (95, 67),   -- 토마토
       (95, 13),   -- 피망
       (95, 5),    -- 구스베리
       (95, 52),   -- 제비꽃
       (95, 43),   -- 라벤더
       (95, 46),   -- 오렌지꽃
       (95, 70),   -- 마멀레이드
       (95, 71),   -- 오렌지
       (95, 101),  -- 사과
       (96, 1),    -- 블랙체리
       (96, 98),   -- 블루베리
       (96, 4),    -- 자두
       (96, 83),   -- 바닐라
       (96, 82),   -- 담배
       (96, 89),   -- 초콜릿
       (96, 86),   -- 삼나무
       (96, 94),   -- 콜라
       (96, 107),  -- 정향
       (96, 25),   -- 버터
       (96, 109),  -- 후추
       (96, 104),  -- 계피
       (96, 103),  -- 감초
       (96, 8),    -- 세이지
       (96, 62),   -- 라즈베리
       (96, 66),   -- 크랜베리
       (96, 61),   -- 딸기
       (96, 63),   -- 붉은자두
       (96, 64),   -- 석류
       (96, 80),   -- 가죽
       (96, 93),   -- 코코아
       (96, 52),   -- 제비꽃
       (96, 54),   -- 히비스커스
       (96, 67),   -- 토마토
       (97, 83),   -- 바닐라
       (97, 82),   -- 담배
       (97, 89),   -- 초콜릿
       (97, 86),   -- 삼나무
       (97, 91),   -- 커피
       (97, 25),   -- 버터
       (97, 107),  -- 정향
       (97, 88),   -- 에스프레소
       (97, 94),   -- 콜라
       (97, 95),   -- 파이프담배
       (97, 87),   -- 시가박스
       (97, 90),   -- 캐러멜
       (97, 1),    -- 블랙체리
       (97, 98),   -- 블루베리
       (97, 80),   -- 가죽
       (97, 93),   -- 코코아
       (97, 27),   -- 생강
       (97, 40),   -- 타르
       (97, 29),   -- 숲바닥
       (97, 62),   -- 라즈베리
       (97, 61),   -- 딸기
       (97, 66),   -- 크랜베리
       (97, 65),   -- 체리
       (97, 109),  -- 후추
       (97, 6),    -- 민트
       (97, 103),  -- 감초
       (97, 38),   -- 치즈
       (97, 39),   -- 크림
       (97, 59),   -- 무화과
       (97, 58),   -- 건포도
       (97, 13),   -- 피망
       (97, 67),   -- 토마토
       (97, 43),   -- 라벤더
       (97, 46),   -- 오렌지꽃
       (97, 52),   -- 제비꽃
       (97, 77),   -- 키위
       (98, 61),   -- 딸기
       (98, 62),   -- 라즈베리
       (98, 66),   -- 크랜베리
       (98, 65),   -- 체리
       (98, 63),   -- 붉은자두
       (98, 64),   -- 석류
       (98, 83),   -- 바닐라
       (98, 94),   -- 콜라
       (98, 89),   -- 초콜릿
       (98, 82),   -- 담배
       (98, 86),   -- 삼나무
       (98, 25),   -- 버터
       (98, 107),  -- 정향
       (98, 106),  -- 육두구
       (98, 91),   -- 커피
       (98, 87),   -- 시가박스
       (98, 92),   -- 코코넛
       (98, 90),   -- 캐러멜
       (98, 95),   -- 파이프담배
       (98, 9),    -- 아몬드
       (98, 97),   -- 흑설탕
       (98, 80),   -- 가죽
       (98, 24),   -- 버섯
       (98, 29),   -- 숲바닥
       (98, 19),   -- 돌
       (98, 93),   -- 코코아
       (98, 40),   -- 타르
       (98, 26),   -- 분필
       (98, 28),   -- 석연슬레이트
       (98, 30),   -- 야생고기
       (98, 31),   -- 연필심
       (98, 36),   -- 젖은자갈
       (98, 18),   -- 꿀
       (98, 32),   -- 염분
       (98, 27),   -- 생강
       (98, 41),   -- 화분흙
       (98, 1),    -- 블랙체리
       (98, 98),   -- 블루베리
       (98, 4),    -- 자두
       (98, 3),    -- 올리브
       (98, 109),  -- 후추
       (98, 103),  -- 감초
       (98, 104),  -- 계피
       (98, 6),    -- 민트
       (98, 8),    -- 세이지
       (98, 11),   -- 유칼립투스
       (98, 10),   -- 오레가노
       (98, 38),   -- 치즈
       (98, 39),   -- 크림
       (98, 59),   -- 무화과
       (98, 58),   -- 건포도
       (98, 67),   -- 토마토
       (98, 52),   -- 제비꽃
       (98, 54),   -- 히비스커스
       (98, 48),   -- 자스민
       (98, 43),   -- 라벤더
       (98, 101),  -- 사과
       (98, 100),  -- 복숭아
       (98, 102),  -- 살구
       (98, 69),   -- 레몬
       (98, 55),   -- 라임
       (98, 71),   -- 오렌지
       (98, 74),   -- 리치
       (98, 73),   -- 구아바
       (99, 83),   -- 바닐라
       (99, 89),   -- 초콜릿
       (99, 82),   -- 담배
       (99, 86),   -- 삼나무
       (99, 91),   -- 커피
       (99, 107),  -- 정향
       (99, 94),   -- 콜라
       (99, 25),   -- 버터
       (99, 90),   -- 캐러멜
       (99, 106),  -- 육두구
       (99, 92),   -- 코코넛
       (99, 88),   -- 에스프레소
       (99, 95),   -- 파이프담배
       (99, 87),   -- 시가박스
       (99, 1),    -- 블랙체리
       (99, 98),   -- 블루베리
       (99, 4),    -- 자두
       (99, 3),    -- 올리브
       (99, 2),    -- 오디
       (99, 97),   -- 흑설탕
       (99, 9),    -- 아몬드
       (99, 62),   -- 라즈베리
       (99, 61),   -- 딸기
       (99, 66),   -- 크랜베리
       (99, 65),   -- 체리
       (99, 64),   -- 석류
       (99, 63),   -- 붉은자두
       (99, 80),   -- 가죽
       (99, 93),   -- 코코아
       (99, 24),   -- 버섯
       (99, 19),   -- 돌
       (99, 40),   -- 타르
       (99, 18),   -- 꿀
       (99, 30),   -- 야생고기
       (99, 32),   -- 염분
       (99, 31),   -- 연필심
       (99, 20),   -- 마른낙엽
       (99, 28),   -- 석연슬레이트
       (99, 27),   -- 생강
       (99, 29),   -- 숲바닥
       (99, 26),   -- 분필
       (99, 33),   -- 절인고기
       (99, 109),  -- 후추
       (99, 103),  -- 감초
       (99, 104),  -- 계피
       (99, 6),    -- 민트
       (99, 11),   -- 유칼립투스
       (99, 8),    -- 세이지
       (99, 14),   -- 할라피뇨
       (99, 38),   -- 치즈
       (99, 39),   -- 크림
       (99, 76),   -- 바나나
       (99, 58),   -- 건포도
       (99, 59),   -- 무화과
       (99, 67),   -- 토마토
       (99, 13),   -- 피망
       (99, 52),   -- 제비꽃
       (99, 43),   -- 라벤더
       (99, 51),   -- 제라늄
       (99, 44),   -- 백합
       (99, 101),  -- 사과
       (99, 57),   -- 청배
       (99, 100),  -- 복숭아
       (99, 99),   -- 모과
       (99, 102),  -- 살구
       (99, 70),   -- 마멀레이드
       (99, 69),   -- 레몬
       (99, 71),   -- 오렌지
       (99, 73),   -- 구아바
       (99, 79),   -- 풍선껌
       (100, 1),   -- 블랙체리
       (100, 98),  -- 블루베리
       (100, 4),   -- 자두
       (100, 2),   -- 오디
       (100, 83),  -- 바닐라
       (100, 89),  -- 초콜릿
       (100, 82),  -- 담배
       (100, 25),  -- 버터
       (100, 86),  -- 삼나무
       (100, 107), -- 정향
       (100, 91),  -- 커피
       (100, 90),  -- 캐러멜
       (100, 94),  -- 콜라
       (100, 106), -- 육두구
       (100, 87),  -- 시가박스
       (100, 92),  -- 코코넛
       (100, 84),  -- 백단
       (100, 95),  -- 파이프담배
       (100, 88),  -- 에스프레소
       (100, 62),  -- 라즈베리
       (100, 61),  -- 딸기
       (100, 66),  -- 크랜베리
       (100, 65),  -- 체리
       (100, 64),  -- 석류
       (100, 63),  -- 붉은자두
       (100, 97),  -- 흑설탕
       (100, 9),   -- 아몬드
       (100, 96),  -- 헤이즐넛
       (100, 85),  -- 브리오슈
       (100, 109), -- 후추
       (100, 103), -- 감초
       (100, 104), -- 계피
       (100, 6),   -- 민트
       (100, 11),  -- 유칼립투스
       (100, 8),   -- 세이지
       (100, 80),  -- 가죽
       (100, 93),  -- 코코아
       (100, 24),  -- 버섯
       (100, 19),  -- 돌
       (100, 29),  -- 숲바닥
       (100, 30),  -- 야생고기
       (100, 28),  -- 석연슬레이트
       (100, 26),  -- 분필
       (100, 40),  -- 타르
       (100, 32),  -- 염분
       (100, 18),  -- 꿀
       (100, 42),  -- 훈제육
       (100, 41),  -- 화분흙
       (100, 27),  -- 생강
       (100, 36),  -- 젖은자갈
       (100, 38),  -- 치즈
       (100, 39),  -- 크림
       (100, 76),  -- 바나나
       (100, 58),  -- 건포도
       (100, 59),  -- 무화과
       (100, 67),  -- 토마토
       (100, 13),  -- 피망
       (100, 5),   -- 구스베리
       (100, 52),  -- 제비꽃
       (100, 43),  -- 라벤더
       (100, 101), -- 사과
       (100, 102), -- 살구
       (100, 100), -- 복숭아
       (100, 69),  -- 레몬
       (100, 71),  -- 오렌지
       (100, 55),  -- 라임
       (100, 78),  -- 파인애플
       (100, 77),  -- 키위
       (100, 79),  -- 풍선껌
       (101, 89),  -- 초콜릿
       (101, 91),  -- 커피
       (101, 83),  -- 바닐라
       (101, 82),  -- 담배
       (101, 90),  -- 캐러멜
       (101, 88),  -- 에스프레소
       (101, 25),  -- 버터
       (101, 107), -- 정향
       (101, 86),  -- 삼나무
       (101, 94),  -- 콜라
       (101, 106), -- 육두구
       (101, 95),  -- 파이프담배
       (101, 92),  -- 코코넛
       (101, 87),  -- 시가박스
       (101, 98),  -- 블루베리
       (101, 1),   -- 블랙체리
       (101, 4),   -- 자두
       (101, 2),   -- 오디
       (101, 3),   -- 올리브
       (101, 9),   -- 아몬드
       (101, 97),  -- 흑설탕
       (101, 96),  -- 헤이즐넛
       (101, 80),  -- 가죽
       (101, 93),  -- 코코아
       (101, 19),  -- 돌
       (101, 24),  -- 버섯
       (101, 30),  -- 야생고기
       (101, 32),  -- 염분
       (101, 23),  -- 반창고
       (101, 18),  -- 꿀
       (101, 40),  -- 타르
       (101, 26),  -- 분필
       (101, 27),  -- 생강
       (101, 29),  -- 숲바닥
       (101, 62),  -- 라즈베리
       (101, 61),  -- 딸기
       (101, 64),  -- 석류
       (101, 66),  -- 크랜베리
       (101, 65),  -- 체리
       (101, 63),  -- 붉은자두
       (101, 109), -- 후추
       (101, 103), -- 감초
       (101, 104), -- 계피
       (101, 6),   -- 민트
       (101, 11),  -- 유칼립투스
       (101, 14),  -- 할라피뇨
       (101, 8),   -- 세이지
       (101, 38),  -- 치즈
       (101, 39),  -- 크림
       (101, 76),  -- 바나나
       (101, 17),  -- 구운빵
       (101, 58),  -- 건포도
       (101, 59),  -- 무화과
       (101, 67),  -- 토마토
       (101, 5),   -- 구스베리
       (101, 52),  -- 제비꽃
       (101, 47),  -- 인동덩굴
       (101, 43),  -- 라벤더
       (101, 101), -- 사과
       (101, 57),  -- 청배
       (101, 100), -- 복숭아
       (101, 102), -- 살구
       (101, 72),  -- 자몽
       (101, 69),  -- 레몬
       (101, 70),  -- 마멀레이드
       (101, 79),  -- 풍선껌
       (102, 83),  -- 바닐라
       (102, 89),  -- 초콜릿
       (102, 82),  -- 담배
       (102, 86),  -- 삼나무
       (102, 25),  -- 버터
       (102, 91),  -- 커피
       (102, 107), -- 정향
       (102, 94),  -- 콜라
       (102, 106), -- 육두구
       (102, 90),  -- 캐러멜
       (102, 87),  -- 시가박스
       (102, 88),  -- 에스프레소
       (102, 1),   -- 블랙체리
       (102, 98),  -- 블루베리
       (102, 4),   -- 자두
       (102, 3),   -- 올리브
       (102, 2),   -- 오디
       (102, 9),   -- 아몬드
       (102, 97),  -- 흑설탕
       (102, 96),  -- 헤이즐넛
       (102, 109), -- 후추
       (102, 104), -- 계피
       (102, 103), -- 감초
       (102, 6),   -- 민트
       (102, 11),  -- 유칼립투스
       (102, 14),  -- 할라피뇨
       (102, 62),  -- 라즈베리
       (102, 61),  -- 딸기
       (102, 66),  -- 크랜베리
       (102, 64),  -- 석류
       (102, 65),  -- 체리
       (102, 63),  -- 붉은자두
       (102, 80),  -- 가죽
       (102, 93),  -- 코코아
       (102, 30),  -- 야생고기
       (102, 24),  -- 버섯
       (102, 40),  -- 타르
       (102, 19),  -- 돌
       (102, 29),  -- 숲바닥
       (102, 31),  -- 연필심
       (102, 23),  -- 반창고
       (102, 32),  -- 염분
       (102, 33),  -- 절인고기
       (102, 38),  -- 치즈
       (102, 39),  -- 크림
       (102, 76),  -- 바나나
       (102, 58),  -- 건포도
       (102, 59),  -- 무화과
       (102, 13),  -- 피망
       (102, 67),  -- 토마토
       (102, 52),  -- 제비꽃
       (102, 43),  -- 라벤더
       (102, 101), -- 사과
       (102, 57),  -- 청배
       (102, 100), -- 복숭아
       (102, 70),  -- 마멀레이드
       (102, 74),  -- 리치
       (103, 98),  -- 블루베리
       (103, 1),   -- 블랙체리
       (103, 62),  -- 라즈베리
       (103, 109), -- 후추
       (103, 83),  -- 바닐라
       (103, 86),  -- 삼나무
       (103, 89),  -- 초콜릿
       (103, 91),  -- 커피
       (104, 83),  -- 바닐라
       (104, 89),  -- 초콜릿
       (104, 91),  -- 커피
       (104, 90),  -- 캐러멜
       (104, 82),  -- 담배
       (104, 25),  -- 버터
       (104, 107), -- 정향
       (104, 94),  -- 콜라
       (104, 86),  -- 삼나무
       (104, 106), -- 육두구
       (104, 92),  -- 코코넛
       (104, 88),  -- 에스프레소
       (104, 87),  -- 시가박스
       (104, 84),  -- 백단
       (104, 95),  -- 파이프담배
       (104, 97),  -- 흑설탕
       (104, 9),   -- 아몬드
       (104, 96),  -- 헤이즐넛
       (104, 109), -- 후추
       (104, 104), -- 계피
       (104, 103), -- 감초
       (104, 6),   -- 민트
       (104, 11),  -- 유칼립투스
       (104, 10),  -- 오레가노
       (104, 8),   -- 세이지
       (104, 108), -- 팔각
       (104, 62),  -- 라즈베리
       (104, 61),  -- 딸기
       (104, 65),  -- 체리
       (104, 66),  -- 크랜베리
       (104, 64),  -- 석류
       (104, 63),  -- 붉은자두
       (104, 1),   -- 블랙체리
       (104, 98),  -- 블루베리
       (104, 4),   -- 자두
       (104, 2),   -- 오디
       (104, 80),  -- 가죽
       (104, 93),  -- 코코아
       (104, 18),  -- 꿀
       (104, 19),  -- 돌
       (104, 24),  -- 버섯
       (104, 30),  -- 야생고기
       (104, 40),  -- 타르
       (104, 23),  -- 반창고
       (104, 29),  -- 숲바닥
       (104, 28),  -- 석연슬레이트
       (104, 32),  -- 염분
       (104, 27),  -- 생강
       (104, 26),  -- 분필
       (104, 20),  -- 마른낙엽
       (104, 38),  -- 치즈
       (104, 39),  -- 크림
       (104, 76),  -- 바나나
       (104, 17),  -- 구운빵
       (104, 58),  -- 건포도
       (104, 59),  -- 무화과
       (104, 60),  -- 용과
       (104, 67),  -- 토마토
       (104, 13),  -- 피망
       (104, 52),  -- 제비꽃
       (104, 53),  -- 포푸리
       (104, 43),  -- 라벤더
       (104, 44),  -- 백합
       (104, 54),  -- 히비스커스
       (104, 47),  -- 인동덩굴
       (104, 101), -- 사과
       (104, 102), -- 살구
       (104, 100), -- 복숭아
       (104, 57),  -- 청배
       (104, 71),  -- 오렌지
       (104, 69),  -- 레몬
       (104, 70),  -- 마멀레이드
       (104, 55),  -- 라임
       (104, 72),  -- 자몽
       (104, 79),  -- 풍선껌
       (104, 78),  -- 파인애플
       (104, 75),  -- 망고
       (107, 29),  -- 숲바닥
       (109, 80),  -- 가죽
       (109, 40),  -- 타르
       (109, 93),  -- 코코아
       (109, 24),  -- 버섯
       (109, 29),  -- 숲바닥
       (109, 31),  -- 연필심
       (109, 30),  -- 야생고기
       (109, 19),  -- 돌
       (109, 33),  -- 절인고기
       (109, 18),  -- 꿀
       (109, 26),  -- 분필
       (109, 82),  -- 담배
       (109, 86),  -- 삼나무
       (109, 83),  -- 바닐라
       (109, 91),  -- 커피
       (109, 89),  -- 초콜릿
       (109, 106), -- 육두구
       (109, 107), -- 정향
       (109, 88),  -- 에스프레소
       (109, 61),  -- 딸기
       (109, 62),  -- 라즈베리
       (109, 65),  -- 체리
       (109, 66),  -- 크랜베리
       (109, 63),  -- 붉은자두
       (109, 64),  -- 석류
       (109, 9),   -- 아몬드
       (109, 2),   -- 오디
       (109, 1),   -- 블랙체리
       (109, 98),  -- 블루베리
       (109, 103), -- 감초
       (109, 109), -- 후추
       (109, 104), -- 계피
       (109, 11),  -- 유칼립투스
       (109, 6),   -- 민트
       (109, 8),   -- 세이지
       (109, 52),  -- 제비꽃
       (109, 43),  -- 라벤더
       (109, 53),  -- 포푸리
       (109, 38),  -- 치즈
       (109, 58),  -- 건포도
       (109, 71),  -- 오렌지
       (109, 67),  -- 토마토
       (109, 102), -- 살구
       (110, 83),  -- 바닐라
       (110, 89),  -- 초콜릿
       (110, 82),  -- 담배
       (110, 86),  -- 삼나무
       (110, 107), -- 정향
       (110, 25),  -- 버터
       (110, 91),  -- 커피
       (110, 106), -- 육두구
       (110, 90),  -- 캐러멜
       (110, 87),  -- 시가박스
       (110, 88),  -- 에스프레소
       (110, 94),  -- 콜라
       (110, 92),  -- 코코넛
       (110, 84),  -- 백단
       (110, 95),  -- 파이프담배
       (110, 1),   -- 블랙체리
       (110, 98),  -- 블루베리
       (110, 4),   -- 자두
       (110, 2),   -- 오디
       (110, 3),   -- 올리브
       (110, 96),  -- 헤이즐넛
       (110, 9),   -- 아몬드
       (110, 97),  -- 흑설탕
       (110, 85),  -- 브리오슈
       (110, 62),  -- 라즈베리
       (110, 61),  -- 딸기
       (110, 66),  -- 크랜베리
       (110, 65),  -- 체리
       (110, 64),  -- 석류
       (110, 63),  -- 붉은자두
       (110, 109), -- 후추
       (110, 103), -- 감초
       (110, 104), -- 계피
       (110, 6),   -- 민트
       (110, 11),  -- 유칼립투스
       (110, 8),   -- 세이지
       (110, 10),  -- 오레가노
       (110, 108), -- 팔각
       (110, 80),  -- 가죽
       (110, 93),  -- 코코아
       (110, 24),  -- 버섯
       (110, 19),  -- 돌
       (110, 29),  -- 숲바닥
       (110, 40),  -- 타르
       (110, 26),  -- 분필
       (110, 30),  -- 야생고기
       (110, 18),  -- 꿀
       (110, 31),  -- 연필심
       (110, 32),  -- 염분
       (110, 27),  -- 생강
       (110, 33),  -- 절인고기
       (110, 36),  -- 젖은자갈
       (110, 28),  -- 석연슬레이트
       (110, 38),  -- 치즈
       (110, 39),  -- 크림
       (110, 76),  -- 바나나
       (110, 59),  -- 무화과
       (110, 58),  -- 건포도
       (110, 13),  -- 피망
       (110, 67),  -- 토마토
       (110, 52),  -- 제비꽃
       (110, 43),  -- 라벤더
       (110, 53),  -- 포푸리
       (110, 54),  -- 히비스커스
       (110, 69),  -- 레몬
       (110, 71),  -- 오렌지
       (110, 70),  -- 마멀레이드
       (110, 68),  -- 귤
       (110, 55),  -- 라임
       (110, 101), -- 사과
       (110, 57),  -- 청배
       (110, 102), -- 살구
       (110, 100), -- 복숭아
       (110, 99),  -- 모과
       (110, 77),  -- 키위
       (110, 75),  -- 망고
       (111, 83),  -- 바닐라
       (111, 86),  -- 삼나무
       (111, 91),  -- 커피
       (111, 82),  -- 담배
       (111, 89),  -- 초콜릿
       (111, 106), -- 육두구
       (111, 98),  -- 블루베리
       (111, 1),   -- 블랙체리
       (111, 109), -- 후추
       (111, 103), -- 감초
       (111, 10),  -- 오레가노
       (111, 80),  -- 가죽
       (111, 93),  -- 코코아
       (111, 30),  -- 야생고기
       (111, 62),  -- 라즈베리
       (111, 43),  -- 라벤더
       (112, 82),  -- 담배
       (112, 83),  -- 바닐라
       (112, 89),  -- 초콜릿
       (112, 91),  -- 커피
       (112, 86),  -- 삼나무
       (112, 92),  -- 코코넛
       (112, 107), -- 정향
       (112, 87),  -- 시가박스
       (112, 94),  -- 콜라
       (112, 88),  -- 에스프레소
       (112, 84),  -- 백단
       (112, 90),  -- 캐러멜
       (112, 95),  -- 파이프담배
       (112, 1),   -- 블랙체리
       (112, 98),  -- 블루베리
       (112, 4),   -- 자두
       (112, 3),   -- 올리브
       (112, 9),   -- 아몬드
       (112, 80),  -- 가죽
       (112, 93),  -- 코코아
       (112, 19),  -- 돌
       (112, 31),  -- 연필심
       (112, 33),  -- 절인고기
       (112, 40),  -- 타르
       (112, 109), -- 후추
       (112, 103), -- 감초
       (112, 104), -- 계피
       (112, 11),  -- 유칼립투스
       (112, 6),   -- 민트
       (112, 62),  -- 라즈베리
       (112, 64),  -- 석류
       (112, 65),  -- 체리
       (112, 61),  -- 딸기
       (112, 63),  -- 붉은자두
       (112, 39),  -- 크림
       (112, 38),  -- 치즈
       (112, 52),  -- 제비꽃
       (112, 43),  -- 라벤더
       (112, 53),  -- 포푸리
       (112, 58),  -- 건포도
       (112, 70),  -- 마멀레이드
       (112, 102), -- 살구
       (113, 62),  -- 라즈베리
       (113, 61),  -- 딸기
       (113, 65),  -- 체리
       (113, 63),  -- 붉은자두
       (113, 64),  -- 석류
       (113, 66),  -- 크랜베리
       (113, 80),  -- 가죽
       (113, 29),  -- 숲바닥
       (113, 24),  -- 버섯
       (113, 19),  -- 돌
       (113, 18),  -- 꿀
       (113, 20),  -- 마른낙엽
       (113, 93),  -- 코코아
       (113, 28),  -- 석연슬레이트
       (113, 82),  -- 담배
       (113, 83),  -- 바닐라
       (113, 89),  -- 초콜릿
       (113, 107), -- 정향
       (113, 94),  -- 콜라
       (113, 86),  -- 삼나무
       (113, 106), -- 육두구
       (113, 87),  -- 시가박스
       (113, 90),  -- 캐러멜
       (113, 84),  -- 백단
       (113, 88),  -- 에스프레소
       (113, 95),  -- 파이프담배
       (113, 1),   -- 블랙체리
       (113, 98),  -- 블루베리
       (113, 97),  -- 흑설탕
       (113, 103), -- 감초
       (113, 109), -- 후추
       (113, 104), -- 계피
       (113, 11),  -- 유칼립투스
       (113, 8),   -- 세이지
       (113, 52),  -- 제비꽃
       (113, 53),  -- 포푸리
       (113, 43),  -- 라벤더
       (113, 67),  -- 토마토
       (113, 39),  -- 크림
       (113, 38),  -- 치즈
       (113, 59),  -- 무화과
       (113, 58),  -- 건포도
       (114, 80),  -- 가죽
       (114, 24),  -- 버섯
       (114, 30),  -- 야생고기
       (114, 26),  -- 분필
       (114, 33),  -- 절인고기
       (114, 29),  -- 숲바닥
       (114, 18),  -- 꿀
       (114, 93),  -- 코코아
       (114, 82),  -- 담배
       (114, 89),  -- 초콜릿
       (114, 83),  -- 바닐라
       (114, 94),  -- 콜라
       (114, 90),  -- 캐러멜
       (114, 86),  -- 삼나무
       (114, 107), -- 정향
       (114, 91),  -- 커피
       (114, 95),  -- 파이프담배
       (114, 84),  -- 백단
       (114, 98),  -- 블루베리
       (114, 1),   -- 블랙체리
       (114, 3),   -- 올리브
       (114, 62),  -- 라즈베리
       (114, 61),  -- 딸기
       (114, 65),  -- 체리
       (114, 66),  -- 크랜베리
       (114, 103), -- 감초
       (114, 109), -- 후추
       (114, 104), -- 계피
       (114, 8),   -- 세이지
       (114, 6),   -- 민트
       (114, 58),  -- 건포도
       (114, 43),  -- 라벤더
       (114, 71),  -- 오렌지
       (115, 83),  -- 바닐라
       (115, 89),  -- 초콜릿
       (115, 82),  -- 담배
       (115, 86),  -- 삼나무
       (115, 25),  -- 버터
       (115, 91),  -- 커피
       (115, 107), -- 정향
       (115, 90),  -- 캐러멜
       (115, 88),  -- 에스프레소
       (115, 94),  -- 콜라
       (115, 87),  -- 시가박스
       (115, 98),  -- 블루베리
       (115, 1),   -- 블랙체리
       (115, 3),   -- 올리브
       (115, 80),  -- 가죽
       (115, 93),  -- 코코아
       (115, 19),  -- 돌
       (115, 30),  -- 야생고기
       (115, 26),  -- 분필
       (115, 32),  -- 염분
       (115, 109), -- 후추
       (115, 104), -- 계피
       (115, 103), -- 감초
       (115, 6),   -- 민트
       (115, 62),  -- 라즈베리
       (115, 66),  -- 크랜베리
       (115, 65),  -- 체리
       (115, 61),  -- 딸기
       (115, 39),  -- 크림
       (115, 38),  -- 치즈
       (115, 76),  -- 바나나
       (115, 52),  -- 제비꽃
       (115, 43),  -- 라벤더
       (115, 59),  -- 무화과
       (115, 101), -- 사과
       (115, 67),  -- 토마토
       (116, 83),  -- 바닐라
       (116, 82),  -- 담배
       (116, 89),  -- 초콜릿
       (116, 107), -- 정향
       (116, 91),  -- 커피
       (116, 86),  -- 삼나무
       (116, 87),  -- 시가박스
       (116, 94),  -- 콜라
       (116, 84),  -- 백단
       (116, 106), -- 육두구
       (116, 61),  -- 딸기
       (116, 62),  -- 라즈베리
       (116, 65),  -- 체리
       (116, 66),  -- 크랜베리
       (116, 80),  -- 가죽
       (116, 30),  -- 야생고기
       (116, 93),  -- 코코아
       (116, 18),  -- 꿀
       (116, 24),  -- 버섯
       (116, 19),  -- 돌
       (116, 29),  -- 숲바닥
       (116, 9),   -- 아몬드
       (116, 96),  -- 헤이즐넛
       (116, 1),   -- 블랙체리
       (116, 3),   -- 올리브
       (116, 109), -- 후추
       (116, 103), -- 감초
       (116, 11),  -- 유칼립투스
       (116, 6),   -- 민트
       (116, 104), -- 계피
       (116, 10),  -- 오레가노
       (116, 58),  -- 건포도
       (116, 59),  -- 무화과
       (116, 38),  -- 치즈
       (116, 39),  -- 크림
       (116, 52),  -- 제비꽃
       (116, 47),  -- 인동덩굴
       (116, 53),  -- 포푸리
       (116, 54),  -- 히비스커스
       (116, 100), -- 복숭아
       (116, 57),  -- 청배
       (116, 72),  -- 자몽
       (116, 75),  -- 망고
       (117, 83),  -- 바닐라
       (117, 82),  -- 담배
       (117, 89),  -- 초콜릿
       (117, 62),  -- 라즈베리
       (117, 103), -- 감초
       (117, 109), -- 후추
       (118, 1),   -- 블랙체리
       (118, 89),  -- 초콜릿
       (118, 91),  -- 커피
       (118, 86),  -- 삼나무
       (118, 83),  -- 바닐라
       (118, 90),  -- 캐러멜
       (118, 82),  -- 담배
       (118, 25),  -- 버터
       (118, 94),  -- 콜라
       (118, 88),  -- 에스프레소
       (118, 87),  -- 시가박스
       (118, 58),  -- 건포도
       (118, 59),  -- 무화과
       (118, 97),  -- 흑설탕
       (118, 80),  -- 가죽
       (118, 32),  -- 염분
       (118, 24),  -- 버섯
       (118, 61),  -- 딸기
       (118, 62),  -- 라즈베리
       (118, 65),  -- 체리
       (118, 109), -- 후추
       (118, 104), -- 계피
       (118, 11),  -- 유칼립투스
       (118, 103), -- 감초
       (118, 39),  -- 크림
       (118, 99),  -- 모과
       (118, 67),  -- 토마토
       (118, 71),  -- 오렌지
       (119, 98),  -- 블루베리
       (119, 1),   -- 블랙체리
       (119, 62),  -- 라즈베리
       (119, 80),  -- 가죽
       (119, 89),  -- 초콜릿
       (119, 83),  -- 바닐라
       (119, 109), -- 후추
       (119, 6),   -- 민트
       (119, 11),  -- 유칼립투스
       (119, 67),  -- 토마토
       (120, 66),  -- 크랜베리
       (120, 62),  -- 라즈베리
       (120, 63),  -- 붉은자두
       (120, 65),  -- 체리
       (120, 83),  -- 바닐라
       (120, 82),  -- 담배
       (120, 89),  -- 초콜릿
       (120, 86),  -- 삼나무
       (120, 98),  -- 블루베리
       (120, 80),  -- 가죽
       (120, 40),  -- 타르
       (120, 24),  -- 버섯
       (120, 104), -- 계피
       (120, 103), -- 감초
       (120, 38),  -- 치즈
       (120, 52),  -- 제비꽃
       (121, 89),  -- 초콜릿
       (121, 83); -- 바닐라

INSERT INTO `feed`
  (feed_id, user_id, content, image_url, is_public)
VALUES (1, 1, '유저1_첫 번째 피드에요', 'https://picsum.photos/200/300', true),
       (2, 1, '유저1_두 번째 피드에요 ', 'https://picsum.photos/200/300', true),
       (3, 1, '유저1_세 번째 피드에요', 'https://picsum.photos/200/300', true),
       (4, 1, '유저1_네 번째 피드에요', 'https://picsum.photos/200/300', true),
       (5, 1, '유저1_다섯 번째 피드에요', 'https://picsum.photos/200/300', true),
       (6, 2, '유저2_첫 번째 피드에요', 'https://picsum.photos/200/300', false),
       (7, 2, '유저2_두 번째 피드에요', 'https://picsum.photos/200/300', true),
       (8, 2, '유저2_세 번째 피드에요', 'https://picsum.photos/200/300', false),
       (9, 2, '유저2_네 번째 피드에요', 'https://picsum.photos/200/300', true),
       (10, 2, '유저2_다섯 번째 피드에요', 'https://picsum.photos/200/300', true),
       (11, 3, '유저3_첫 번째 피드에요', 'https://picsum.photos/200/300', true),
       (12, 3, '유저3_두 번째 피드에요', 'https://picsum.photos/200/300', true),
       (13, 3, '유저3_셋 번째 피드에요', 'https://picsum.photos/200/300', true),
       (14, 3, '유저3_네 번째 피드에요', 'https://picsum.photos/200/300', true),
       (15, 3, '유저3_다섯 번째 피드에요', 'https://picsum.photos/200/300', false);

INSERT INTO `feed_wine`
  (feed_wine_id, feed_id, wine_id)
VALUES (1, 1, 1),
       (2, 2, 4),
       (3, 2, 55),
       (4, 2, 31),
       (5, 2, 77),
       (6, 3, 24),
       (7, 3, 52),
       (8, 4, 99),
       (9, 4, 88),
       (10, 5, 11),
       (11, 5, 22),
       (12, 5, 33),
       (13, 5, 44),
       (14, 5, 55),
       (15, 5, 66),
       (16, 5, 77),
       (17, 5, 88),
       (18, 5, 99),
       (19, 5, 100),
       (20, 6, 12),
       (21, 6, 2),
       (22, 7, 2),
       (23, 8, 2),
       (24, 9, 2),
       (25, 10, 2),
       (26, 11, 38),
       (27, 12, 17),
       (28, 13, 25),
       (29, 14, 83),
       (30, 15, 69);

INSERT INTO `feed_like`
  (feed_like_id, feed_id, user_id)
VALUES (1, 6, 1),
       (2, 7, 1),
       (3, 8, 1),
       (4, 9, 1),
       (5, 10, 1),
       (6, 3, 2),
       (7, 12, 2),
       (8, 15, 2),
       (9, 1, 3),
       (10, 2, 3),
       (11, 3, 3),
       (12, 4, 3),
       (13, 5, 3),
       (14, 6, 3),
       (15, 7, 3),
       (16, 8, 3),
       (17, 4, 4),
       (18, 9, 4),
       (19, 2, 4),
       (20, 14, 4),
       (21, 7, 4),
       (22, 11, 4),
       (23, 5, 4),
       (24, 3, 5),
       (25, 8, 5),
       (26, 1, 5),
       (27, 12, 5),
       (28, 6, 5),
       (29, 10, 5),
       (30, 15, 5);

INSERT INTO `cellar_wine`
  (cellar_wine_id, user_id, wine_id)
VALUES (1, 1, 1),
       (2, 1, 2),
       (3, 1, 3),
       (4, 1, 4),
       (5, 1, 5),
       (6, 1, 6),
       (7, 1, 7),
       (8, 1, 8),
       (9, 1, 9),
       (10, 1, 10);

INSERT INTO `bookmark`
  (bookmark_id, user_id, wine_id)
VALUES (1, 1, 1),
       (2, 1, 3),
       (3, 1, 5),
       (4, 1, 2),
       (5, 1, 7),
       (6, 1, 8),
       (7, 1, 4),
       (8, 1, 55),
       (9, 1, 62),
       (10, 1, 43),
       (11, 1, 71);