import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';
import 'package:banking/core/widgets/primary_button.dart';
import 'package:banking/features/transfer/presentation/pages/transfer_success_local_page.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _accountController = TextEditingController();
  final _amountController = TextEditingController();
  final _reasonController = TextEditingController();

  String _transferType = "Bank";
  String? _selectedInstitution;

  final List<String> _banks = [
    "CRDB Bank",
    "NMB Bank",
    "NBC Bank",
    "Stanbic Bank",
    "Exim Bank",
  ];

  final List<String> _mobiles = [
    "M-Pesa (Vodacom)",
    "Airtel Money",
    "Tigo Pesa",
    "Halotel Mixx",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: const Text("Transfer Money"),
        backgroundColor: AppTheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildRecipientName(),
              const SizedBox(height: 16),
              _buildTransferTypeToggle(),
              const SizedBox(height: 16),
              _buildInstitutionDropdown(),
              const SizedBox(height: 16),
              _buildAccountField(),
              const SizedBox(height: 16),
              _buildAmountField(),
              const SizedBox(height: 16),
              _buildReasonField(),
              const SizedBox(height: 30),
              PrimaryButton(
                label: "Review Transfer",
                onPressed: _reviewTransfer,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecipientName() {
    return TextFormField(
      controller: _nameController,
      validator: (v) => v!.isEmpty ? "Enter recipient name" : null,
      decoration: _inputDecoration("Recipient Full Name"),
    );
  }

  Widget _buildTransferTypeToggle() {
    return Row(
      children: [
        Expanded(
          child: ChoiceChip(
            label: const Text("Bank"),
            selected: _transferType == "Bank",
            onSelected: (_) {
              setState(() {
                _transferType = "Bank";
                _selectedInstitution = null;
              });
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ChoiceChip(
            label: const Text("Mobile Money"),
            selected: _transferType == "Mobile",
            onSelected: (_) {
              setState(() {
                _transferType = "Mobile";
                _selectedInstitution = null;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInstitutionDropdown() {
    final list = _transferType == "Bank" ? _banks : _mobiles;

    return DropdownButtonFormField<String>(
      value: _selectedInstitution,
      decoration: _inputDecoration(
          _transferType == "Bank" ? "Select Bank" : "Select Provider"),
      items: list
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      validator: (v) => v == null ? "Please select option" : null,
      onChanged: (v) => setState(() => _selectedInstitution = v),
    );
  }

  Widget _buildAccountField() {
    return TextFormField(
      controller: _accountController,
      keyboardType: TextInputType.number,
      validator: (v) => v!.isEmpty
          ? _transferType == "Bank"
          ? "Enter account number"
          : "Enter mobile number"
          : null,
      decoration: _inputDecoration(_transferType == "Bank"
          ? "Account Number"
          : "Mobile Number"),
    );
  }

  Widget _buildAmountField() {
    return TextFormField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      validator: (v) => v!.isEmpty ? "Enter amount" : null,
      decoration: _inputDecoration("Amount (TZS)"),
    );
  }

  Widget _buildReasonField() {
    return TextFormField(
      controller: _reasonController,
      decoration: _inputDecoration("Reason (Optional)"),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }

  void _reviewTransfer() {
    if (!_formKey.currentState!.validate()) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _buildReviewSheet(),
    );
  }

  Widget _buildReviewSheet() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        children: [
          const Text("Confirm Transfer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _reviewRow("Recipient", _nameController.text),
          _reviewRow("Institution", _selectedInstitution ?? ""),
          _reviewRow("Amount", "TZS ${_amountController.text}"),
          _reviewRow("Reason", _reasonController.text.isEmpty
              ? "-"
              : _reasonController.text),
          const SizedBox(height: 24),
          PrimaryButton(
            label: "Confirm & Send",
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TransferSuccessLocalPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _reviewRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}