import 'dart:convert';

import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/core/domain/model/fake/fake_model_factory.dart';
import 'package:dhyana/modules/account/domain/model/profile.dart';
import 'package:dhyana/core/presentation/input/form_builder_profile_image_picker.dart';
import 'package:dhyana/modules/account/presentation/widget/profile_edit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nock/nock.dart';
import 'package:provider/provider.dart';

import '../../mock_definitions.dart';
import '../../test_context_providers.dart';

void main() {
  group('ProfileEditForm', () {

    late Profile profile;
    late MockServices mockServices;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockCacheManagerService mockCacheManagerService;
    late MockResourceResolver mockResourceResolver;
    late MockSafeImageDetectorFactory mockSafeImageDetectorFactory;
    late MockSafeImageDetector safeImageDetector;

    setUpAll(() async {
      nock.init();
    });

    setUp(() {
      profile = FakeModelFactory().createProfile();

      mockServices = MockServices();

      mockCrashlyticsService = MockCrashlyticsService();
      mockCacheManagerService = MockCacheManagerService();
      mockResourceResolver = MockResourceResolver();
      mockSafeImageDetectorFactory = MockSafeImageDetectorFactory();
      safeImageDetector = MockSafeImageDetector();

      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);
      when(() => mockServices.safeImageDetectorFactory)
        .thenReturn(mockSafeImageDetectorFactory);
      when(() => mockSafeImageDetectorFactory.create())
        .thenAnswer((_) async => safeImageDetector);
      when(() => mockServices.resourceResolver)
        .thenReturn(mockResourceResolver);
      when(() => mockResourceResolver.resolveStoragePath(any()))
        .thenAnswer((_) async => profile.photoUrl!);

      when(() => mockServices.cacheManagerService)
        .thenReturn(mockCacheManagerService);
      when(() => mockCacheManagerService.cacheManager)
        .thenReturn(MockCacheManager());

      nock.cleanAll();
    });

    testWidgets('renders all form fields with default values', (WidgetTester tester) async {
      final profileWithoutPhoto = profile.copyWith(
        photoUrl: null,
        photoBlurhash: null,
      );

      // https://firebasestorage.googleapis.com/v0/b/dhyana-timer.appspot.com/o/profiles%2Fdefault%2Fphoto.jpg?alt=media&token=0d5bb454-7ce3-4f27-9ccf-7822fd559bb4

      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>(create: (context) => mockServices ),
            ],
          child: Material(
            child: ProfileEditForm(profile: profileWithoutPhoto)
          ),
          )
        )
      );
      await tester.pumpAndSettle();

      final formBuilderImagePicker = tester.widget<FormBuilderProfileImagePicker>(find.byKey(const Key('profile_edit_form_image_picker')));

      expect(formBuilderImagePicker.profile, profileWithoutPhoto);

      expect(find.text(profileWithoutPhoto.firstName), findsOneWidget);
      expect(find.text(profileWithoutPhoto.lastName), findsOneWidget);
      expect(find.byType(FormBuilderTextField), findsNWidgets(2));
    });


    testWidgets('can react to firstName and lastName input changes', (WidgetTester tester) async {

      // Configure global http client mock
      // to return a 1x1 pixel image for the default profile image URL
      nock('https://firebasestorage.googleapis.com')
        .get('/v0/b/dhyana-timer.appspot.com/o/profiles%2Fdefault%2Fphoto.jpg')
        ..query({'alt': 'media', 'token': '0d5bb454-7ce3-4f27-9ccf-7822fd559bb4'})
        ..reply(
          200,
          base64Decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAABGdBTUEAALGPC/xhBQAAADhlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAqACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAADa6r/EAAAAC0lEQVQIHWNgAAIAAAUAAY27m/MAAAAASUVORK5CYII='),
          headers: {
            'Content-Type': 'image/jpeg',
            'Cache-Control': 'no-cache',
          }
        );


      bool onFormChanged = false;
      GlobalKey<FormBuilderState> formKey =
        GlobalKey<FormBuilderState>();

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>(create: (context) => mockServices),
              ],
              child: MaterialApp(
                localizationsDelegates: getLocalizationDelegates(),
                home: Material(
                  child: ProfileEditForm(
                    profile: profile,
                    formStateKey: formKey,
                    onChanged: () {
                      onFormChanged = true;
                    },
                  ),
                )
              ),
            )
          )
        );
        await tester.pumpAndSettle();
      }).then((_) async {

        final formBuilderImagePicker = tester.widget<FormBuilderProfileImagePicker>(find.byKey(const Key('profile_edit_form_image_picker')));
        expect(formBuilderImagePicker.profile, profile);

        final firstNameFieldFinder = find.descendant(
          of: find.byKey(const Key('profile_edit_form_first_name_input')),
          matching: find.byType(TextField)
        );
        expect(firstNameFieldFinder, findsOneWidget);
        await tester.enterText(firstNameFieldFinder, 'TestFirstName');
        await tester.pumpAndSettle();

        final lastNameFinder = find.descendant(
          of: find.byKey(const Key('profile_edit_form_last_name_input')),
          matching: find.byType(TextField)
        );
        expect(lastNameFinder, findsOneWidget);
        await tester.enterText(lastNameFinder, 'TestLastName');

        FormBuilderState formBuildState = formKey.currentState!;
        formBuildState.save();
        await tester.pumpAndSettle();


        expect(onFormChanged, isTrue);
        expect(find.text('TestFirstName'), findsOneWidget);
        expect(find.text('TestLastName'), findsOneWidget);
        expect(formBuildState.value['firstName'], 'TestFirstName');
        expect(formBuildState.value['lastName'], 'TestLastName');
      });

    });


  }); // end of group ProfileEditForm
} // end of main
