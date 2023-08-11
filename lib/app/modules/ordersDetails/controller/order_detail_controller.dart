import 'package:cloundry_care/app/modules/dashboard/controllers/order_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/model/order_model.dart';
import 'package:cloundry_care/shared/base_controller.dart';
import 'package:get/get.dart';

class OrderDetailController extends BaseController {
  OrdersController ordersController = Get.put(OrdersController());
  RxList<OrderModel> orderDetailList = List<OrderModel>.of([
    OrderModel(
      apartmentName: 'Al olaya apartment',
      date: '03 - 05 - 2023',
      cleaner: 'Ahamad saleh',
      statusSort: StatusSort.inProgress,
      file: 'File132.pdf',
    ),
    OrderModel(
      apartmentName: 'Al olaya apartment',
      date: '03 - 05 - 2023',
      cleaner: 'Ahamad saleh',
      statusSort: StatusSort.cleaning,
      file: 'File132.pdf',
    ),
    OrderModel(
        apartmentName: 'Al olaya apartment',
        date: '03 - 05 - 2023',
        cleaner: 'Ahamad saleh',
        statusSort: StatusSort.todo,
        file: 'File132.pdf'),
    OrderModel(
        apartmentName: 'Al olaya apartment',
        date: '03 - 05 - 2023',
        cleaner: 'Ahamad saleh',
        statusSort: StatusSort.inProgress,
        file: 'File132.pdf'),
    OrderModel(
        apartmentName: 'Al olaya apartment',
        date: '03 - 05 - 2023',
        cleaner: 'Ahamad saleh',
        statusSort: StatusSort.cleaning,
        file: 'File132.pdf'),
    OrderModel(
        apartmentName: 'Al olaya apartment',
        date: '03 - 05 - 2023',
        cleaner: 'Ahamad saleh',
        statusSort: StatusSort.todo,
        file: 'File132.pdf'),
    OrderModel(
        apartmentName: 'Al olaya apartment',
        date: '03 - 05 - 2023',
        cleaner: 'Ahamad saleh',
        statusSort: StatusSort.todo,
        file: 'File132.pdf'),
    OrderModel(
        apartmentName: 'Al olaya apartment',
        date: '03 - 05 - 2023',
        cleaner: 'Ahamad saleh',
        statusSort: StatusSort.todo,
        file: 'File132.pdf')
  ]).obs;
}
