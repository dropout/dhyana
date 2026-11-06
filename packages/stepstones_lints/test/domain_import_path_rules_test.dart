import 'package:stepstones_lints/src/domain_import_path_rules.dart';
import 'package:test/test.dart';

void main() {
  const timerRoot = '/repo/packages/modules/practice/timer';
  const profileRoot = '/repo/packages/modules/profile';

  group('domainModuleRootFor', () {
    test('finds the root of a top-level module', () {
      expect(
        domainModuleRootFor('$profileRoot/lib/src/domain/entity/x.dart'),
        profileRoot,
      );
    });

    test('finds the root of a nested module', () {
      expect(
        domainModuleRootFor('$timerRoot/lib/src/domain/usecase/x.dart'),
        timerRoot,
      );
    });

    test('skips ports', () {
      expect(
        domainModuleRootFor('$timerRoot/lib/src/domain/port/x.dart'),
        isNull,
      );
      expect(
        domainModuleRootFor('$timerRoot/lib/src/domain/service/app_port.dart'),
        isNull,
      );
    });

    test('skips non-domain files', () {
      expect(
        domainModuleRootFor('$profileRoot/lib/src/data/mapper/x.dart'),
        isNull,
      );
    });

    test('skips packages outside packages/modules', () {
      expect(
        domainModuleRootFor('/repo/packages/core/lib/src/domain/entity/x.dart'),
        isNull,
      );
    });
  });

  group('domainImportViolation', () {
    DomainImportViolation? check(String importUri, {String? targetPath}) =>
        domainImportViolation(
          importUri: importUri,
          targetPath: targetPath,
          moduleRoot: profileRoot,
        );

    test('allows dart:, pure packages and core', () {
      expect(check('dart:async'), isNull);
      expect(
        check(
          'package:collection/collection.dart',
          targetPath: '/pub-cache/collection/lib/collection.dart',
        ),
        isNull,
      );
      expect(
        check(
          'package:core/core.dart',
          targetPath: '/repo/packages/core/lib/core.dart',
        ),
        isNull,
      );
      expect(check('package:flutter/foundation.dart'), isNull);
    });

    test('allows the module\'s own domain', () {
      expect(
        check(
          'package:profile/src/domain/entity/x.dart',
          targetPath: '$profileRoot/lib/src/domain/entity/x.dart',
        ),
        isNull,
      );
    });

    test('flags platform and framework packages', () {
      for (final uri in [
        'package:cloud_firestore/cloud_firestore.dart',
        'package:firebase_auth/firebase_auth.dart',
        'package:flutter_bloc/flutter_bloc.dart',
        'package:drift/drift.dart',
        'package:go_router/go_router.dart',
        'package:get_it/get_it.dart',
        'package:material_ui/material_ui.dart',
      ]) {
        expect(check(uri), DomainImportViolation.platformPackage, reason: uri);
      }
    });

    test('flags Flutter UI libraries', () {
      expect(
        check('package:flutter/widgets.dart'),
        DomainImportViolation.flutterUi,
      );
    });

    test('flags the module\'s own outer layers', () {
      expect(
        check('package:profile/src/data/mapper/x.dart'),
        DomainImportViolation.ownOuterLayer,
      );
      expect(
        check('package:profile/src/public/model/x.dart'),
        DomainImportViolation.ownOuterLayer,
      );
    });

    test('flags relative imports into the module\'s outer layers', () {
      expect(
        check(
          '../../presentation/x.dart',
          targetPath: '$profileRoot/lib/src/presentation/x.dart',
        ),
        DomainImportViolation.ownOuterLayer,
      );
    });

    test('flags other feature modules', () {
      expect(
        check(
          'package:stats/stats.dart',
          targetPath: '/repo/packages/modules/stats/lib/stats.dart',
        ),
        DomainImportViolation.otherModule,
      );
    });

    test('does not treat a module with a shared name prefix as its own', () {
      expect(
        domainImportViolation(
          importUri: 'package:timer_extras/timer_extras.dart',
          targetPath: '${timerRoot}_extras/lib/timer_extras.dart',
          moduleRoot: timerRoot,
        ),
        DomainImportViolation.otherModule,
      );
    });
  });
}
