import 'package:flutter/material.dart';
import 'package:declarative_animated_list/declarative_animated_list.dart';
import '../domain/model.dart';
import '../service/style.dart';
import 'order_book_staircase_tile.dart';

class OrderBookStaircaseAnimator extends StatelessWidget {
  const OrderBookStaircaseAnimator({
    super.key,
    required this.data,
    required this.config,
  });

  final List<OrderBookTileData> data;
  final OrderBookTileConfig config;

  @override
  Widget build(BuildContext context) {
    final bool reverse = ((config.type == OrderBookStaircaseType.ask) &&
        (config.configuration == OrderBookPresentationConfiguration.vertical));
    return DeclarativeList<OrderBookTileData>(
      reverse: reverse,
      equalityCheck: (p0, p1) => p0.price == p1.price,
      insertDuration: OrderBookStyle.insertAnimationDuration,
      removeDuration: OrderBookStyle.removeAnimationDuration,
      items: data,
      itemBuilder: (context, model, index, animation) =>
          _buildAnimatedTile(animation, model),
      removeBuilder: (context, model, index, animation) =>
          _buildAnimatedTile(animation, model),
    );
  }

  Widget _buildAnimatedTile(
    Animation<double> animation,
    OrderBookTileData data,
  ) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        child: OrderBookStaircaseTile(
          data: data,
          aligement: config.aligement,
          type: config.type,
        ),
      ),
    );
  }
}
