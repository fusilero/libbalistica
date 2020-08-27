test_name = meson.project_name() + '-test'

test_sources = files([
  'AbstractTestCase.vala',
  'ConversionTests.vala',
  'FreeRecoilTests.vala',
  'GreenhillTests.vala',
  'LibBalisticaTests.vala',
  'MillerTests.vala',
  'SectionalDensityTests.vala',
  'TestRunner.vala',
])

tests = executable(
    test_name,
    sources: test_sources,
    dependencies: [ glib_dep, gee_dep, lib_dep ],
    c_args: [ '-g' ],
    link_args: ['-lm'],
    install: false
)

test('tests', tests)
