import 'package:flutter/material.dart';

void main() {
  runApp(const TextFieldWithPopupMenuApp());
}

class TextFieldWithPopupMenuApp extends StatelessWidget {
  const TextFieldWithPopupMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Dynamic TextField with Popup Menu')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DynamicTextField(
                options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
                initialValue: 'Option 1',
                label: 'Tap to select an option',
              ),
              SizedBox(height: 20),
              DynamicTextField(
                options: [
                  'Toyota', 'Honda', 'Ford', 'Chevrolet', 'Nissan', 'BMW', 
                  'Mercedes-Benz', 'Volkswagen', 'Audi', 'Hyundai', 'Kia', 
                  'Mazda', 'Subaru', 'Tesla', 'Volvo'
                ],
                initialValue: 'Toyota',
                label: 'Tap to select a car',
              ), SizedBox(height: 20),
              DynamicTextField(
                options: [
                  'Toyota', 'Honda', 'Ford', 'Chevrolet', 'Nissan', 'BMW', 
                  'Mercedes-Benz', 'Volkswagen', 'Audi', 'Hyundai', 'Kia', 
                  'Mazda', 'Subaru', 'Tesla', 'Volvo'
                ],
                initialValue: 'Toyota',
                label: 'Tap to select a car',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DynamicTextField extends StatefulWidget {
  final List<String> options;
  final String initialValue;
  final String label;

  const DynamicTextField({
    required this.options,
    required this.initialValue,
    required this.label,
    super.key,
  });

  @override
  State<DynamicTextField> createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField> {
  late TextEditingController _controller;
  final GlobalKey _textFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  void _showPopupMenu() {
    final RenderBox renderBox = _textFieldKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                Positioned(
                  width: size.width,
                  left: offset.dx,
                  top: offset.dy + size.height-20,
                  child: Material(
                    elevation: 4.0,
                    child: ListView(
                      shrinkWrap: true,
                      children: widget.options.map((String option) {
                        return ListTile(
                          dense: true,
                          tileColor: Colors.amber,
                          title: Text(option),
                          onTap: () {
                            setState(() {
                              _controller.text = option;
                            });
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        key: _textFieldKey,
        controller: _controller,
        readOnly: true,
        onTap: _showPopupMenu,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
