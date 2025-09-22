import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  int _currentIndex = 0;
  final carousel.CarouselController _carouselController =
      carousel.CarouselController();

  final List<Map<String, String>> _storyData = [
    {
      "year": "1986",
      "image": "assets/images/glacier_1.jpg",
      "description":
          "The Columbia Glacier in the mid-1980s, appearing stable and vast. At this point, the glacier's terminus (its endpoint) had been in the same general location for centuries, a massive river of ice flowing into Prince William Sound, Alaska."
    },
    {
      "year": "2000",
      "image": "assets/images/glacier_2.jpg",
      "description":
          "By the year 2000, the retreat is well underway. A combination of warmer air and ocean temperatures caused the glacier to thin and its terminus to recede significantly, breaking off into icebergs more rapidly in a process called calving."
    },
    {
      "year": "2014",
      "image": "assets/images/glacier_3.jpg",
      "description":
          "The retreat has dramatically accelerated. The glacier has pulled back more than 12 miles (20 km) from its original position. This rapid melting contributes directly to global sea-level rise, impacting coastal communities thousands of miles away."
    },
    {
      "year": "2023",
      "image": "assets/images/glacier_4.jpg",
      "description":
          "The glacier is a shadow of its former self, having split into multiple smaller streams of ice. This massive loss affects local ecosystems and freshwater resources, demonstrating the profound impact of a warming climate—a story told by satellites like Terra for 25 years."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terra's Legacy: A Glacier's Retreat"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Visualizing 25 Years of Climate Change",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "Data from NASA's Terra satellite helps us witness the dramatic retreat of the Columbia Glacier in Alaska.",
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              carousel.CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: _storyData.length,
                itemBuilder: (context, index, realIndex) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      _storyData[index]["image"]!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_not_supported,
                                  size: 50, color: Colors.grey),
                              SizedBox(height: 8),
                              Text("Image not found",
                                  style: TextStyle(color: Colors.grey)),
                              Text("Please add images to assets/images/",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
                options: carousel.CarouselOptions(
                  height: 300,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Year: ${_storyData[_currentIndex]["year"]}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.tealAccent,
                ),
              ),
              Slider(
                value: _currentIndex.toDouble(),
                min: 0,
                max: _storyData.length - 1,
                divisions: _storyData.length - 1,
                activeColor: Colors.teal,
                inactiveColor: Colors.teal.withOpacity(0.3),
                onChanged: (double value) {
                  setState(() {
                    _currentIndex = value.toInt();
                    _carouselController.animateToPage(_currentIndex);
                  });
                },
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _storyData[_currentIndex]["description"]!,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
