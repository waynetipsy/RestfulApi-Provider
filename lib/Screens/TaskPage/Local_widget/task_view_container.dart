
import 'package:flutter/material.dart';
import 'package:restapi_provider/Utils/routers.dart';
import 'package:restapi_provider/styles/colors.dart';

class TaskField extends StatefulWidget {
   TaskField(
       { Key? key,
       this.title,
       this.isCompleted,
       this.subtitle,
       this.initial,
       this.taskId
   }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? taskId;
  final String? initial;

  bool? isCompleted;

  @override
  State<TaskField> createState() => _TaskFieldState();
}

class _TaskFieldState extends State<TaskField> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
      //PageNavigator(ctx: context).nextPage(
        //page: TaskDetailsPage(
          //taskId : widget.taskId,
          //title: widget.title,
          //),
       // );
      },
      contentPadding: const EdgeInsets.all(0),
      title: Text(widget.title!,
      style: TextStyle(
        decoration: widget.isCompleted == true
        ? TextDecoration.lineThrough
        : TextDecoration.none,
      
      ),
      overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        widget.subtitle!,
        style: TextStyle(
         decoration: widget.isCompleted == true
           ? TextDecoration.lineThrough
           : TextDecoration.none,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      leading: CircleAvatar(
        backgroundColor: widget.isCompleted == true
        ? green : amber,
        child:  Padding(
          padding: const EdgeInsets.all(1.0),
          child: CircleAvatar(
           backgroundColor: lightAmber,
           child: Text(widget.initial!),
          ),
         ),
       ),
       trailing: Checkbox(
         value: widget.isCompleted == true, 
         onChanged: (value) {
        setState(() {
          widget.isCompleted = value;
        });
         }
      ),
    );
  }
}