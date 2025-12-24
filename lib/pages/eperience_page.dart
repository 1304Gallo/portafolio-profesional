import 'package:flutter/material.dart';
import 'package:portafolio/widgets/experience_card.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      {
        'year': 'Diciembre 2022',
        'title': 'Graduado de Ingeniero en Ciencias Informáticas',
        'institution':
            'Universidad de las Ciencias Informáticas (UCI), La Habana, Cuba',
      },
      {
        'year': 'Enero 2023',
        'title':
            'Centro de Investigación de Tecnologías para la Formación (FORTES)',
        'project':
            'Proyecto: Sistema de gestión académica para el Ministerio de Educación de Cuba (Mined)',
      },
      {
        'year': 'Septiembre 2025',
        'title': 'Z17. Empresa de Desarrollo de Aplicaciones y Servicios',
        'project':
            'Proyecto: Picta. Plataforma Cubana de Streaming y Audiovisuales.',
      },
    ];

    final experienceListView = ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        final experience = experiences[index];
        return ExperienceCard(experience: experience);
      },
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          Text(
            'Experience',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 50.0),
          LayoutBuilder(
            builder: (context, constraints) {
              // For larger screens, center the list with a max width
              if (constraints.maxWidth >= 600) {
                return Center(
                    child: SizedBox(width: 760, child: experienceListView));
              } else {
                
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: experienceListView,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
