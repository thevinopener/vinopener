import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/constants/fonts.dart';

class NoteFlavour extends StatefulWidget {
  const NoteFlavour({Key? key}) : super(key: key);

  @override
  State<NoteFlavour> createState() => _NoteFlavourState();
}

class _NoteFlavourState extends State<NoteFlavour> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;

    return Container(
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: -2,
          )
        ],
      ),
      child: Accordion(
        maxOpenSections: 1,
        headerBackgroundColor: AppColors.white,
        headerBorderColor: AppColors.black,
        headerBorderWidth: 1,
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
        contentBorderColor: AppColors.white,
        headerBorderColorOpened: AppColors.white,
        rightIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black54,
          size: 25,
        ),
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        children: [
          AccordionSection(
            isOpen: true,
            header: Text('붉은 과일',
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: AppFontSizes.medium,
                    ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('푸른과일',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('검은 과일',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('말린 과일',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('녹색 과일',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('시트러스',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('핵과류',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('열대 과일',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('꽃',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('그린 노트',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('향신료',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('기타',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          AccordionSection(
            isOpen: true,
            header: Text('오크',
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSizes.medium,
              ),),
            content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consequat magna vitae leo tempus, nec ultrices dui dapibus. Praesent non venenatis erat.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
