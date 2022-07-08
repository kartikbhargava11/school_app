import 'package:flutter/material.dart';

class SchoolProfileFeeStructure extends StatelessWidget {
  final _standards = [
    {
      "name": "Pre-Nursery",
      "active": true,
    },
    {
      "name": "Nursery",
      "active": false,
    },
    {
      "name": "Prep",
      "active": false,
    }
  ];

  final _fees = [
    {
      "name": "Registration Fees",
      "tenure": "Onetime",
      "fees": "25"
    },
    {
      "name": "Admission Fees",
      "tenure": "Onetime",
      "fees": "10,250"
    },
    {
      "name": "Tuition Fees",
      "tenure": "Monthly",
      "fees": "4,500"
    },
    {
      "name": "Annual Fees",
      "tenure": "Annually",
      "fees": "5,000"
    },
    {
      "name": "Other Fees",
      "tenure": "Annually",
      "fees": "4,000"
    },
  ];

  SchoolProfileFeeStructure({Key? key}) : super(key: key);

  void _changeStandard(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          height: 500,
          child: ListView.separated(
            itemCount: _standards.length + 1,
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 4.0, left: 16.0, right: 16.0),
                  child: Text(
                    "Select Class",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                );
              }
              final Map<String, dynamic> standard = _standards[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      standard["name"],
                      style: TextStyle(
                        color: standard["active"] == true ? Colors.blue : Colors.grey,
                        fontSize: 16.0
                      )
                    ),
                    const Spacer(),
                    if (standard["active"] == true)
                      const Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                        size: 24.0,
                      )
                  ],
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider(
                color: Colors.grey,
              );
            },
          )
        ),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.blue[200],
          ),
          child: const Text(
            "Fee Structure",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            )
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.blue[100],
          ),
          child: Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.filter_list_alt,
                    size: 24.0,
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  const Text(
                    "Filters",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      thickness: 2.0,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () => _changeStandard(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                      child: Row(
                        children: const [
                          Text(
                              "Pre-Nursery"
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                              Icons.keyboard_arrow_down
                          )
                        ],
                      )
                    )
                  ),
                ],
              ),
            ],
          )
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Text(
            "Fee Details for Pre-Nursery",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500
            )
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _fees.length,
          separatorBuilder: (ctx, index) {
            return const Divider(
              color: Colors.grey,
              thickness: 1.0,
            );
          },
          itemBuilder: (ctx, index) {
            final fee = _fees[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "${fee['name']}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      fee["tenure"] as String,
                      style: const TextStyle(
                        fontSize: 12.0
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Rs.${fee['fees']}",
                      style: const TextStyle(
                        fontSize: 12.0
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total cost for a new admission",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "Rs. 73,275",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "for first year",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Text(
                "What is this cost and how it is calculated?",
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              const Text(
                "Monthly Cost",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Text(
                "Rs. 5,251",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Text(
                "What is this cost and how it is calculated?",
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
