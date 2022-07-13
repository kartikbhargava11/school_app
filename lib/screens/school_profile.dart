import 'package:flutter/material.dart';

import '../widgets/school_profile_header.dart';
import '../widgets/school_profile_actions.dart';
import '../widgets/school_profile_apply_to_classes.dart';
import '../widgets/school_profile_stats.dart';
import '../widgets/school_profile_fee_structure.dart';

import '../models/school.dart';


class SchoolProfile extends StatefulWidget {
  final School school;
  const SchoolProfile({
    required this.school,
    Key? key}) : super(key: key);

  @override
  State<SchoolProfile> createState() => _SchoolProfileState();
}

class _SchoolProfileState extends State<SchoolProfile> {
  var _scrollOffset = 0.0;
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      child: Card(
        elevation: 4.0,
        child: child,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _scrollOffset > 250
        ?
      AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.school.name,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 20.0,
          color: Colors.black
        ),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 32.0,
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            iconSize: 32.0,
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      )
        :
      null,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Image(
                  height: 280,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.school.imageUrl,
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        iconSize: 32.0,
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            color: Colors.white,
                            iconSize: 32.0,
                            icon: const Icon(Icons.share),
                          ),
                          IconButton(
                            onPressed: () {},
                            color: Colors.white,
                            iconSize: 32.0,
                            icon: const Icon(Icons.shopping_cart),
                          ),
                        ],
                      )
                    ],
                  )
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _buildContainer(
                    child: SchoolProfileHeader(
                      school: widget.school,
                    )
                  ),
                )
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 6.0),
            sliver: SliverToBoxAdapter(
              child: _buildContainer(
                child: const SchoolProfileActions(),
              ),
            )
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 6.0),
            sliver: SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 4.0,
              pinned: true,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 24.0,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "I am looking Admission for",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.0
                                )
                              ),
                              Text(
                                "Aiden Sharma",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black,
                            size: 22.0,
                          )
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 6.0),
            sliver: SliverToBoxAdapter(
              child: _buildContainer(
                child: SchoolProfileApplyToClasses(
                  formDetails: widget.school.formDetails,
                )
              )
            )
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 6.0),
            sliver: SliverToBoxAdapter(
              child: _buildContainer(
                child: SchoolProfileStats(
                  school: widget.school,
                )
              )
            )
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 6.0),
            sliver: SliverToBoxAdapter(
              child: _buildContainer(
                child: SchoolProfileFeeStructure()
              )
            )
          ),
        ],
      )
    );
  }
}
