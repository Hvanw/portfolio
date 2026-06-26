import 'package:flutter/material.dart';
import 'package:portfolio/data/technical_stack.dart';

class TechnicalStackWidget extends StatelessWidget {
  const TechnicalStackWidget(this.data, {super.key});

  final TechnicalStack data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Text(
        data.name,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class ListTechnicalStacksWidget extends StatelessWidget {
  const ListTechnicalStacksWidget(this.data, {super.key});

  final List<TechnicalStack> data;

  @override
  Widget build(BuildContext context) {
    return (data.isEmpty)
        ? const SizedBox()
        : Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (int i = 0; i < data.length; i++) ...[
                if (i > 0) const SizedBox(width: 4),
                TechnicalStackWidget(data[i]),
              ],
            ],
          );
  }
}
