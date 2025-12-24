import 'package:flutter/material.dart';
import 'package:portafolio/constants/colors.dart';

class ExperienceCard extends StatefulWidget {
  const ExperienceCard({super.key, required this.experience});

  final Map<String, String> experience;

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
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
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: _isHovered ? CustomColor.bgLightk : CustomColor.bgLight2,
        elevation: _isHovered ? 8 : 5,
        shadowColor: _isHovered
            ? CustomColor.yellowPrimary
            : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.experience['year']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.yellowPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/work.png',
                    width: 40,
                    height: 40,
                    color: CustomColor.whitePrimary,
                    opacity: const AlwaysStoppedAnimation(0.8),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.experience['title']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                        const SizedBox(height: 5),
                        if (widget.experience.containsKey('institution'))
                          Text(
                            widget.experience['institution']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: CustomColor.whiteSecondary,
                            ),
                          ),
                        if (widget.experience.containsKey('project'))
                          Text(
                            widget.experience['project']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: CustomColor.whiteSecondary,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
