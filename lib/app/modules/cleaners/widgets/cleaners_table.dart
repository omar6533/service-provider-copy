import 'package:cloundry_care/app/modules/cleaners/widgets/table_data.dart';
import 'package:cloundry_care/app/modules/cleaners/widgets/text_data_column.dart';
import 'package:cloundry_care/app/modules/dashboard/widgets/empty_view.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cleaners_controller.dart';

class CleanersTable extends StatelessWidget {
  final CleanersController cleanersController;

  const CleanersTable({
    super.key,
    required this.cleanersController,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: cleanersController.filterData.stream,
        builder: (context, snapshot) {
          return cleanersController.filterData.isEmpty
              ? EmptyView(
                  message: 'you don\'nt have any requests'.tr,
                )
              : Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 600,
                      width: MediaQuery.of(context).size.width / 1.26,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: PaginatedDataTable(
                          source: TableData(context),

                          columns: [
                            DataColumn2(
                              label: GestureDetector(
                                  onTap: () {
                                    if (cleanersController.filterData.isEmpty) {
                                      return;
                                    }
                                    if (cleanersController.allSelected.value ==
                                        false) {
                                      for (var i = 0;
                                          i <
                                              cleanersController
                                                  .filterData.length;
                                          i++) {
                                        cleanersController.selectedIndex.add(i);
                                      }
                                      cleanersController.allSelected.value ==
                                          true;
                                    } else {
                                      cleanersController.selectedIndex.value =
                                          [];
                                      cleanersController.allSelected.value ==
                                          false;
                                    }
                                    cleanersController.allSelected.value =
                                        !cleanersController.allSelected.value;
                                  },
                                  child: StreamBuilder<Object>(
                                      stream:
                                          cleanersController.allSelected.stream,
                                      builder: (context, snapshot) {
                                        return Icon(
                                          cleanersController
                                                      .allSelected.value ==
                                                  false
                                              ? Icons.check_box_outline_blank
                                              : Icons.check_box,
                                          color: cleanersController
                                                      .allSelected.value ==
                                                  false
                                              ? const Color(0xffbfbfbf)
                                              : null,
                                          size: 20,
                                        );
                                      })),
                              size: ColumnSize.L,
                            ),
                            textDataColumn('#'),
                            textDataColumn('Name'),
                            textDataColumn('Iqama No.'),
                            textDataColumn("Email"),
                            textDataColumn("Phone No."),
                            textDataColumn("Gender"),
                            textDataColumn("Age"),
                            textDataColumn("Actived/Deactivated"),
                            textDataColumn(''),
                          ],
                          columnSpacing: 30,
                          horizontalMargin: 15,
                          rowsPerPage: 8,
                          // showCheckboxColumn: true,
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
