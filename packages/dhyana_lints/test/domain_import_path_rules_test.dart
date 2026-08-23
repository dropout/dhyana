import 'package:dhyana_lints/src/domain_import_path_rules.dart';
import 'package:test/test.dart';

void main() {
  group('moduleRootFor', () {
    test('finds module root for a top-level module', () {
      expect(
        moduleRootFor('/repo/lib/modules/profile/domain/entity/x.dart'),
        '/repo/lib/modules/profile',
      );
    });

    test('finds module root for a nested module', () {
      expect(
        moduleRootFor(
          '/repo/lib/modules/practice/timer/domain/entity/x.dart',
        ),
        '/repo/lib/modules/practice/timer',
      );
    });

    test('returns null for lib/core/domain', () {
      expect(moduleRootFor('/repo/lib/core/domain/entity/x.dart'), isNull);
    });

    test('returns null for non-domain files', () {
      expect(
        moduleRootFor('/repo/lib/modules/profile/data/mapper/x.dart'),
        isNull,
      );
    });
  });

  group('isAllowedDomainImport', () {
    const libRoot = '/repo/lib';
    const moduleRoot = '/repo/lib/modules/profile';

    test('allows external packages and the Dart SDK', () {
      expect(
        isAllowedDomainImport(
          targetPath: '/pub-cache/collection/lib/collection.dart',
          libRoot: libRoot,
          moduleRoot: moduleRoot,
        ),
        isTrue,
      );
    });

    test('allows core imports', () {
      expect(
        isAllowedDomainImport(
          targetPath: '/repo/lib/core/domain/entity/x.dart',
          libRoot: libRoot,
          moduleRoot: moduleRoot,
        ),
        isTrue,
      );
    });

    test('allows same-module domain imports', () {
      expect(
        isAllowedDomainImport(
          targetPath: '/repo/lib/modules/profile/domain/repository/x.dart',
          libRoot: libRoot,
          moduleRoot: moduleRoot,
        ),
        isTrue,
      );
    });

    test('allows another module\'s public API', () {
      expect(
        isAllowedDomainImport(
          targetPath: '/repo/lib/modules/stats/public/api/x.dart',
          libRoot: libRoot,
          moduleRoot: moduleRoot,
        ),
        isTrue,
      );
    });

    test('disallows same-module data imports', () {
      expect(
        isAllowedDomainImport(
          targetPath: '/repo/lib/modules/profile/data/mapper/x.dart',
          libRoot: libRoot,
          moduleRoot: moduleRoot,
        ),
        isFalse,
      );
    });

    test('disallows another module\'s domain imports', () {
      expect(
        isAllowedDomainImport(
          targetPath: '/repo/lib/modules/stats/domain/entity/x.dart',
          libRoot: libRoot,
          moduleRoot: moduleRoot,
        ),
        isFalse,
      );
    });

    test('disallows another module\'s data imports', () {
      expect(
        isAllowedDomainImport(
          targetPath: '/repo/lib/modules/stats/data/mapper/x.dart',
          libRoot: libRoot,
          moduleRoot: moduleRoot,
        ),
        isFalse,
      );
    });
  });
}
