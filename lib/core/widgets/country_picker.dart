import 'package:flutter/material.dart';
import 'package:banking/core/models/country.dart';
import 'package:banking/core/services/country_service.dart';

class CountryPicker extends StatefulWidget {
  final Country? selected;
  final ValueChanged<Country> onSelected;

  const CountryPicker({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  late Future<List<Country>> _countriesFuture;

  @override
  void initState() {
    super.initState();
    _countriesFuture = CountryService.fetchAfricanCountries();
  }

  void _openPicker(List<Country> countries) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CountryPickerSheet(
        countries: countries,
        selected: widget.selected,
        onSelected: widget.onSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Country>>(
      future: _countriesFuture,
      builder: (context, snapshot) {
        /// Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 60,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        /// Error
        if (snapshot.hasError) {
          return const SizedBox(
            height: 60,
            child: Center(
              child: Text(
                "Failed to load countries",
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        /// Empty
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox(
            height: 60,
            child: Center(child: Text("No countries available")),
          );
        }

        final countries = snapshot.data!;
        final selected = widget.selected ?? countries.first;

        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _openPicker(countries),
          child: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F4F7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text(
                  selected.flag,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    selected.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CountryPickerSheet extends StatefulWidget {
  final List<Country> countries;
  final Country? selected;
  final ValueChanged<Country> onSelected;

  const _CountryPickerSheet({
    required this.countries,
    required this.selected,
    required this.onSelected,
  });

  @override
  State<_CountryPickerSheet> createState() =>
      _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<_CountryPickerSheet> {
  final TextEditingController _searchController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        final filtered = widget.countries.where((c) {
          return c.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
        }).toList();

        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// Drag Handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              /// Search Field
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search country...",
                  filled: true,
                  fillColor: const Color(0xFFF2F4F7),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (_) => setState(() {}),
              ),

              const SizedBox(height: 16),

              /// Country List
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: filtered.length,
                  itemBuilder: (_, i) {
                    final country = filtered[i];
                    final isSelected =
                        widget.selected?.code == country.code;

                    return ListTile(
                      leading: Text(
                        country.flag,
                        style: const TextStyle(fontSize: 20),
                      ),
                      title: Text(
                        country.name,
                        style: TextStyle(
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                      trailing: Text(
                        country.dialCode,
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      tileColor: isSelected
                          ? const Color(0xFFF2F4F7)
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onTap: () {
                        widget.onSelected(country);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}