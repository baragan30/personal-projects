import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  RatingRow({
    this.rating,
    this.numberOfRatings,
  });
  double? rating;
  int? numberOfRatings;

  Row _ratingRow(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Text(
          rating.toStringAsFixed(1),
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        if (numberOfRatings != null && numberOfRatings! > 0)
          Expanded(
            child: Text(
              '($numberOfRatings ratings)',
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 200,
      ),
      child: (rating != null)
          ? _ratingRow(rating!)
          : const Text(
              "No rating data",
              overflow: TextOverflow.ellipsis,
            ),
    );
  }
}
