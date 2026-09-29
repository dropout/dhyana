import 'package:core/src/presentation/view/util/app_button.dart';
import 'package:core/src/presentation/view/util/app_card.dart';
import 'package:core/src/presentation/view/util/app_map.dart';
import 'package:core/src/presentation/view/util/inset_surface.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:dart_geohash/dart_geohash.dart';

import 'package:core/src/domain/entity/city_search_result.dart';
import 'package:core/src/domain/entity/location.dart';
import 'package:core/src/presentation/design_spec.dart';
import 'package:core/src/presentation/view/util/app_context.dart';
import 'package:core/src/presentation/view/util/debouncer.dart';
import 'package:core/src/presentation/view/util/gap.dart';

import 'decoration.dart';

enum CitySelectorProcessingState {
  idle,
  searching,
  searchCompleted,
  saving,
  error,
}

class FormBuilderCitySelector extends FormBuilderField<Location?> {
  final String? label;

  FormBuilderCitySelector({
    this.label,
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
             label: label ?? field.context.coreL10n.locationInputLabel,
             placeholderText: field.context.coreL10n.locationInputPlaceholder,
             initialLocation: field.value,
             onChanged: (location) => field.didChange(location),
           );
         },
       );

  @override
  FormBuilderCitySelectorState createState() => FormBuilderCitySelectorState();
}

class FormBuilderCitySelectorState
    extends FormBuilderFieldState<FormBuilderCitySelector, Location?> {}

class const CitySelectorInput({
  required final String label,
  final Location? initialLocation,
  final void Function(Location? location)? onChanged,
  final String? placeholderText,
  super.key,
}) extends StatefulWidget {
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
      return widget.placeholderText ?? context.coreL10n.locationInputPlaceholder;
    }
  }

  bool get hasSelectedValue => selectedLocation != null;
  bool get hasInitialValue => widget.initialLocation != null;
  bool get hasLocation => hasSelectedValue || hasInitialValue;
  Location get location =>
      hasSelectedValue ? selectedLocation! : widget.initialLocation!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.charcoal,
          ),
        ),
        Gap.xs(),
        TextField(
          controller: controller,
          decoration: getTextInputDecoration(context),
          style: getTextStyle(context),
          readOnly: true,
          onTap: () => showCitySelectorSheet(context),
        ),
        Gap.medium(),
        buildMapArea(context),
        DesignSpec.bottomActionSpacingWidget,
      ],
    );
  }

  Widget buildMapArea(BuildContext context) {
    if (hasLocation) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
        child: SizedBox(
          height: 256,
          child: AppMap(
            name: location.name,
            latitude: location.latLng.latitude,
            longitude: location.latLng.longitude,
            zoom: 10,
          ),
        ),
      );
    }

    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundPaperLight,
          borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
        ),
        // height: 256,
        padding: const EdgeInsets.all(DesignSpec.paddingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.coreL10n.locationInputRationaleTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.charcoal,
              ),
            ),
            Gap.small(),
            Text(
              context.coreL10n.locationInputRationaleBody,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
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
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: CitySelectorSheet(
            location: widget.initialLocation,
            onCitySelected: (location) {
              setState(() {
                if (location == null) {
                  selectedLocation = null;
                  controller.text =
                      widget.placeholderText ??
                      context.coreL10n.locationInputPlaceholder;
                } else {
                  selectedLocation = location;
                  controller.text = location.name;
                }
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
      return Theme.of(context).textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.grey,
      );
    } else {
      return Theme.of(context).textTheme.titleLarge!
          .copyWith(fontWeight: FontWeight.bold, fontSize: 20);
    }
  }
}

class const CitySelectorSheet({
  required final Location? location,
  required final void Function(Location? location)? onCitySelected,
  super.key,
}) extends StatefulWidget {
  @override
  State<CitySelectorSheet> createState() => _CitySelectorSheetState();
}

class _CitySelectorSheetState extends State<CitySelectorSheet> {
  TextEditingController controller = TextEditingController();

  String searchQuery = '';
  List<CitySearchResult> searchResults = [];

  final Debouncer debouncer = Debouncer(delay: Duration(milliseconds: 300));

  CitySelectorProcessingState loadingState = .idle;

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
        loadingState = .idle;
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
        loadingState = .searching;
      });
      final result = await context.services.functionsService.citySearch(
        queryString: queryString,
      );
      setState(() {
        searchQuery = queryString;
        searchResults = result;
        loadingState = .searchCompleted;
      });
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Error searching for cities. Query string: $queryString',
      );
      setState(() {
        loadingState = .error;
      });
    }
  }

  void selectCity(
    BuildContext context,
    CitySearchResult citySearchResult,
  ) async {
    final crashlyticsService = context.services.crashlyticsService;

    // Get a location with latlng for the selected city
    setState(() {
      loadingState = .saving;
    });

    try {
      final fullResult = await context.services.functionsService
          .getCityLocation(citySearchResult: citySearchResult);

      // Just in case for some reason service cannot return location
      // for the CitySearchResult
      if (fullResult.location == null) {
        setState(() {
          loadingState = .error;
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
        loadingState = .error;
      });
    }
  }

  void clearSelection(BuildContext context) {
    widget.onCitySelected?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingLg),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Text(
            context.coreL10n.locationSearchSheetTitle,
            style: context.theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.charcoal,
            ),
          ),
          Gap.xs(),
          TextField(
            autofocus: true,
            controller: controller,
            decoration: getTextInputDecoration(context).copyWith(
              hintText: context.coreL10n.locationSearchInputPlaceholder,
              hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            style: Theme.of(context).textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
            onChanged: (value) => handleTextFieldChange(context, value),
          ),
          Gap.medium(),
          Expanded(
            child: SafeArea(top: false, child: buildBottomPart(context)),
          ),
        ],
      ),
    );
  }

  Widget buildBottomPart(BuildContext context) {
    return switch (loadingState) {
      .searching => buildSearching(context),
      .saving => buildSaving(context),
      .error => buildError(context),
      .idle => buildIdle(context),
      .searchCompleted => Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Text(
            context.coreL10n.locationSearchResultsTitle,
            style: context.theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.charcoal,
            ),
          ),
          Gap.xs(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: DesignSpec.paddingLg),
              child: InsetSurface(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(DesignSpec.paddingSm),
                    child: Column(
                      mainAxisSize: .min,
                      children: searchResults.map((result) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: DesignSpec.paddingSm,
                          ),
                          child: CitySelectionCard(
                            onTap: (citySearchResult) =>
                                selectCity(context, citySearchResult),
                            citySearchResult: result,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    };
  }

  Widget buildIdle(BuildContext context) {
    if (widget.location == null) {
      return Center(child: Text(context.coreL10n.locationInputNoSelection));
    } else {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.coreL10n.locationInputCurrentSelection,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              widget.location!.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Gap.medium(),
            AppButton.small(
              text: context.coreL10n.locationInputClearSelectionButton.toUpperCase(),
              onTap: () => clearSelection(context),
            ),
          ],
        ),
      );
    }
  }

  Widget buildSearching(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Text(
            context.coreL10n.locationSearchInProgressMessage,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyMedium?.copyWith(
              fontWeight: .bold,
            ),
          ),
          Gap.medium(),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  Widget buildSaving(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Text(
            context.coreL10n.locationSelectionSavingMessage,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyMedium?.copyWith(
              fontWeight: .bold,
            ),
          ),
          Gap.medium(),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget buildError(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(Icons.warning_amber_rounded, size: 64),
          Gap.medium(),
          Text(
            context.coreL10n.locationInputErrorMessage,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyMedium?.copyWith(
              fontWeight: .bold,
            ),
          ),
        ]
      ),

    );

  }

  @override
  void dispose() {
    controller.dispose();
    debouncer.dispose();
    super.dispose();
  }
}

class const CitySelectionCard({
  required final CitySearchResult citySearchResult,
  final void Function(CitySearchResult)? onTap,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(citySearchResult),
      child: AppCard(
        padding: const EdgeInsets.all(DesignSpec.paddingMd),
        child: Row(
          mainAxisSize: .max,
          children: [
            Expanded(
              child: Text(
                citySearchResult.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
