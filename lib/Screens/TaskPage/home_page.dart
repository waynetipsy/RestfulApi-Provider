import 'package:flutter/material.dart';
import 'package:restapi_provider/Provider/Database/db_provider.dart';
import 'package:restapi_provider/Provider/TaskProvider/get_task_service.dart';
import 'package:restapi_provider/Screens/TaskPage/Local_widget/task_view_container.dart';
import 'package:restapi_provider/Utils/routers.dart';
import 'package:restapi_provider/styles/colors.dart';

import '../../Model/task_model.dart';
import 'Local_widget/add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

     @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUserTask().getTask();
  }
  
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
        child: FutureBuilder<TaskModel>(
          future: GetUserTask().getTask(),
          builder: (context, snapshot) {
         print(snapshot);
          if(snapshot.hasError) {
            return const Center(child: Text('Error Occured'));
          }else if(snapshot.hasData) {
            if(snapshot.data!.tasks == null) {
     return
         Center(
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
      PageNavigator(ctx: context).nextPage(
        page: const CreateTaskPage());       
              },
            child: Text('Create a task',
            style: TextStyle(
              fontSize: 18, color: grey
            ),
            ),
            ),
          ],
          )
         );
      } else {
        return ListView(
        children: List.generate(snapshot.data!.tasks!.length,(index) {
         final data = snapshot.data!.tasks![index];
          return TaskField(
            initial: "${index + 1}",
            title: data.title,
            subtitle: data.startTime.toString(),
            isCompleted: false,
            taskId: data.id.toString(),
          );
      }),
    );
      }
      } else {
       return Center(
         child: CircularProgressIndicator(
           color: primaryColor,
         ),
         );
      }
      }
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