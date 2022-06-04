import 'package:flutter/material.dart';
import 'package:restapi_provider/styles/colors.dart';

Widget customTextField({
   String? title,
   String? hint,
   TextEditingController? controller,
   int? maxLines = 1}) {
     return Column(
       children: [
         Container(
           alignment: Alignment.centerLeft,
           child: Text(title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
            ),
           ),
         ),
        Container(
          margin: const EdgeInsets.only(top:10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: lightGrey,
        ),
       child: TextField(controller: controller,
       maxLines: maxLines,
        decoration: InputDecoration(
           hintText: hint,
           border: InputBorder.none,
           )
         ),
        )
       ],
     );
   }