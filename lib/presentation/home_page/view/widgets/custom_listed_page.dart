// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:spot_x/presentation/home_page/controller/song_data_controller.dart';
class CustomListedPage extends StatefulWidget {
  const CustomListedPage({
    super.key,
    required this.songName,
    required this.onPressed,
    // required this.img,
    required this.artist,
  });

  final String songName;
  // final String img;
  final String artist;
  final VoidCallback onPressed;

  @override
  State<CustomListedPage> createState() => _CustomListedPageState();
}

class _CustomListedPageState extends State<CustomListedPage> {
  SongDataController songDataController = Get.put(SongDataController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) => InkWell(
              onTap: widget.onPressed,
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/Iphone.jpeg"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 18),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  widget.songName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  widget.artist,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(height: 1),
        itemCount: 1);
  }
}
