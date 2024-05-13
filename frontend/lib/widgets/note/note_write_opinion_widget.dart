import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:frontend/constants/fonts.dart';
import 'package:frontend/providers/note/note_wine_provider.dart';

class NoteOpinion extends StatefulWidget {
  const NoteOpinion({Key? key}) : super(key: key);

  @override
  State<NoteOpinion> createState() => _NoteOpinionState();
}

class _NoteOpinionState extends State<NoteOpinion> {
  late TextEditingController opinionController;

  @override
  void initState() {
    super.initState();
    opinionController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final providerOpinion = Provider.of<NoteProvider>(context).opinion;
    if (opinionController.text != providerOpinion) {
      opinionController.text = providerOpinion; // 초기 텍스트 필드 값 설정
    }
  }

  @override
  void dispose() {
    opinionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        children: [
          TextField(
            controller: opinionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '자유롭게 의견을 적어보세요!',
            ),
            maxLines: 12,
            style: TextStyle(fontSize: 16),
            onChanged: (text) {
              Provider.of<NoteProvider>(context, listen: false)
                  .updateNoteProvider(opinion: text);
            },
          ),
          SizedBox(height: 50),
          Consumer<NoteProvider>(
            builder: (context, provider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    provider.rating.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: AppFontSizes.large,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                  RatingBar.builder(
                    initialRating: provider.rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      provider.updateNoteProvider(rating: rating);
                    },
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
