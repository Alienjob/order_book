import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_book/src/bloc/order_book_bloc.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/service/style.dart';


class BothVisibleButton extends StatelessWidget {
  const BothVisibleButton({
    super.key,
    required this.configuration,
  });

  final OrderBookPresentationConfiguration configuration;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns:
          (configuration == OrderBookPresentationConfiguration.horizontal)
              ? 0
              : 1,
      child: BlocBuilder<OrderBookBloc, OrderBookState>(
        builder: (context, state) {
          final bool isActive =
              state.control?.section == OrderBookPresentationSection.both;
          return InkWell(
            onTap: () {
              final bloc = BlocProvider.of<OrderBookBloc>(context);
              bloc.add(const OrderBookEvent.presentationSectionChanged(
                  presentationSection: OrderBookPresentationSection.both));
            },
            child: SizedBox(
                child: Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: isActive
                        ? OrderBookStyle.bidColor
                        : OrderBookStyle.bidInactive,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const SizedBox(
                    width: 7,
                    height: 16,
                  ),
                ),
                const SizedBox(width: 2),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: isActive
                        ? OrderBookStyle.askColor
                        : OrderBookStyle.askInactive,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const SizedBox(
                    width: 7,
                    height: 16,
                  ),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}

class BidVisibleButton extends StatelessWidget {
  const BidVisibleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBookBloc, OrderBookState>(
      builder: (context, state) {
        final bool isActive =
            state.control?.section == OrderBookPresentationSection.bid;
        return InkWell(
            onTap: () {
              final bloc = BlocProvider.of<OrderBookBloc>(context);
              bloc.add(const OrderBookEvent.presentationSectionChanged(
                  presentationSection: OrderBookPresentationSection.bid));
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isActive
                    ? OrderBookStyle.bidColor
                    : OrderBookStyle.bidInactive,
                borderRadius: BorderRadius.circular(2),
              ),
              child: const SizedBox(
                width: 16,
                height: 16,
              ),
            ));
      },
    );
  }
}

class AskVisibleButton extends StatelessWidget {
  const AskVisibleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBookBloc, OrderBookState>(
      builder: (context, state) {
        final bool isActive =
            state.control?.section == OrderBookPresentationSection.ask;

        return InkWell(
            onTap: () {
              final bloc = BlocProvider.of<OrderBookBloc>(context);
              bloc.add(const OrderBookEvent.presentationSectionChanged(
                  presentationSection: OrderBookPresentationSection.ask));
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isActive
                    ? OrderBookStyle.askColor
                    : OrderBookStyle.askInactive,
                borderRadius: BorderRadius.circular(2),
              ),
              child: const SizedBox(
                width: 16,
                height: 16,
              ),
            ));
      },
    );
  }
}
