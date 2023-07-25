import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/common/utils.dart';
import '/widgets/primary_button.dart';
import 'home_page_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final provider = context.watch<HomePageProvider>();
    final messageController = TextEditingController();
    final numberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pysura Demo'),
        elevation: 4,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              provider.getToken(context);
            },
            icon: const Icon(Icons.token),
          ),
          IconButton(
            onPressed: () {
              provider.openSettings(context);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Subscription
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subscription',
                    style: textTheme.titleMedium,
                  ),
                  if (provider.loadingSubscription)
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                ],
              ),
              const Divider(height: 16),
              Text(
                'Message',
                style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.7)),
              ),
              const SizedBox(height: 8),
              LabelField(label: provider.message),
              const SizedBox(height: 16),
              Text(
                'Number',
                style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.7)),
              ),
              const SizedBox(height: 8),
              LabelField(label: provider.number.toString()),
              const SizedBox(height: 16),

              /// Action Query Ping
              Text(
                'Query Action',
                style: textTheme.titleMedium,
              ),
              const Divider(height: 16),
              PrimaryButton(
                title: 'Run Query Action Ping',
                textStyle: textTheme.bodyMedium!,
                onPressed: () {
                  provider.runActionPing().then((result) {
                    final message = result.item1;
                    final number = result.item2;
                    if (message == null || number == null) {
                      showSnackBar(context, 'Failed to run action ping');
                      return;
                    }
                    showSnackBar(context,
                        'Action ping run ok.\nMessage: $message\nNumber: $number');
                  });
                },
                isBusy: provider.runningQueryAction,
              ),
              const SizedBox(height: 16),

              /// Action Mutation Pong
              Text(
                'Mutation Action',
                style: textTheme.titleMedium,
              ),
              const Divider(height: 16),
              const SizedBox(height: 8),
              InputField(
                  controller: messageController,
                  label: 'Message',
                  hint: 'Enter message'),
              const SizedBox(height: 16),
              InputField(
                  controller: numberController,
                  label: 'Number',
                  hint: 'Enter number'),
              const SizedBox(height: 16),

              PrimaryButton(
                title: 'Run Mutation Action Pong',
                textStyle: textTheme.bodyMedium!,
                onPressed: () {
                  final message = messageController.text;
                  final number = int.tryParse(numberController.text);
                  if (number == null) {
                    showSnackBar(context, 'Please enter a valid number');
                    return;
                  }
                  provider
                      .runActionPong(message: message, number: number)
                      .then((result) {
                    if (result) {
                      showSnackBar(context, 'Action pong run ok');
                    } else {
                      showSnackBar(context, 'Action pong failed');
                    }
                  });
                },
                isBusy: provider.runningMutationAction,
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class LabelField extends StatelessWidget {
  const LabelField({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.onBackground.withOpacity(0.5),
        ),
      ),
      child: Text(
        label,
        style: textTheme.bodyMedium,
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });

  final String label;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      style: textTheme.bodyMedium,
      maxLines: null,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        labelStyle: textTheme.labelMedium,
        hintStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.onBackground.withOpacity(0.7),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.onBackground.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
