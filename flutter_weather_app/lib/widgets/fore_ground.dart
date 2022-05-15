import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data.dart';

class Foreground extends StatelessWidget {
  const Foreground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    const inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.ibb.co/Z1fYsws/profile-image.jpg',
              ),
              backgroundColor: Colors.black26,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: DefaultTextStyle(
          style: GoogleFonts.raleway(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Hello Siti',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Check the weather by the city',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: inputBorder,
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder,
                  hintText: 'Search city',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My locations',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  OutlinedButton(
                    child: Icon(Icons.more_horiz),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      side: const BorderSide(width: 1, color: Colors.white),
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var _location in locations)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.black45,
                              BlendMode.darken,
                            ),
                            child: Image.network(
                              _location.imageUrl,
                              height: height * 0.35,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                _location.text,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(_location.timing),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                _location.temperature.toString() + '°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 50),
                              Text(_location.weather),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
