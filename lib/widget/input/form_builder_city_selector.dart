import 'package:dart_geohash/dart_geohash.dart';
import 'package:dhyana/enum/loading_state.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/location.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/input/all.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderCitySelector extends FormBuilderField<Location> {

  final String label;

  FormBuilderCitySelector({
    this.label = 'City',
    // From Super
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    super.enabled,
    super.initialValue,
    super.focusNode,
    super.onSaved,
    super.validator,
    required super.name,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.key,
  }) : super(
    builder: (FormFieldState<Location?> field) {
      return CitySelectorInput(
        label: label,
        placeholderText: field.context.localizations.locationInputPlaceholder,
        initialLocation: field.value,
        onChanged: (location) => field.didChange(location),
      );
    },
  );

  @override
  FormBuilderCitySelectorState createState() => FormBuilderCitySelectorState();
}

class FormBuilderCitySelectorState
  extends FormBuilderFieldState<FormBuilderCitySelector, Location> {}

class CitySelectorInput extends StatefulWidget {

  final String label;
  final Location? initialLocation;
  final void Function(Location location)? onChanged;
  final String placeholderText;

  const CitySelectorInput({
    required this.label,
    required this.initialLocation,
    this.onChanged,
    this.placeholderText = 'Select a city',
    super.key,
  });

  @override
  State<CitySelectorInput> createState() => _CitySelectorInputState();
}

class _CitySelectorInputState extends State<CitySelectorInput> {

  late final TextEditingController controller;
  Location? selectedLocation;

  @override
  void initState() {
    controller = TextEditingController();
    controller.text = locationName;

    super.initState();
  }

  String get locationName {
    if (hasSelectedValue) {
      return selectedLocation!.name;
    } else if (hasInitialValue && hasSelectedValue == false) {
      return widget.initialLocation!.name;
    } else {
      return widget.placeholderText;
    }
  }

  bool get hasSelectedValue => selectedLocation != null;
  bool get hasInitialValue => widget.initialLocation != null;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Gap.xs(),
          Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              TextField(
                controller: controller,
                decoration: getTextInputDecoration(context),
                style: getTextStyle(context),
                readOnly: true,
                onTap: () => showCitySelectorSheet(context),
              ),
            ],
          )
        ],
      );
  }

  void showCitySelectorSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      backgroundColor: AppColors.backgroundPaper,
      showDragHandle: true,

      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: CitySelectorSheet(
            location: widget.initialLocation,
            onCitySelected: (location) {
              setState(() {
                selectedLocation = location;
                controller.text = location.name;
              });
              widget.onChanged?.call(location);
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  // Determine text style based on whether value is empty
  // to show placeholder style.
  TextStyle getTextStyle(BuildContext context) {
    if (widget.initialLocation == null) {
      return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      );
    } else {
      return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
      );
    }
  }
}

class CitySelectorSheet extends StatefulWidget {

  final Location? location;
  final void Function(Location location)? onCitySelected;

  const CitySelectorSheet({
    required this.location,
    this.onCitySelected,
    super.key,
  });

  @override
  State<CitySelectorSheet> createState() => _CitySelectorSheetState();
}

class _CitySelectorSheetState extends State<CitySelectorSheet> {

  TextEditingController controller = TextEditingController();
  String searchQuery = '';
  List<CitySearchResult> searchResults = [];

  final Debouncer debouncer = Debouncer(delay: Duration(milliseconds: 300));

  LoadingState loadingState = LoadingState.idle;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  void handleTextFieldChange(BuildContext context, String value) {
    value = value.trim();

    // Don't run a query for an empty string
    if (value.isEmpty) {
      setState(() {
        searchResults = [];
        loadingState = LoadingState.idle;
      });
      return;
    }

    // Don't search for very short strings
    if (value.length < 3) {
      return;
    }

    debouncer(() => searchCities(context, value));
  }

  void searchCities(BuildContext context, String queryString) async {

    // Extract crashlytics service for safe use of context in async calls
    final crashlyticsService = context.services.crashlyticsService;

    try {
      setState(() {
        loadingState = LoadingState.loading;
      });
      final result = await context.services.functionsService
        .citySearch(queryString: queryString);
      setState(() {
        searchQuery = queryString;
        searchResults = result;
        loadingState = LoadingState.loaded;
      });
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Error searching for cities. Query string: $queryString',
      );
      setState(() {
        loadingState = LoadingState.error;
      });
    }
  }

  void selectCity(BuildContext context, CitySearchResult citySearchResult) async {
    final crashlyticsService = context.services.crashlyticsService;

    // Get a location with latlng for the selected city
    setState(() {
      loadingState = LoadingState.loading;
    });

    try {
      final fullResult = await context.services.functionsService
        .getCityLocation(citySearchResult: citySearchResult);

      // Just in case for some reason service cannot return location
      // for the CitySearchResult
      if (fullResult.location == null) {
          setState(() {
            loadingState = LoadingState.error;
          });
          crashlyticsService.recordError(
            exception: Exception('Location data is null'),
            stackTrace: StackTrace.current,
            reason: 'Error getting location for city: ${citySearchResult.name}',
          );
          return;
      }
      final location = Location(
        name: fullResult.name,
        latLng: fullResult.location!,
        geoHash: GeoHasher().encode(
          fullResult.location!.longitude,
          fullResult.location!.latitude,
          precision: 8, // ~19m precision
        ),
      );
      widget.onCitySelected?.call(location);
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Error getting location for city: ${citySearchResult.name}',
      );
      setState(() {
        loadingState = LoadingState.error;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingLg),
      child: Column(
        children: [
          // Gap.large(),
          TextField(
            controller: controller,
            decoration: getTextInputDecoration(context).copyWith(
              hintText: 'Type in the city name',
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            onChanged: (value) => handleTextFieldChange(context, value),
            // onChanged: (value) => debouncer(() => searchCities(context, value)),
          ),
          Expanded(
            child: buildBottomPart(context),
          )

        ]
      ),
    );
  }

  Widget buildBottomPart(BuildContext context) {
    switch (loadingState) {
      case LoadingState.loading:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingState.error:
        return buildError(context);
      case LoadingState.idle:
        return buildIdle(context);
      case LoadingState.loaded:
        return SingleChildScrollView(
          child: Column(
            children: searchResults.map((result) {
                return ListTile(
                  title: Text(result.name),
                  subtitle: Text(result.placeId),
                  onTap: () => selectCity(context, result),
                );
              }).toList(),
            ),
          );
    }
  }



  Widget buildIdle(BuildContext context) {
    if (widget.location == null) {
      return Center(
        child: Text(context.localizations.locationInputNoSelection),
      );
    } else {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localizations.locationInputCurrentSelection,
              textAlign: TextAlign.center,
            ),
            Text(
              widget.location!.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget buildLoaded(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DesignSpec.paddingLg),
      child: Column(
        children: [
          Gap.large(),
          TextField(
            controller: controller,
            decoration: getTextInputDecoration(context),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            onChanged: (value) => debouncer(() => searchCities(context, value)),
          ),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: searchResults.map((result) {
                  return ListTile(
                    tileColor: AppColors.red,
                    title: Text(result.name),
                    subtitle: Text(result.placeId),
                    onTap: () => selectCity(context, result),

                  );
                }).toList(),
              ),
            )
          )
        ],
      ),
    );
  }

  Widget buildError(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_amber_rounded,
          size: 64,
        ),
        Gap.medium(),
        Text(
          context.localizations.locationInputErrorMessage,
          textAlign: TextAlign.center,
        ),
      ]
    );
  }

  @override
  void dispose() {
    controller.dispose();
    debouncer.dispose();
    super.dispose();
  }
}
