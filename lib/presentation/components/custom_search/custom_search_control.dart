import 'package:flutter/material.dart';
import 'package:job_search/presentation/presentation.dart';

class SearchControl extends StatelessWidget {
  const SearchControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.xs),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7FB),
          borderRadius: BorderRadius.circular(Dimensions.md),
        ),
        child: Center(
          child: Row(
            children: [
              xxsSpacer(),
               Icon(Icons.search, color: AppColors.primaryOrange),
              xxsSpacer(),
              Text(
                'Search job titles, companies',
                style: TextStyles.body1Regular(
                  color: Colors.grey.shade600,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.tune,
                  color: AppColors.primaryOrange,
                ),
                onPressed: () {
                },
              ),
              xxsSpacer(),
            ],
          ),
        ),
      ),
    );
  }
}
