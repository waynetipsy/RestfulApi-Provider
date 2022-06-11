import 'package:flutter/material.dart';
import 'package:restapi_provider/Provider/Database/db_provider.dart';
import 'package:restapi_provider/Screens/TaskPage/Local_widget/task_view_container.dart';
import 'package:restapi_provider/Utils/routers.dart';

import 'Local_widget/add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List task = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            onPressed: () {
              //logout
           DatabaseProvider().logout(context);
            },
            icon: const Icon(Icons.exit_to_app)
            ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: task.isNotEmpty
        ? Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [
           const Text(
              'Todo List is Empty',
            style: TextStyle(
              fontSize: 25,
            fontWeight: FontWeight.bold,
             ),
             
            ),
          const  SizedBox(height: 15),
            GestureDetector(
              onTap: () {
      PageNavigator(ctx: context).nextPage(page: const CreateTaskPage());       
              },
            child: const Text('Create a task'
            ),
            
              ),
          
          ],
          )
        )
      : ListView(
        children: List.generate(5,(index) {
          return TaskField(
            initial: "${index + 1}",
            title: "Hello world",
            subtitle: 'time',
            isCompleted: false,
            taskId: 'id',
          );
        }
      )
    ),
  ),
      floatingActionButton: FloatingActionButton(
        //mini: true,
        onPressed: () {
     PageNavigator(ctx: context).nextPage(page: const CreateTaskPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}