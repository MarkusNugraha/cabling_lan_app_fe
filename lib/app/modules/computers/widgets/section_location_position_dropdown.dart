import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import your models and controllers
import '../../../../app/modules/sections/controllers/sections_controller.dart';
import '../../../../app/modules/locations/controllers/locations_controller.dart';
import '../../../../app/modules/positions/controllers/positions_controller.dart';
import '../../../../app/modules/computers/widgets/custom_dropdow.dart';

class SectionLocationPositionDropdown extends StatelessWidget {
  final SectionsController sectionsController;
  final LocationsController locationsController;
  final PositionsController positionsController;

  final RxnInt selectedSectionId;
  final RxnInt selectedLocationId;
  final RxnInt selectedPositionId;

  final bool isEnabled;
  final bool isMandatory;

  const SectionLocationPositionDropdown({
    super.key,
    required this.sectionsController,
    required this.locationsController,
    required this.positionsController,
    required this.selectedSectionId,
    required this.selectedLocationId,
    required this.selectedPositionId,
    this.isEnabled = true,
    this.isMandatory = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: isMandatory ? 0 : 5),
          child: Row(
            children: [
              isMandatory
                  ? const Text('*', style: TextStyle(color: Colors.red))
                  : const Text(''),
              const SizedBox(width: 2),
              Text("Position", style: const TextStyle(fontSize: 15)),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            children: [
              // SECTION
              Obx(() {
                final sections = sectionsController.sections;

                final selectedId =
                    sections.any(
                      (section) => section.id == selectedSectionId.value,
                    )
                    ? selectedSectionId.value
                    : null;

                return CustomDropdown(
                  label: 'Section',
                  selectedId: selectedId,
                  dropdownKey: 'section-$selectedId-${sections.length}',
                  items: sections.map((section) {
                    return DropdownMenuItem<int>(
                      value: section.id,
                      child: Text(section.name),
                    );
                  }).toList(),
                  onChanged: isEnabled
                      ? (value) {
                          selectedSectionId.value = value;

                          selectedLocationId.value = null;
                          selectedPositionId.value = null;

                          locationsController.clearLocations();
                          positionsController.clearPositions();

                          if (value != null) {
                            locationsController.getAllLocations(
                              sectionId: value,
                            );
                          }
                        }
                      : null,
                );
              }),

              const SizedBox(height: 15),

              // LOCATION
              Obx(() {
                final locations = locationsController.locations;

                final selectedId =
                    locations.any(
                      (location) => location.id == selectedLocationId.value,
                    )
                    ? selectedLocationId.value
                    : null;

                return CustomDropdown(
                  label: 'Location',
                  selectedId: selectedId,
                  dropdownKey:
                      'location-${selectedSectionId.value}-$selectedId-${locations.length}',
                  items: locations.map((location) {
                    return DropdownMenuItem<int>(
                      value: location.id,
                      child: Text(location.name),
                    );
                  }).toList(),
                  onChanged: !isEnabled || selectedSectionId.value == null
                      ? null
                      : (value) {
                          selectedLocationId.value = value;
                          selectedPositionId.value = null;

                          positionsController.clearPositions();

                          if (value != null) {
                            positionsController.getAllPositions(
                              locationId: value,
                            );
                          }
                        },
                );
              }),

              const SizedBox(height: 15),

              // POSITION
              Obx(() {
                final positions = positionsController.positions;

                final selectedId =
                    positions.any(
                      (position) => position.id == selectedPositionId.value,
                    )
                    ? selectedPositionId.value
                    : null;

                return CustomDropdown(
                  label: 'Position',
                  selectedId: selectedId,
                  dropdownKey:
                      'position-${selectedLocationId.value}-$selectedId-${positions.length}',
                  items: positions.map((position) {
                    return DropdownMenuItem<int>(
                      value: position.id,
                      child: Text(position.name),
                    );
                  }).toList(),
                  onChanged: !isEnabled || selectedLocationId.value == null
                      ? null
                      : (value) {
                          selectedPositionId.value = value;
                        },
                );
              }),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
