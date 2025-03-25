import 'package:flutter/cupertino.dart';
import 'package:hohensyburg_dortmund_places/utils/classes.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderApp extends ChangeNotifier {
  // Define your lists here
  List<Routee> _routee = [];
  final List<Attractions> _atractions = [
    Attractions(
      title: "Hohensyburg",
      image: "images/Frame.png",
      description:
          "Hohensyburg is a historic castle ruin located on a hill overlooking the Ruhr valley, offering stunning panoramic views of the surrounding landscape. The site dates back to the 13th century and has been a significant landmark throughout history. Visitors can explore the remnants of the castle, including its towers and walls, while enjoying scenic walking paths around the area. The nearby Kaiser Wilhelm Monument adds to the historical significance of the site. Hohensyburg is also a great spot for hiking and outdoor activities, making it a perfect destination for history buffs and nature lovers alike.",
      reviewer: "Liam O'Sullivan",
      reviewerdescription:
          'Hohensyburg is a hidden gem! The views from the castle ruins are absolutely breathtaking, especially at sunset. I loved exploring the old walls and imagining what life was like back in the 13th century. The surrounding hiking trails are well-maintained and perfect for a leisurely walk. Definitely a must-visit for anyone in Dortmund!',

      reviewer2: 'Sophie Dubois',
      reviewerdescription2:
          'I was pleasantly surprised by Hohensyburg! The history is fascinating, and the Kaiser Wilhelm Monument nearby adds to the experience. It’s a great spot for both history enthusiasts and nature lovers. Just be prepared for a bit of a hike to reach the top, but the panoramic views are worth every step',
      date: "23 June 2024",
      url:
          "https://www.google.com/maps/search/Hohensyburg/@51.4201593,7.4858243,18.18z?entry=ttu&g_ep=EgoyMDI1MDMwNC4wIKXMDSoASAFQAw%3D%3D",
    ),
    Attractions(
      title: "Westfalenpark",
      image: "images/Frame 1462983545.png",
      description:
          "Westfalenpark is one of Dortmund's largest and most beautiful parks, covering over 70 hectares. It features meticulously landscaped gardens, serene lakes, and vibrant flowerbeds, making it an ideal spot for relaxation and leisurely strolls. The park is home to the iconic Florianturm tower, which offers breathtaking views of the city from its observation deck. Throughout the year, Westfalenpark hosts various events, including festivals and concerts, attracting locals and tourists alike. Whether you're looking to enjoy a picnic, take a boat ride, or simply unwind in nature, Westfalenpark has something for everyone.",
      reviewer: "Milo Fischer",
      reviewerdescription:
          "Westfalenpark is one of the most beautiful parks I've ever visited! The gardens are meticulously maintained, and there are plenty of spots to relax or have a picnic. The Florianturm offers stunning views of Dortmund, and I highly recommend going up there. It’s a perfect place to unwind after a busy day of sightseeing ",

      reviewer2: 'Clara Jensen',
      reviewerdescription2:
          'I had a lovely afternoon at Westfalenpark! The flowerbeds were in full bloom, and I enjoyed walking around the serene lakes. There were also many families enjoying the park, which created a joyful atmosphere. I can’t wait to return for one of their events or concerts!',
      date: "25 March 2024",
      url:
          "https://www.google.com/maps/place/Вестфаленпарк+Дортмунд/@51.4955344,7.4761159,17z/data=!3m1!4b1!4m6!3m5!1s0x47b91770564f5697:0xd2ea1a0fd28b0ad2!8m2!3d51.4955311!4d7.4786908!16s%2Fg%2F1234zjd_?entry=ttu&g_ep=EgoyMDI1MDMwNC4wIKXMDSoASAFQAw%3D%3D",
    ),
  ];
  final List<Restaurants> _restaurants = [
    Restaurants(
      title: "Brauhaus Dortmund",
      image: "images/Fram 1462983545.png",
      description:
          "Brauhaus Dortmund is a traditional German brewery and restaurant that captures the essence of local cuisine and culture. The establishment offers a cozy atmosphere where guests can enjoy freshly brewed beers alongside hearty German dishes such as sausages, schnitzels, and pretzels. The brewery's interior is adorned with wooden beams and rustic decor, creating an authentic experience. With its friendly staff and lively ambiance, Brauhaus Dortmund is a popular spot for both locals and visitors looking to indulge in classic German fare while savoring a pint of locally crafted beer.",

      reviewer: "Nina Petrov",
      reviewerdescription:
          "Brauhaus Dortmund is a fantastic place to experience authentic German cuisine! The atmosphere is cozy, and the staff is friendly. I tried their schnitzel and it was one of the best I've ever had. Pairing it with their freshly brewed beer made for an unforgettable meal",
      reviewer2: "Theo Müller",
      reviewerdescription2:
          "I loved my visit to Brauhaus Dortmund! The rustic decor adds to the charm, and the food was delicious. I especially enjoyed their pretzels and local sausages. It’s a great spot to relax and enjoy some hearty German dishes after a long day of exploring ",
      date: "14 April 2024",
      url:
          "https://www.google.com/maps/search/Brauhaus+Dortmund/@51.4955626,7.4580913,14z/data=!3m1!4b1?entry=ttu&g_ep=EgoyMDI1MDMwNC4wIKXMDSoASAFQAw%3D%3D",
    ),
    Restaurants(
      title: "Ristorante Da Vinci",
      image: "images/glas.png",
      description:
          "Ristorante Da Vinci brings a taste of Italy to Dortmund with its authentic Italian cuisine and warm atmosphere. The restaurant is known for its extensive menu featuring traditional dishes like pasta, pizza, and seafood, all prepared with fresh ingredients. Guests can enjoy their meals in a charming setting adorned with Italian decor. Da Vinci also offers an impressive selection of wines to complement your dining experience. Whether you're celebrating a special occasion or simply craving Italian comfort food, Ristorante Da Vinci provides a delightful culinary escape.",
      reviewer: "Elena Rossi",
      reviewerdescription:
          "Ristorante Da Vinci exceeded my expectations! The pasta was cooked to perfection, and the flavors were incredible. The ambiance is warm and inviting, making it perfect for a romantic dinner or family gathering. I also appreciated their extensive wine selection  reviewer2: 'Theo Müller' ",
      reviewer2: "Jasper van Dijk",
      reviewerdescription2:
          "I had a wonderful dining experience at Ristorante Da Vinci! The service was impeccable, and my pizza was one of the best I've had outside of Italy. The atmosphere is charming, and it felt like a little slice of Italy in Dortmund. I can’t wait to go back  ",
      date: "28 May 2024",
      url:
          "https://www.google.com/maps/search/Ristorante+Da+Vinci/@51.4955531,7.1490565,10z/data=!3m1!4b1?entry=ttu&g_ep=EgoyMDI1MDMwNC4wIKXMDSoASAFQAw%3D%3D",
    ),
  ];
  final List<Entertainment> _enterteinment = [
    Entertainment(
      title: "UCI Kinowelt Dortmund",
      image: "images/Frame 14983545.png",
      description:
          "UCI Kinowelt Dortmund is a modern cinema complex that offers the latest blockbusters in a comfortable setting. With multiple screens equipped with state-of-the-art technology, moviegoers can enjoy an immersive cinematic experience. The complex features plush seating and a variety of concessions, including popcorn and snacks. UCI Kinowelt frequently hosts special screenings and film festivals, making it a popular destination for film enthusiasts. Whether you're looking to catch the latest release or enjoy a classic film, this cinema provides an excellent outing for friends and families.",
      reviewer: "Freya Lindström",
      reviewerdescription:
          "UCI Kinowelt Dortmund is an excellent cinema! The seats are comfortable, and the sound quality is top-notch. I went to see a blockbuster film and loved every minute of it. The variety of snacks available made it even better. Highly recommended for movie lovers!",
      reviewer2: "Owen",
      reviewerdescription2:
          "I had a great time at UCI Kinowelt! The theater was clean, and the staff was friendly. I appreciated that they show both international films and local favorites. It’s a great way to spend an evening with friends or family!",
      date: "16 July 2024",
      url:
          "https://www.google.com/maps/place/UCI+Ruhr+Park+(Bochum)/@51.4958364,7.2745398,17z/data=!3m2!4b1!5s0x47b91fb3c44bf037:0x6240f16e0c6ce91c!4m6!3m5!1s0x47b8e01b9a1e5c8b:0x853d900718f8e0a!8m2!3d51.4958331!4d7.2771147!16s%2Fg%2F1tjz2gdh?entry=ttu&g_ep=EgoyMDI1MDMwNC4wIKXMDSoASAFQAw%3D%3D",
    ),

    Entertainment(
      title: "Signal Iduna Park (Westfalenstadion)",
      image: "images/hgj.png",
      description:
          "Signal Iduna Park, also known as Westfalenstadion, is the home stadium of Borussia Dortmund football club and one of the most iconic football venues in Europe. With a capacity of over 81,000 spectators, it is renowned for its electric atmosphere during matches. Fans flock to witness thrilling Bundesliga games and international fixtures, creating an unforgettable experience. The stadium also offers guided tours that take visitors behind the scenes to explore its history and facilities. For sports lovers, attending a match at Signal Iduna Park is a must-do activity in Dortmund.",
      reviewer: "Isla Moreau",
      reviewerdescription:
          "Attending a match at Signal Iduna Park was an unforgettable experience! The atmosphere is electric, with passionate fans cheering for Borussia Dortmund. The stadium itself is impressive, and I loved the guided tour that gave us insights into its history. A must-visit for any football fan!",
      reviewer2: "Felix Schmidt",
      reviewerdescription2:
          "Signal Iduna Park is simply amazing! The energy during a game is something you have to experience for yourself. Even if you’re not a football fan, the stadium tour is worth it to learn about its rich history and see behind the scenes. Can’t wait to go back for another match!",
      date: "11 August 2024",
      url:
          "https://www.google.com/maps/place/Сигнал+Идуна+Парк/@51.4925921,7.4492825,17z/data=!3m2!4b1!5s0x47b919d3ba62d2a3:0x64dca8536434a630!4m6!3m5!1s0x47b919d39230d60f:0x8fd9c195ad02eddf!8m2!3d51.4925888!4d7.4518574!16zL20vMDZkenRr?entry=ttu&g_ep=EgoyMDI1MDMwNC4wIKXMDSoASAFQAw%3D%3D",
    ),
  ];
  final List<Recreation> _recreation = [
    Recreation(
      title: "Rombergpark",
      image: "images/Frame 146295.png",
      description:
          "Rombergpark is a stunning botanical garden located in Dortmund that showcases an impressive collection of plants from around the world. Covering over 65 hectares, this tranquil park features beautiful walking paths, ponds, and themed gardens that invite visitors to explore nature's beauty. The park is perfect for leisurely strolls, picnics, or simply relaxing amidst lush greenery. Additionally, Rombergpark hosts various events throughout the year, including flower exhibitions and cultural festivals, making it an engaging destination for families and nature enthusiasts.",

      reviewer: "Maya Novak",
      reviewerdescription:
          "Rombergpark is an absolute paradise for nature lovers! The variety of plants and flowers is stunning, and I enjoyed wandering through the themed gardens. The peaceful ponds add to the tranquility of the park, making it a perfect spot for a picnic or just to unwind. I also appreciated the events they host; I was lucky enough to catch a flower exhibition during my visit!",
      reviewer2: "Luca Santoro",
      reviewerdescription2:
          'I had a delightful afternoon at Rombergpark! The walking paths are well-maintained, and there are plenty of benches to sit and enjoy the surroundings. It’s a great place for families, with lots of space for kids to run around. I highly recommend bringing a camera; the scenery is just breathtaking!',
      date: "5 September 2024",
      url:
          "https://www.google.com/maps/search/Rombergpark/@51.4926083,7.4415577,15z/data=!3m1!4b1?entry=ttu&g_ep=EgoyMDI1MDMwNC4wIKXMDSoASAFQAw%3D%3D",
    ),
    Recreation(
      title: "Phoenix See",
      image: "images/Frame 62983545.png",
      description:
          "Phoenix See is an artificial lake located in the former industrial area of Dortmund that has been transformed into a picturesque recreational area. The lake is surrounded by walking and cycling paths, making it an ideal spot for outdoor activities such as jogging or biking. Visitors can enjoy various water sports or simply relax by the waterfront while taking in the scenic views. The area also features cafes and restaurants where guests can unwind after a day of exploring. Phoenix See is perfect for those seeking relaxation or adventure in a beautiful setting.",
      reviewer: "Zara Ivanova",
      reviewerdescription:
          "Phoenix See is a fantastic transformation of an old industrial area! The lake is beautiful, and the walking and cycling paths make it easy to explore. I enjoyed renting a bike and riding along the waterfront. There are also several lovely cafes where you can relax with a drink and take in the views. A perfect spot for a sunny day!",
      reviewer2: "Ruben Garcia",
      reviewerdescription2:
          'I loved my visit to Phoenix See! The atmosphere is vibrant, with people enjoying various activities by the water. I tried some water sports, which were so much fun! The surrounding restaurants offer delicious food and drinks, making it an ideal place to spend the day with friends or family. I can’t wait to return!',
      date: "20 July 2024",
      url:
          "https://www.google.com/maps/place/оз.+Пхёникс/@51.4893203,7.5078896,16z/data=!3m1!4b1!4m6!3m5!1s0x47b91703be6bd6bd:0x12fad52b65887668!8m2!3d51.4907224!4d7.513473!16s%2Fg%2F120x5qnt?entry=ttu&g_ep=EgoyMDI1MDMwNC4wIKXMDSoASAFQAw%3D%3D",
    ),
  ];

  final List<Library> _library = [
    Library(
      title: "Dortmund in 1 day",
      image: "images/1.png",
      description:
          "Explore the vibrant city of Dortmund with this exciting route! Start your journey at the iconic Signal Iduna Park, home to the famous Borussia Dortmund football team. From there, stroll through the lush Westfalenpark, where you can enjoy beautiful gardens and the stunning Florianturm tower. Next, head to the historic city center, where you'll find the impressive Reinoldikirche and the bustling Alter Markt square. Don't miss the chance to visit the Museum Ostwall for contemporary art, and wrap up your day with a delicious meal at one of the local breweries, savoring traditional German cuisine. This route offers a perfect blend of culture, history, and leisure!",
      duration: "3h 40m",
      reviewer: "Oliver Thompson",
      reviewerdescription:
          "Exploring Dortmund was an unforgettable adventure! The vibrant streets were filled with life, and the local cuisine was a delightful surprise. I particularly enjoyed visiting the stunning Westfalenpark, where the gardens were in full bloom. The people were warm and welcoming, making my experience even better. I can't wait to return and discover more hidden gems in this charming city!",
      reviewer2: "Emma Schneider",
      reviewerdescription2:
          "My trip through Dortmund was simply amazing! The city's rich history and modern architecture blended beautifully. I loved wandering around the old town and stopping by the famous Reinoldikirche. The food scene was fantastic too, especially the local sausages! I highly recommend taking a stroll along the Phoenix See for a picturesque view. Dortmund has so much to offer for every traveler!",
      date: "26 june 2024",
      place1: "Hohensyburg",
      place2: "Westfalenpark",
      place3: "Brauhaus Dortmund",
      place1_image: "images/Frame 1714.png",
      place2_image: "images/2.png",
      place3_image: "images/3.png",
      url:
          "https://www.google.com/maps/search/Dortmund+in+1+day/@51.4893665,7.4769899,13z/data=!3m1!4b1?entry=ttu&g_ep=EgoyMDI1MDMwNC4wIKXMDSoASAFQAw%3D%3D",
    ),
    Library(
      title: "Best promenade in Dortmund",
      image: "images/Frame 14983545.png",
      description:
          "Discover the best promenade in Dortmund with this delightful itinerary! Begin your adventure at the renowned Signal Iduna Park, the proud home of Borussia Dortmund. After soaking in the football atmosphere, take a leisurely walk through the beautiful Westfalenpark, where you can admire the vibrant gardens and the impressive Florianturm tower. Continue your exploration in the historic city center, where the majestic Reinoldikirche and the lively Alter Markt square await. Be sure to stop by the Museum Ostwall to appreciate contemporary art, and end your day with a hearty meal at a local brewery, indulging in authentic German dishes. This route perfectly combines culture, history, and relaxation!",
      duration: "2h 50m",
      reviewer: "Oliver Thompson",
      reviewerdescription:
          "Exploring Dortmund was an unforgettable adventure! The vibrant streets were filled with life, and the local cuisine was a delightful surprise. I particularly enjoyed visiting the stunning Westfalenpark, where the gardens were in full bloom. The people were warm and welcoming, making my experience even better. I can't wait to return and discover more hidden gems in this charming city!",
      reviewer2: "Emma Schneider",
      reviewerdescription2:
          "My trip through Dortmund was simply amazing! The city's rich history and modern architecture blended beautifully. I loved wandering around the old town and stopping by the famous Reinoldikirche. The food scene was fantastic too, especially the local sausages! I highly recommend taking a stroll along the Phoenix See for a picturesque view. Dortmund has so much to offer for every traveler!",
      date: "30 March 2024",
      place1: "Hohensyburg",
      place2: "Westfalenpark",
      place3: "Brauhaus Dortmund",
      place1_image: "images/11.png",
      place2_image: "images/12.png",
      place3_image: "images/13.png",
      url:
          "https://www.google.com/maps/place/Дортмунд,+Германия/@51.5079827,7.3054563,11z/data=!3m1!4b1!4m6!3m5!1s0x47b91760bff07a11:0x427f28131548750!8m2!3d51.5135872!4d7.4652981!16zL20vMDEzNWsy?entry=ttu&g_ep=EgoyMDI1MDMwNC4wIKXMDSoASAFQAw%3D%3D",
    ),
    Library(
      title: "Unusual places",
      image: "images/a.png",
      description:
          "Embark on a unique journey through Dortmund, where hidden gems await your discovery! Start your day by exploring an eclectic neighborhood filled with vibrant street art and quirky shops. Next, wander through a serene park that boasts unusual sculptures and peaceful walking paths, perfect for a moment of reflection. As you continue, uncover a local market brimming with artisanal goods and delicious treats, where you can mingle with friendly vendors. Don’t miss the chance to visit a lesser-known museum that showcases fascinating exhibits, offering a glimpse into the city’s rich culture. Finally, wrap up your adventure at a cozy café tucked away in a charming alley, where you can savor a delightful pastry and soak in the local atmosphere.",
      duration: "4h 10m",
      reviewer: "Oliver Thompson",
      reviewerdescription:
          "Dortmund is a treasure trove of unique experiences! The eclectic mix of art installations and quirky shops makes every corner a delight to explore. I stumbled upon a hidden café that served the most inventive desserts, and the atmosphere was so cozy. The local street art adds a vibrant touch to the city, making it feel alive and creative. I can't wait to uncover more of Dortmund's unusual spots on my next visit!",
      reviewer2: "Sofia Müller",
      reviewerdescription2:
          "If you're looking for something off the beaten path in Dortmund, you're in for a treat! The city is dotted with fascinating little nooks that tell stories of its past. I found a charming bookstore tucked away in a narrow alley, filled with rare finds and local authors. The blend of old and new is captivating, and the unexpected surprises around every corner make it a must-visit destination for adventurous travelers!",
      date: "15 August 2024",
      place1: "Signal Iduna Park",
      place2: "Phoenix See",
      place3: "Hohensyburg",
      place1_image: "images/aa.png",
      place2_image: "images/aaa.png",
      place3_image: "images/aaaa.png",
      url:
          "https://www.google.com/maps/place/Дортмунд,+Германия/@51.5076849,7.1584525,11z/data=!3m1!4b1!4m6!3m5!1s0x47b91760bff07a11:0x427f28131548750!8m2!3d51.5135872!4d7.4652981!16zL20vMDEzNWsy?entry=ttu&g_ep=EgoyMDI1MDMwNC4wIKXMDSoASAFQAw%3D%3D",
    ),
  ];

  // Getters to access the lists
  List<Attractions> get attractions => _atractions;
  List<Restaurants> get restaurants => _restaurants;
  List<Entertainment> get entertainment => _enterteinment;
  List<Recreation> get recreation => _recreation;
  List<Library> get library => _library;
  List<Routee> get routee => _routee;
  // You can add methods to modify the lists and notify listeners
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> _launchUrl(String url) async {
    final Uri url0 = Uri.parse(url);
    if (await canLaunch(url0.toString())) {
      await launch(url0.toString());
    } else {
      throw Exception('Could not launch $url0');
    }
  }

  void addRoutee(Routee routee) {
    _routee.add(routee);
    notifyListeners();
  }

  void addPlaces(Routee route, Places places) {
    route.places.add(places);
    notifyListeners();
  }

  void setRoutee(Routee route) {
    _routee = [route];
    notifyListeners();
  }
}
