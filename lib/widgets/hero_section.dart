import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const HeroSection({
    required this.onProjectsTap,
    required this.onContactTap,
    super.key,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _fadeAnimation;

  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1200,
      ),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(
        0,
        0.15,
      ),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final isMobile = width < 700;

        final horizontalPadding = isMobile ? 24.0 : 80.0;

        return SizedBox(
          width: double.infinity,
          height: isMobile ? 480 : 550,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? 400 : 1250,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: _HeroContent(
                            isMobile: isMobile,
                            onProjectsTap: widget.onProjectsTap,
                            onContactTap: widget.onContactTap,
                          ),
                        ),
                        if (!isMobile)
                          const Expanded(
                            flex: 3,
                            child: _HeroDecoration(),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HeroContent extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const _HeroContent({
    required this.isMobile,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SENIOR SOFTWARE ENGINEER',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.5,
            color: Colors.white.withOpacity(0.55),
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        Text(
          'Building digital',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 44 : 76,
            height: 0.98,
            fontWeight: FontWeight.w700,
            letterSpacing: -3,
          ),
        ),

        Text(
          'experiences.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 44 : 76,
            height: 0.98,
            fontWeight: FontWeight.w700,
            letterSpacing: -3,
            color: Colors.white.withOpacity(0.38),
          ),
        ),

        const SizedBox(
          height: 30,
        ),

        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 620,
          ),
          child: Text(
            'Software engineer focused on building beautiful, '
                'high-performance cross-platform applications '
                'with Flutter, React Native and modern backend technologies.',
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.7,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.55),
            ),
          ),
        ),

        const SizedBox(
          height: 40,
        ),

        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            _PrimaryButton(
              title: 'View Projects',
              icon: Icons.arrow_forward_rounded,
              onTap: onProjectsTap,
            ),
            _SecondaryButton(
              title: 'Contact Me',
              onTap: onContactTap,
            ),
          ],
        ),

        const SizedBox(
          height: 50,
        ),

        Wrap(
          spacing: 24,
          runSpacing: 12,
          children: const [
            _Technology(
              title: 'Flutter',
            ),
            _Technology(
              title: 'React Native',
            ),
            _Technology(
              title: 'Java',
            ),
            _Technology(
              title: 'Spring Boot',
            ),
            _Technology(
              title: 'Firebase',
            ),
          ],
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _PrimaryButton({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 200,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: hovered
                ? Colors.white.withOpacity(0.88)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                widget.icon,
                size: 17,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _SecondaryButton({
    required this.title,
    required this.onTap,
  });

  @override
  State<_SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<_SecondaryButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 200,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: hovered
                ? Colors.white.withOpacity(0.08)
                : Colors.transparent,
            border: Border.all(
              color: Colors.white.withOpacity(0.15),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            widget.title,
            style: GoogleFonts.inter(
              color: Colors.white.withOpacity(0.85),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _Technology extends StatelessWidget {
  final String title;

  const _Technology({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 5,
          height: 5,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.white.withOpacity(0.38),
          ),
        ),
      ],
    );
  }
}

class _HeroDecoration extends StatefulWidget {
  const _HeroDecoration();

  @override
  State<_HeroDecoration> createState() => _HeroDecorationState();
}

class _HeroDecorationState extends State<_HeroDecoration>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 8,
      ),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Center(
          child: Transform.rotate(
            angle: controller.value * 0.4,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.08),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Transform.rotate(
                  angle: -controller.value * 0.4,
                  child: Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.12),
                      ),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.code_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}