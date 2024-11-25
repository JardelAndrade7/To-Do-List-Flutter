import 'package:flutter/material.dart';

class StarsButtonWidget extends StatefulWidget {
  final int value;
  final ValueChanged<int> onChange;
  const StarsButtonWidget({super.key,required this.value, required this.onChange});

  @override
  State<StarsButtonWidget> createState() => _StarsButtonWidgetState();
}

class _StarsButtonWidgetState extends State<StarsButtonWidget> {
  int value = 0;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Dificuldade"),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final int id = index + 1;
                  final bool painted = id <= value;
                  return GestureDetector(
                    onTap: () => {
                      setState(() {
                        value = id;
                      }),
                      widget.onChange(value)
                    },
                    child: Icon(Icons.star,
                        color: painted ? Colors.blue : Colors.grey),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
