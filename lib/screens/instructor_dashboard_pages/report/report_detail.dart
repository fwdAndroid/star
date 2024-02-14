import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/utils/colors.dart';

class ReportDetail extends StatefulWidget {
  final pid, pName, pSubject, prat, uuid, idi;
  const ReportDetail(
      {super.key,
      required this.pName,
      required this.pSubject,
      required this.pid,
      required this.idi,
      required this.uuid,
      required this.prat});

  @override
  State<ReportDetail> createState() => _ReportDetailState();
}

class _ReportDetailState extends State<ReportDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report',
          style: GoogleFonts.acme(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Name',
                  style: GoogleFonts.abhayaLibre(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  child: Text(
                    widget.pName,
                    style: GoogleFonts.abhayaLibre(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Subject',
                  style: GoogleFonts.abhayaLibre(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  child: Text(
                    widget.pSubject,
                    style: GoogleFonts.abhayaLibre(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Percentate',
                  style: GoogleFonts.abhayaLibre(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  child: Text(
                    widget.prat.toString(),
                    style: GoogleFonts.abhayaLibre(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.2),
            ),
          ),
          Center(
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Delete",
                  style: TextStyle(color: colorDelete),
                )),
          )
        ],
      ),
    );
  }
}
