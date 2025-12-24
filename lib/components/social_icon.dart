import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatefulWidget {
  const SocialIcon({
    super.key,
    required this.iconPath,
    this.onTap,
    this.iconColor,
  });

  final String iconPath;
  final VoidCallback? onTap;
  final Color? iconColor;
  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.2 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: SvgPicture.asset(
            widget.iconPath,
            width: 35,
            height: 35,
            colorFilter: widget.iconColor != null
                ? ColorFilter.mode(widget.iconColor!, BlendMode.srcIn)
                : null,
          ),
        ),
      ),
    );
  }
}
