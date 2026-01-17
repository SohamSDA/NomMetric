import 'package:flutter/material.dart';
import 'dart:ui'; 

class MealCardVibhu extends StatelessWidget {
  // Dynamic Data
  final String mealName;
  final String mealTime; 
  final String description;
  final String imageUrl;
  final String calories;
  final double rating;
  final VoidCallback? onTap;

  // Dynamic Styling (Optional overrides)
  final Color? startColor;
  final Color? endColor;

  const MealCardVibhu({
    super.key,
    // Default Placeholders (Only used if no data provided)
    this.mealName = "Spicy Paneer Tikka",
    this.mealTime = "Dinner",
    this.description = "Tender paneer cubes marinated in spices and grilled to perfection.",
    this.imageUrl = "https://images.unsplash.com/photo-1565557623262-b51c2513a641?q=80&w=1000&auto=format&fit=crop", 
    this.calories = "320 kcal",
    this.rating = 4.8,
    this.onTap,
    this.startColor,
    this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          // VISIBLE GRADIENT: Fades from White -> Cool Grey/Blue
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              startColor ?? Colors.white,
              // Slightly darker end color so the gradient is visible
              endColor ?? const Color(0xFFE8F1F8), 
            ],
          ),
          borderRadius: BorderRadius.circular(28),
          // White border to pop against the gradient
          border: Border.all(color: Colors.white, width: 2),
          // Deep shadow for 3D effect
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1D1617).withOpacity(0.12),
              offset: const Offset(0, 10),
              blurRadius: 30,
              spreadRadius: -5,
            ),
          ],
        ),
        child: Column(
          children: [
            // --- IMAGE SECTION ---
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(26)),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _buildErrorPlaceholder(),
                    ),
                  ),
                ),
                
                // Glassmorphism Tag
                Positioned(
                  top: 16,
                  left: 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25), 
                          border: Border.all(color: Colors.white.withOpacity(0.5)),
                        ),
                        child: Text(
                          mealTime.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1.0,
                            shadows: [
                              Shadow(blurRadius: 4, color: Colors.black26, offset: Offset(0, 1))
                            ]
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Rating Badge
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // --- DETAILS SECTION ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2D3142),
                      height: 1.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.local_fire_department_rounded, 
                              color: Color(0xFFFF7E46), size: 20),
                          const SizedBox(width: 6),
                          Text(
                            calories,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF9FA5C0),
                            ),
                          ),
                        ],
                      ),

                      // Button
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF3E8BFF), Color(0xFF2B5CE6)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF3E8BFF).withOpacity(0.4),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.arrow_forward_rounded, 
                            color: Colors.white, size: 22),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      color: Colors.grey.shade200,
      child: Center(
        child: Icon(Icons.broken_image_rounded, color: Colors.grey.shade400, size: 50),
      ),
    );
  }
}