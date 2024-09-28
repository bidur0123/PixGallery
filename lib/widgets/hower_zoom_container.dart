import 'package:flutter/material.dart';

class HoverZoomContainer extends StatefulWidget {
  final Widget child;
  final Function onTap;

  HoverZoomContainer({required this.child, required this.onTap});

  @override
  _HoverZoomContainerState createState() => _HoverZoomContainerState();
}

class _HoverZoomContainerState extends State<HoverZoomContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
      }),
      child: GestureDetector(
        onTap: () => widget.onTap(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          height: _isHovered ? 250 : 240,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? Colors.blueAccent : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Transform.scale(
            scale: _isHovered ? 1.09 : 1.0,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}