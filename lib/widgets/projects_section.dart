import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/utils/url_helper.dart';

import '../core/theme/app_theme.dart';
import 'scroll_reveal.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 80,
            vertical: isMobile ? 30 : 60,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1250,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScrollReveal(
                    child: const _SectionHeader(),
                  ),
                  SizedBox(height: isMobile ? 30 : 55),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 100),
                    child: Text(
                      'Selected work.',
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 40 : 60,
                        height: 1.05,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -2.5,
                        color: AppTheme.primaryText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 160),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 650,
                      ),
                      child: Text(
                        'A selection of applications and products I have '
                            'worked on across mobile development, healthcare, '
                            'agriculture, education and banking.',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          height: 1.8,
                          color: AppTheme.secondaryText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 30 : 65),
                  _ProjectsGrid(
                    isMobile: isMobile,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '03',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.mutedText,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 1,
            color: AppTheme.border,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          'PROJECTS',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.5,
            color: AppTheme.secondaryText,
          ),
        ),
      ],
    );
  }
}

class _ProjectsGrid extends StatelessWidget {
  final bool isMobile;

  const _ProjectsGrid({
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final projects = [
      const _ProjectData(
        number: '01',
        title: 'Tractor Seva',
        category: 'AGRICULTURE PLATFORM',
        url:
        'https://play.google.com/store/apps/details?id=com.tractorseva.customer&pcampaignid=web_share',
        description:
        'A cross-platform agricultural application designed '
            'to connect users with tractor and farming-related '
            'services through a simple digital experience.',
        technologies: [
          'Flutter',
          'Dart',
          'REST API',
        ],
      ),
      const _ProjectData(
        number: '02',
        title: 'C3 Eye Testing Software',
        category: 'MEDICAL TECHNOLOGY',
        url: '',
        description:
        'A specialized eye-testing application supporting '
            'multiple diagnostic tests, Android integration, camera '
            'SDK functionality, image processing, local data storage '
            'and automated PDF reporting.',
        technologies: [
          'Flutter',
          'Android',
          'Camera SDK',
          'GetX',
          'SQLite',
          'PDF',
        ],
      ),
      const _ProjectData(
        number: '03',
        title: 'Suryoday Net Banking',
        category: 'BANKING APPLICATION',
        url:
        'https://play.google.com/store/search?q=suryoday+bank&c=apps',
        description:
        'A responsive mobile banking interface developed for '
            'Android and iOS with a focus on clean layouts, reusable '
            'components and smooth user interactions.',
        technologies: [
          'React Native',
          'JavaScript',
          'Android',
          'iOS',
        ],
      ),
      const _ProjectData(
        number: '04',
        title: 'Prepseed App',
        category: 'EDUCATION PLATFORM',
        url: '',
        description:
        'A mobile application developed for an education-focused '
            'platform, delivering a structured digital experience '
            'with reusable components and application workflows.',
        technologies: [
          'Flutter',
          'Dart',
          'REST API',
        ],
      ),
    ];

    if (isMobile) {
      return Column(
        children: projects
            .asMap()
            .entries
            .map(
              (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ScrollReveal(
              delay: Duration(
                milliseconds: 200 + (entry.key * 100),
              ),
              offset: const Offset(0, 0.06),
              child: _ProjectCard(
                project: entry.value,
              ),
            ),
          ),
        )
            .toList(),
      );
    }

    return Column(
      children: [
        ScrollReveal(
          delay: const Duration(milliseconds: 200),
          offset: const Offset(0, 0.06),
          child: _ProjectCard(
            project: projects[0],
            featured: true,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ScrollReveal(
                delay: const Duration(milliseconds: 300),
                offset: const Offset(0, 0.06),
                child: _ProjectCard(
                  project: projects[1],
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ScrollReveal(
                delay: const Duration(milliseconds: 400),
                offset: const Offset(0, 0.06),
                child: _ProjectCard(
                  project: projects[2],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ScrollReveal(
          delay: const Duration(milliseconds: 500),
          offset: const Offset(0, 0.06),
          child: _ProjectCard(
            project: projects[3],
          ),
        ),
      ],
    );
  }
}

class _ProjectData {
  final String number;
  final String title;
  final String category;
  final String description;
  final String url;
  final List<String> technologies;

  const _ProjectData({
    required this.number,
    required this.title,
    required this.category,
    required this.description,
    required this.technologies,
    required this.url,
  });
}

class _ProjectCard extends StatefulWidget {
  final _ProjectData project;
  final bool featured;

  const _ProjectCard({
    required this.project,
    this.featured = false,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  Future<void> _openProject() async {
    if (widget.project.url.isEmpty) {
      return;
    }

    await UrlHelper.openUrl(widget.project.url);
  }

  @override
  Widget build(BuildContext context) {
    final hasUrl = widget.project.url.isNotEmpty;

    return MouseRegion(
      cursor: hasUrl
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(
          0,
          isHovered ? -5 : 0,
          0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              isHovered
                  ? AppTheme.surfaceElevated
                  : AppTheme.surface,
              isHovered
                  ? AppTheme.surfaceLight
                  : AppTheme.backgroundSecondary,
            ],
          ),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isHovered
                ? AppTheme.accent.withOpacity(0.25)
                : AppTheme.border,
          ),
          boxShadow: isHovered
              ? [
            BoxShadow(
              color: AppTheme.accent.withOpacity(0.045),
              blurRadius: 35,
              spreadRadius: 1,
              offset: const Offset(0, 15),
            ),
          ]
              : null,
        ),
        child: GestureDetector(
          onTap: hasUrl ? _openProject : null,
          child: Padding(
            padding: EdgeInsets.all(
              widget.featured ? 34 : 30,
            ),
            child: widget.featured
                ? _FeaturedContent(
              project: widget.project,
              isHovered: isHovered,
            )
                : _StandardContent(
              project: widget.project,
              isHovered: isHovered,
            ),
          ),
        ),
      ),
    );
  }
}

class _FeaturedContent extends StatelessWidget {
  final _ProjectData project;
  final bool isHovered;

  const _FeaturedContent({
    required this.project,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 750;

        if (isCompact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProjectVisual(
                project: project,
                isHovered: isHovered,
                height: 230,
              ),
              const SizedBox(height: 30),
              _ProjectDetails(
                project: project,
                isHovered: isHovered,
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(
              flex: 5,
              child: _ProjectVisual(
                project: project,
                isHovered: isHovered,
                height: 300,
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              flex: 4,
              child: _ProjectDetails(
                project: project,
                isHovered: isHovered,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _StandardContent extends StatelessWidget {
  final _ProjectData project;
  final bool isHovered;

  const _StandardContent({
    required this.project,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProjectVisual(
          project: project,
          isHovered: isHovered,
          height: 220,
        ),
        const SizedBox(height: 28),
        _ProjectDetails(
          project: project,
          isHovered: isHovered,
        ),
      ],
    );
  }
}

class _ProjectVisual extends StatelessWidget {
  final _ProjectData project;
  final bool isHovered;
  final double height;

  const _ProjectVisual({
    required this.project,
    required this.isHovered,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      height: height,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.surfaceLight,
            AppTheme.background,
          ],
        ),
        border: Border.all(
          color: isHovered
              ? AppTheme.accent.withOpacity(0.18)
              : AppTheme.border,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -80,
            right: -60,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.accent.withOpacity(
                  isHovered ? 0.07 : 0.035,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -70,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.018),
              ),
            ),
          ),
          Center(
            child: AnimatedScale(
              duration: const Duration(milliseconds: 350),
              scale: isHovered ? 1.08 : 1.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getProjectIcon(project.number),
                    size: 46,
                    color: isHovered
                        ? AppTheme.accentLight
                        : AppTheme.secondaryText,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'PROJECT ${project.number}',
                    style: GoogleFonts.inter(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      color: AppTheme.mutedText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 18,
            left: 18,
            child: Text(
              project.number,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppTheme.mutedText,
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 300),
              turns: isHovered ? 0.08 : 0,
              child: Icon(
                Icons.arrow_outward_rounded,
                size: 17,
                color: isHovered
                    ? AppTheme.accent
                    : AppTheme.mutedText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getProjectIcon(String number) {
    switch (number) {
      case '01':
        return Icons.agriculture_outlined;
      case '02':
        return Icons.visibility_outlined;
      case '03':
        return Icons.account_balance_outlined;
      case '04':
        return Icons.school_outlined;
      default:
        return Icons.apps_rounded;
    }
  }
}

class _ProjectDetails extends StatelessWidget {
  final _ProjectData project;
  final bool isHovered;

  const _ProjectDetails({
    required this.project,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.category,
          style: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.8,
            color: AppTheme.accent,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          project.title,
          style: GoogleFonts.inter(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.8,
            color: AppTheme.primaryText,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          project.description,
          style: GoogleFonts.inter(
            fontSize: 13,
            height: 1.75,
            color: AppTheme.secondaryText,
          ),
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 7,
          runSpacing: 7,
          children: project.technologies
              .map(
                (technology) => _TechnologyTag(
              title: technology,
              isHovered: isHovered,
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}

class _TechnologyTag extends StatelessWidget {
  final String title;
  final bool isHovered;

  const _TechnologyTag({
    required this.title,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isHovered
            ? AppTheme.accent.withOpacity(0.07)
            : AppTheme.accent.withOpacity(0.035),
        border: Border.all(
          color: isHovered
              ? AppTheme.accent.withOpacity(0.20)
              : AppTheme.border,
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: AppTheme.secondaryText,
        ),
      ),
    );
  }
}