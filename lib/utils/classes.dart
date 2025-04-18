import 'dart:io';

class Attractions {
  final String title;
  final String image;
  final String description;
  final String reviewer;
  final String reviewerdescription;
  final String reviewer2;
  final String reviewerdescription2;
  final String date;
  final String url;
  Attractions({
    required this.title,
    required this.image,
    required this.description,
    required this.reviewer,
    required this.reviewerdescription,
    required this.reviewer2,
    required this.reviewerdescription2,
    required this.date,
    required this.url,
  });
}

class Restaurants {
  final String title;
  final String image;
  final String description;
  final String reviewer;
  final String reviewerdescription;
  final String reviewer2;
  final String reviewerdescription2;
  final String date;
  final String url;

  Restaurants({
    required this.title,
    required this.image,
    required this.description,
    required this.reviewer,
    required this.reviewerdescription,
    required this.reviewer2,
    required this.reviewerdescription2,

    required this.date,
    required this.url,
  });
}

class Entertainment {
  final String title;
  final String image;
  final String description;
  final String reviewer;
  final String reviewerdescription;

  final String reviewer2;
  final String reviewerdescription2;

  final String date;
  final String url;

  Entertainment({
    required this.title,
    required this.image,
    required this.description,
    required this.reviewer,
    required this.reviewerdescription,

    required this.reviewer2,
    required this.reviewerdescription2,
    required this.date,
    required this.url,
  });
}

class Recreation {
  final String title;
  final String image;
  final String description;
  final String reviewer;
  final String reviewerdescription;

  final String reviewer2;
  final String reviewerdescription2;

  final String date;
  final String url;

  Recreation({
    required this.title,
    required this.image,
    required this.description,
    required this.reviewer,
    required this.reviewerdescription,

    required this.reviewer2,
    required this.reviewerdescription2,
    required this.date,
    required this.url,
  });
}

////////////////////////
class Library {
  final String title;
  final String image;
  final String description;
  final String duration;
  final String reviewer;
  final String reviewerdescription;
  final String reviewer2;
  final String reviewerdescription2;
  final String date;
  final String place1;
  final String place2;
  final String place3;
  final String place1_image;
  final String place2_image;
  final String place3_image;
  final String url;

  Library({
    required this.title,
    required this.image,
    required this.description,
    required this.duration,
    required this.reviewer,
    required this.reviewerdescription,
    required this.reviewer2,
    required this.reviewerdescription2,
    required this.date,
    required this.place1,
    required this.place2,
    required this.place3,
    required this.place1_image,
    required this.place2_image,
    required this.place3_image,
    required this.url,
  });
}

class Routee {
  final String heading;
  final String description;
  final String date;
  final String image;
  List<Places> places = [];

  Routee({
    required this.heading,
    required this.description,
    required this.date,
    required this.image,
  });
}

class Places {
  final String heading;
  final String place1;
  final String place2;
  final String place3;
  List<File> image = [];

  Places({
    required this.heading,
    required this.place1,
    required this.place2,
    required this.place3,
  });
}
