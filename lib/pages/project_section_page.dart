import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portafolio/constants/colors.dart';
import 'package:portafolio/components/card_projects.dart';


class ProjectSectionPage extends StatelessWidget {
  const ProjectSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    // List of project data to avoid repetition
    final projects = [
      {
        "title": "Picta",
        "imagePath": "assets/images/picta.png",
        "description": "Plataforma de contenidos audiovisuales",
        "techTags": ["python", "Django", "Django RESTframework", "PostgreSQL"],
      },
      {
        "title": "Akademos-Mined",
        "imagePath": "assets/images/akademos.JPG",
        "description":
            "Sistema de gestion academica, para instituciones educativas del Mined",
        "techTags": ["python", "Django", "Django RESTframework", "PostgreSQL"],
      },
      {
        "title": "Portafolio Web personal",
        "imagePath": "assets/images/portafolio.png",
        "description": "Mi portafolio web personal desarrollado en Flutter",
        "techTags": ["Flutter", "Dart"],
      },
    ];

    Widget buildProjectCard(Map<String, dynamic> projectData) {
      return CardProjects(
        title: projectData["title"],
        imagePath: projectData["imagePath"],
        description: projectData["description"],
        techTags: projectData["techTags"] as List<String>,
        onVisitLink: () {},
        onGithubLink: () {},
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      width: screenWidth,
      child: Column(
        children: [
          const Text(
            "Projects",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              // Determine number of columns based on screen width
              int crossAxisCount;
              if (constraints.maxWidth >= 700) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth >= 600) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 1;
              }

              // Calculate aspect ratio to ensure cards are tall enough
              // Card width is (constraints.maxWidth / crossAxisCount) - spacing
              // A ratio of 3/4 or 3/4.5 usually works well.
              const double cardHeight = 400; // A fixed height that fits content
              final double cardWidth =
                  (constraints.maxWidth - (crossAxisCount - 1) * 5) /
                  crossAxisCount;
              final double aspectRatio = cardWidth / cardHeight;

              return GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: aspectRatio,
                ),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    columnCount: crossAxisCount,
                    duration: const Duration(milliseconds: 500),
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: buildProjectCard(projects[index]),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
