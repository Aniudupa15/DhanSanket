import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/transaction_type.dart';
import '../bloc/portfolio_detail_bloc.dart';
import '../bloc/portfolio_detail_event.dart';
import '../bloc/portfolio_detail_state.dart';

/// Uses its own fresh [PortfolioDetailBloc] instance (registered as a
/// get_it factory, a new one per push) purely to dispatch
/// [PortfolioTransactionAddRequested] - it never reads the Loaded state's
/// holdings/performance, only whether the add succeeded or failed. On
/// success it pops with `true` so PortfolioDetailPage knows to refresh.
class AddTransactionPage extends StatefulWidget {
  final String portfolioId;

  const AddTransactionPage({super.key, required this.portfolioId});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final _symbolController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  TransactionType _type = TransactionType.buy;
  DateTime _date = DateTime.now();

  @override
  void dispose() {
    _symbolController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _date = picked);
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<PortfolioDetailBloc>().add(
      PortfolioTransactionAddRequested(
        portfolioId: widget.portfolioId,
        symbol: _symbolController.text.trim().toUpperCase(),
        transactionType: _type,
        quantity: Decimal.parse(_quantityController.text.trim()),
        price: Decimal.parse(_priceController.text.trim()),
        transactionDate: _date,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add transaction')),
      body: BlocConsumer<PortfolioDetailBloc, PortfolioDetailState>(
        listener: (context, state) {
          if (state is PortfolioDetailLoaded) {
            Navigator.of(context).pop(true);
          } else if (state is PortfolioDetailError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.failure.message)));
          }
        },
        builder: (context, state) {
          final isSubmitting = state is PortfolioDetailLoading;
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _symbolController,
                      textCapitalization: TextCapitalization.characters,
                      decoration: const InputDecoration(labelText: 'Symbol (e.g. RELIANCE)'),
                      validator: (value) => (value == null || value.trim().isEmpty) ? 'Enter a symbol' : null,
                    ),
                    const SizedBox(height: 16),
                    SegmentedButton<TransactionType>(
                      segments: const [
                        ButtonSegment(value: TransactionType.buy, label: Text('BUY')),
                        ButtonSegment(value: TransactionType.sell, label: Text('SELL')),
                      ],
                      selected: {_type},
                      onSelectionChanged: (selection) => setState(() => _type = selection.first),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _quantityController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(labelText: 'Quantity'),
                      validator: (value) {
                        final parsed = Decimal.tryParse(value?.trim() ?? '');
                        return (parsed == null || parsed <= Decimal.zero) ? 'Enter a quantity greater than 0' : null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _priceController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(labelText: 'Price per share'),
                      validator: (value) {
                        final parsed = Decimal.tryParse(value?.trim() ?? '');
                        return (parsed == null || parsed <= Decimal.zero) ? 'Enter a price greater than 0' : null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Transaction date'),
                      subtitle: Text(_date.toLocal().toString().split(' ').first),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: _pickDate,
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: isSubmitting ? null : _submit,
                      child: isSubmitting
                          ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
