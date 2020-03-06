test_name = meson.project_name() + '-test'

test_sources = files([
  'ConversionTests.vala',
  'FreeRecoilTests.vala',
  'LibBalisticaTests.vala',
  'MillerTests.vala',
  'GreenhillTests.vala',
  'TestRunner.vala',
  'AbstractTestCase.vala',
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
