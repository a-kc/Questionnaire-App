import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return
      Expanded(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
          itemCount: summaryData.length,
          itemBuilder: (context, index) {
            return Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(48, 236, 191, 252),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        ((summaryData[index]['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.courierPrime(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            summaryData[index]['question'] as String,
                            style: GoogleFonts.courierPrime(color: Colors.grey),
                          ),
                          Text(
                            summaryData[index]['user_chose_answer'] as String,
                            style: GoogleFonts.courierPrime(color: Colors.green),
                          ),
                          Text(
                            summaryData[index]['correct_answer'] as String,
                            style: GoogleFonts.courierPrime(color: Colors.red),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '----------------------------------------',
                            style: GoogleFonts.courierPrime(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
        
        
        
                ),
              ),
            );
          },
              ),
        ),
      );
  }
}
