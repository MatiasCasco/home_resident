import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/questions_controller.dart';
import 'package:home_resident/models/question_model.dart';
import 'package:home_resident/utils/constants.dart';
import 'package:home_resident/widget/image_question.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  // estamos pasando como parametro el objeto pregunta
  const QuestionCard({
    Key key,@required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);

    final Size size = media.size;
    final EdgeInsets padding = media.padding;

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenheigth = screenSize.height;
    QuestionsController _controller = Get.put(QuestionsController());
    return  Container(
        child: SingleChildScrollView(
          child: Container(
            //height: size.height*1.6-padding.top-padding.bottom, este era las dimensiones originales pero le afecto la rotacion de pantalla
            height: screenWidth*2-padding.top-padding.bottom,
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            // Aca le cambie kDefaultPadding por 8.0
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                ImageQuestion(image: question.image),
                Text(
                  question.question.replaceAll("\"", ""),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: kBlackColor,),
                ),
                SizedBox(height: kDefaultPadding,),
                ...List.generate(
                  question.options.length,
                      (index) => Option(
                    index: index,
                    text: question.options[index].replaceAll("\"", ""),
                    press: ()=> !_controller.response?_controller.checkAns(question, index):(){},
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
