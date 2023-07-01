import 'package:flutter/material.dart';
import 'package:fluttersnips/constants/app_colors.dart';
import 'package:fluttersnips/shared/exports.dart';

class SideMenuTile extends StatefulWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  final bool isSelected;
  const SideMenuTile(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap,
      required this.isSelected});

  @override
  State<SideMenuTile> createState() => _SideMenuTileState();
}

class _SideMenuTileState extends State<SideMenuTile> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => setState(() => hovering = true),
        onExit: (event) => setState(() => hovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          decoration: BoxDecoration(
            color: hovering
                ? Colors.grey[900]
                : widget.isSelected
                    ? Colors.grey[900]
                    : Colors.transparent,
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(100)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.iconData,
                color: widget.isSelected ? primaryColor : Colors.white,
              ),
              const SizedBox(width: 14),
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: widget.isSelected ? primaryColor : Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
