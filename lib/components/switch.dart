import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  final String titleOne;
  final String titleTwo;
  final Function(bool value) onTap;
  final bool value;

  const SwitchWidget(
      {super.key,
      required this.titleOne,
      required this.titleTwo,
      required this.value,
      required this.onTap});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.value);
      },
      child: Center(
        child: Container(
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.black26),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                alignment:
                    widget.value ? Alignment.centerLeft : Alignment.centerRight,
                duration: const Duration(milliseconds: 250),
                child: Container(
                  width: 150,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.teal),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    widget.titleOne,
                    style: TextStyle(
                        color: widget.value ? Colors.white : Colors.black),
                  )),
                  Center(
                      child: Text(
                    widget.titleTwo,
                    style: TextStyle(
                        color: widget.value ? Colors.black : Colors.white),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
