import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/stars_button_widget.dart';
import 'task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> tasks = [];

  void _showTaskDialog({Task? task, int? index}) {
    final TextEditingController titleController = TextEditingController(
      text: task?.title ?? '',
    );

    final TextEditingController imageUrlController =
        TextEditingController(text: task?.imageUrl ?? '');

    int difficulty = task?.dificulty ?? 0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: Text(task == null ? 'Adicionar Tarefa' : 'Editar Tarefa'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    label: Text('Título da Tarefa'),
                    hintText: 'Título da Tarefa'),
              ),
              TextField(
                controller: imageUrlController,
                decoration: const InputDecoration(
                    label: Text('Url da imagem'), hintText: 'Url da imagem'),
              ),
              StarsButtonWidget(
                value: difficulty,
                onChange: (value) {
                  setState(() {
                    difficulty = value;
                  });
                },
              )
            ],
          ),
          actions: [
            if (task != null)
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    tasks.removeAt(index!);
                  });
                  Navigator.of(context).pop();
                },
              ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (task == null) {
                    tasks.add(Task(
                        title: titleController.text,
                        imageUrl: imageUrlController.text,
                        dificulty: difficulty));
                  } else {
                    tasks[index!] = Task(
                        title: titleController.text,
                        imageUrl: imageUrlController.text,
                        dificulty: difficulty);
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
        title: const Center(
          child: Text(
            'Tarefas',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: InkWell(
              onTap: () {
                _showTaskDialog(task: tasks[index], index: index);
              },
              child: TaskCard(task: tasks[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTaskDialog(); // Para criar uma nova tarefa
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}
