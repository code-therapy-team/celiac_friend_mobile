import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgLoadingSpinner extends StatefulWidget {
  final double size;
  final Duration duration;

  const SvgLoadingSpinner({
    super.key,
    this.size = 60.0, // Default size
    this.duration = const Duration(milliseconds: 1200), // Rotation speed
  });

  @override
  State<SvgLoadingSpinner> createState() => _SvgLoadingSpinnerState();
}

class _SvgLoadingSpinnerState extends State<SvgLoadingSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // The raw SVG string from earlier, with xmlns added for Flutter compatibility
final String _svgIcon = '''
    <svg viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">
      <circle 
        cx="25" cy="25" r="14" 
        fill="none" 
        stroke="#2cb5d2" 
        stroke-width="5" 
        stroke-linecap="round" 
        stroke-dasharray="7 14.99">
      </circle>
    </svg>
  ''';
  @override
  void initState() {
    super.initState();
    // Set up the animation to repeat continuously
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // RotationTransition spins the child widget continuously
    return RotationTransition(
      turns: _controller,
      child:SvgPicture.string(
        _svgIcon,
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}
