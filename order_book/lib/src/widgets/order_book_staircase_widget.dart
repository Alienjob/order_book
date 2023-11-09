import 'package:flutter/material.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/service/localization.dart';
import 'package:order_book/src/service/style.dart';
import 'package:order_book/src/widgets/order_book_staircase_animator.dart';
import 'package:order_book/src/widgets/order_book_total_indicator_manager.dart';


class OrderBookStaircaseWidget extends StatefulWidget {
  OrderBookStaircaseWidget({
    Key? key,
    required this.type,
    required this.aligement,
    required this.sort,
    required this.data,
    required this.configuration,
  }) : super(key: key);

  final List<OrderBookTileData> data;

  final OrderBookStaircaseType type;
  final OrderBookCrossAxisAlignment aligement;
  final OrderBookMainAxisSort sort;
  final OrderBookPresentationConfiguration configuration;

  @override
  State<OrderBookStaircaseWidget> createState() =>
      _OrderBookStaircaseWidgetState();
}

class _OrderBookStaircaseWidgetState extends State<OrderBookStaircaseWidget> {


  late Map<double, OrderBookTileData> visibleData;
  late List<OrderBookTileData> _data;


  @override
  void initState() {
    visibleData = {};
    _configure();

    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(OrderBookStaircaseWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _configure();
  }

  _configure() {
    // TODO: убрать в бэк 
    _data = List.of(widget.data);
    bool asc = (widget.sort == OrderBookMainAxisSort.asc);

    _data.sort(
      (a, b) => ((asc ? a : b).price).compareTo((asc ? b : a).price),
    );
  }

  @override
  Widget build(BuildContext context) {

    final localization = Localization();
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: (widget.aligement == OrderBookCrossAxisAlignment.left)
                  ? [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          localization.orderBookPrice,
                          style: OrderBookStyle.txtHeader,
                        ),
                      ),
                      Text(localization.orderBookAmount, style: OrderBookStyle.txtHeader),
                    ]
                  : [
                      Text(localization.orderBookAmount, style: OrderBookStyle.txtHeader),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(localization.orderBookPrice, style: OrderBookStyle.txtHeader),
                      ),
                    ],
            ),
          ),
          Expanded(
            child: OrderBookTotalIndicatorManager(
              child: OrderBookStaircaseAnimator(
                data: _data,
                config: OrderBookTileConfig(
                  type: widget.type, 
                  aligement: widget.aligement, 
                  configuration: widget.configuration,
                  ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
