import 'package:chat/pages/home.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  final String titleOne;
  final String titleTwo;
  final SwitchModel switchModel;

  const SwitchWidget({
    super.key,
    required this.titleOne,
    required this.titleTwo,
    required this.switchModel,
  });

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.switchModel.onSwitchChange();
          widget.switchModel.updateFilteredData();
        });
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
                alignment: widget.switchModel.value
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
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
                        color: widget.switchModel.value
                            ? Colors.white
                            : Colors.black),
                  )),
                  Center(
                      child: Text(
                    widget.titleTwo,
                    style: TextStyle(
                        color: widget.switchModel.value
                            ? Colors.black
                            : Colors.white),
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
