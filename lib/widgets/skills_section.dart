import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portafolio/constants/colors.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Consolidate all skills into a single list for easier management and rendering.
    final allSkills = [
      // Languages
      {"icon": "assets/icons/dart.svg", "title": "Dart"},
      {"icon": "assets/icons/python.svg", "title": "Python"},
      {"icon": "assets/icons/javascript.svg", "title": "JavaScript"},
      {"icon": "assets/icons/typescript.svg", "title": "TypeScript"},
      // Frameworks & Tools
      {"icon": "assets/icons/git.svg", "title": "Git"},
      {"icon": "assets/icons/flutter.svg", "title": "Flutter"},
      {"icon": "assets/icons/django.svg", "title": "Django"},
      {"icon": "assets/icons/angular.svg", "title": "Angular"},
    ];

    return Container(
      width: double.maxFinite,
      color: CustomColor.scaffoldBg,
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Knowledge & Skills",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          // Use AnimationLimiter to constrain the animations.
          AnimationLimiter(
            child: Wrap(
              // Use Wrap for a responsive layout that flows automatically.
              spacing: 40.0, // Horizontal space between skills
              runSpacing: 40.0, // Vertical space between lines of skills
              alignment: WrapAlignment.center,
              children: List.generate(allSkills.length, (index) {
                final skill = allSkills[index];
                // Apply staggered animations to each skill card.
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: _SkillCard(
                        iconPath: skill["icon"]!,
                        title: skill["title"]!,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

/// A reusable widget to display a single skill with its icon and title.
class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.iconPath, required this.title});

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 48,
            height: 48,
            // colorFilter: const ColorFilter.mode(
            //   CustomColor.whitePrimary,
            //   BlendMode.srcIn,
            // ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: CustomColor.whiteSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
