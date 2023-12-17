import 'package:flutter/material.dart';


class detail_page extends StatefulWidget {
  final String title;
  final String category;
  final String judul;
  final String description;
  final String history;
  final String gambarAssets;

  detail_page({
    required this.title,
    required this.category,
    required this.judul,
    required this.description,
    required this.history,
    required this.gambarAssets,
  });

  @override
  _detail_pageState createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple[300],
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 23,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.deepPurple[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 2, color: Color.fromARGB(255, 73, 3, 90)),
                    image: DecorationImage(
                      image: NetworkImage(widget.gambarAssets),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'PROVINSI : ' + widget.category, 
                            style: TextStyle(
                              fontSize: 18, 
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Color.fromARGB(255, 73, 3, 90),
                                size: 25,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.share_outlined,
                                color: Color.fromARGB(255, 73, 3, 90),
                                size: 25,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          widget.judul,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        alignment: Alignment.topCenter,
                        child: Text(
                          isExpanded ? widget.description : widget.description.substring(0, 200) + "...",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      isExpanded
                          ? Container() // kalo teks dah panjang nda ada button read more
                          : TextButton(
                            onPressed: () {
                              setState(() {
                                isExpanded = !isExpanded; // Mengganti kondisi teks (perpanjang atau pendek)
                              });
                            },
                            child: Text(isExpanded ? "Show less" : "Read More"), // Mengubah teks tombol
                          ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text('Sejarah ' + widget.judul,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        alignment: Alignment.topCenter,
                        child: Text(
                          widget.history,
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
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
