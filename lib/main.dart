import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("TO-DOs"),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,

        ),
        body: ToDoList(),
      ),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  var MainTask = TextEditingController();
  var DetailTask = TextEditingController();
  Map<String, String> TaskInfo = {};
  Map<String,Widget> lst = {};
  int tagcount = 0;

  void taskcreate(String TaskTitle, String TaskDetail) {
    setState(() {
      lst[TaskTitle]=
        Column(
          children: [
            Hero(
              tag: '$tagcount',
              child: Material(
                child: ListTile(
                  title: Text(TaskTitle),
                  subtitle: Text(TaskDetail),
                  tileColor: Colors.blue,
                  onTap: () => _gotoDetailsPage(context, TaskTitle, TaskDetail),
                  leading: ElevatedButton(
                    onPressed: () => RemoveData(TaskTitle),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
          ],
        );

      tagcount++;
    });
  }

  void _gotoDetailsPage(BuildContext context, String Ttitle, String Ddtail) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            title: Text(Ttitle),
          ),
          body: Center(
              child: Text(
            Ddtail,
            style: TextStyle(fontSize: 30.0),
          )),
          /*Checkbox(value: isChecked, onChanged:(bool? value) {
               setState(() {
               isChecked = true;
               RemoveData(Ttitle);
               });
               },
             ),*/
        ),
      ),
    );
  }

  void RemoveData(String Ttitle) {
    setState(() {
      TaskInfo.remove(Ttitle);
      lst.remove(Ttitle);
      /*int indexno = lst.indexWhere((widget) {
        if (widget is Column) {
          List<Widget> children = widget.children;
          for (int i = 0; i < children.length; i++) {
            Widget child = children[i];
            if (child is Hero) {
              print('h');
              Widget c1 = child.child;
              if (c1 is Material) {
                print('m');
                Widget? c2 = c1.child;
                if (c2 is ListTile) {
                  print('lt');
                  if (c2.title==Text(Ttitle)) {
                    print('con');
                    return true;
                  }
                }
              }
            }
          }
          //return false;
        }
        return false;
      });
      if (indexno >= 0) {
        lst.remove(indexno);
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context, index) {
        String title = lst.keys.elementAt(index);
        Widget taskWidget = lst[title]!;
        return taskWidget;},),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<Widget>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(title: const Text('Add Task')),
                body: Center(
                  child: Hero(
                    tag: 'Task list',
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25.0,
                        ),
                        TextField(
                          controller: MainTask,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task Title',
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextField(
                          controller: DetailTask,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task Info',
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            TaskInfo[MainTask.text] = DetailTask.text;
                            taskcreate(MainTask.text, DetailTask.text);
                            MainTask.clear();
                            DetailTask.clear();
                            Navigator.pop(context);
                          },
                          child: Text('ADD'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        },
        child: const Icon(Icons.create),
      ),
    );
  }
}
