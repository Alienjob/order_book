import 'package:flutter/material.dart';
import '../domain/model.dart';
import '../service/localization.dart';
import '../service/staircase_data_store.dart';
import '../service/style.dart';
import 'order_book_staircase_animator.dart';

import 'package:visiblity_data_manager/visiblity_data_manager.dart';

class OrderBookStaircaseWidget extends StatefulWidget {
  const OrderBookStaircaseWidget({
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

  late final StaircaseDataStore store;

  @override
  void initState() {
    store = StaircaseDataStore();
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
    _data = List.of(widget.data);
    bool asc = (widget.sort == OrderBookMainAxisSort.asc);
    _data.sort(
      (a, b) => ((asc ? a : b).price).compareTo((asc ? b : a).price),
    );
  }

  void onChange<TValue, TCommon>(
      {VisiblityCalculableDataStore<TValue, TCommon>? dataStore,
      required VisiblityStore visiblyStore}) {
    if (dataStore is StaircaseDataStore) {
      final StaircaseData? staircaseData = (dataStore as StaircaseDataStore)
          .calculate(visiblyStore.getVisibleKeys());
      if (staircaseData != null) store.update(staircaseData);
      Future.delayed(Duration.zero, () async {
        if(mounted) setState(() {});
      });
    }
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
                      Text(localization.orderBookAmount,
                          style: OrderBookStyle.txtHeader),
                    ]
                  : [
                      Text(localization.orderBookAmount,
                          style: OrderBookStyle.txtHeader),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(localization.orderBookPrice,
                            style: OrderBookStyle.txtHeader),
                      ),
                    ],
            ),
          ),
          Expanded(
            child: 
            VisiblityManagerCalculableData.calculable(
              store: store,
              onChange: onChange,
              child: OrderBookStaircaseAnimator(
                data: _data,
                config: OrderBookTileConfig(
                  type: widget.type,
                  aligement: widget.aligement,
                  configuration: widget.configuration,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
