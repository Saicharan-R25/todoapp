class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, Widget> taskWidgets = {};

  void addTask(String title) {
    setState(() {
      taskWidgets[title] = ListTile(title: Text(title));
    });
  }

  void removeTask(String title) {
    setState(() {
      taskWidgets.remove(title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: ListView.builder(
        itemCount: taskWidgets.length,
        itemBuilder: (context, index) {
          String title = taskWidgets.keys.elementAt(index);
          Widget taskWidget = taskWidgets[title]!;
          return taskWidget;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskCreate(addTask),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskCreate extends StatelessWidget {
  final Function(String) addTask;

  TaskCreate(this.addTask);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Task'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Task Title',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String title = _controller.text;
              addTask(title);
              Navigator.pop(context);
            },
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }
}


