import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({key}) : super(key: key);

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

// ini file tambahan untuk search yang ngambang pak
// kalau banyak terjadi error karne null safety cobe bapa buka
// file pubspec.yaml trus ganti versi flutternye yang awalnye
// environment:
// sdk: ">=2.12.0 <3.0.0"
// menjadi
// environment:
// sdk: ">=2.7.0 <3.0.0"
// abis tu amaa am

int toggle = 1;

class _SearchButtonState extends State<SearchButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _con;
  @override
  void initState() {
    super.initState();
    _con = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 375),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(top: 430, left: 80),
        height: 100,
        width: 250,
        alignment: const Alignment(1.0, 0.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 375),
          height: 48,
          width: (toggle == 0) ? 48.0 : 250.0,
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  spreadRadius: -10,
                  blurRadius: 10,
                  offset: Offset(0, 10)),
            ],
          ),
          child: Stack(
            children: [
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (toggle == 0) {
                        toggle = 1;
                        _con.forward();
                      } else {
                        toggle = 0;
                        _con.reverse();
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 26,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 375),
                left: (toggle == 0 ? 20 : 40),
                top: 13,
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  opacity: (toggle == 0) ? 0 : 1,
                  duration: const Duration(milliseconds: 375),
                  child: SizedBox(
                    height: 23,
                    width: 180,
                    child: TextField(
                      cursorRadius: const Radius.circular(10),
                      cursorWidth: 2,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Search ...',
                        labelStyle: const TextStyle(
                          color: Color(0xFF5B5B5B),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
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
