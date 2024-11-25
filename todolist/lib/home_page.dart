import 'package:flutter/material.dart';
import 'task_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TaskCard> taskCards = [];

  void _showTaskDialog({TaskCard? task, int? index}) {
    final TextEditingController _taskController = TextEditingController(
      text: task?.title ?? '',
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(task == null ? 'Adicionar Tarefa' : 'Editar Tarefa'),
          content: TextField(
            controller: _taskController,
            decoration: InputDecoration(hintText: 'Título da Tarefa'),
          ),
          actions: [
            if (task != null)
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    taskCards.removeAt(index!);
                  });
                  Navigator.of(context).pop();
                },
              ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (task == null) {
                    taskCards.add(TaskCard(title: _taskController.text));
                  } else {
                    taskCards[index!] = TaskCard(title: _taskController.text);
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text(task == null ? 'Criar' : 'Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Tarefas',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: taskCards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: InkWell(
              onTap: () {
                _showTaskDialog(task: taskCards[index], index: index);
              },
              child: taskCards[index],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTaskDialog(); // Para criar uma nova tarefa
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}