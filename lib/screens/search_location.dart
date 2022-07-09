import 'package:flutter/material.dart';

class SearchLocation extends StatelessWidget {
  static const routeName = "/location";

  final List<Map<String, String>> _cities = [
    {
      "name": "Gurugram",
      "image": "https://cdn.w600.comps.canstockphoto.com/india-gate-delhi-clipart-vector_csp42368756.jpg",
    },
    {
      "name": "Delhi",
      "image": "https://cdn.w600.comps.canstockphoto.com/india-gate-delhi-clipart-vector_csp42368756.jpg",
    },
    {
      "name": "Noida",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Ghaziabad",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Greater Noida",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Faridabad",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Pune",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Mumbai",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Bahadurgarh",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Navi Mumbai",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Thane",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Nashik",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Sonipat",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Bangalore",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Palghar",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Nagpur",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Vadodara",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    },
    {
      "name": "Aurangabad",
      "image": "https://img.favpng.com/3/9/25/gateway-of-india-india-gate-coloring-book-drawing-png-favpng-JYczet6bH1YKACJ3hJA4tG5Dd.jpg",
    }

  ];

  SearchLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 22.0,
          fontWeight: FontWeight.bold
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Search Location"
        )
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: Material(
                elevation: 4.0,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Location",
                    suffixIcon: Icon(
                      Icons.close,
                    )
                  ),
                ),
              )
            ),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.red[100]
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )
                )
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.my_location,
                    size: 22.0,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "Use my Current Location",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    )
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Text(
              "Popular Cities",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              )
            ),
            const SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                ),
                children: [
                  ..._cities.map((element) {
                    return Card(
                      elevation: 4.0,
                      child: Column(
                        children: [
                          // Image(
                          //   height: 80,
                          //   image: NetworkImage(
                          //     element["image"]!
                          //   ),
                          //   fit: BoxFit.cover
                          // ),
                          Text(
                            element["name"]!,
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}
