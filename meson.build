project ('libbalistica', ['vala', 'c'],
          version: '1.0',
          license: 'GPLv3+',
          default_options: [
            'warning_level=1',
            'buildtype=debugoptimized',
            ],
          meson_version: '>= 0.37.1'
          )

vala_version_required = '0.36.12'
vala = meson.get_compiler('vala')
if not vala.version().version_compare('>= @0@'.format(vala_version_required))
	error('valac >= @0@ required!'.format(vala_version_required))
endif

# Imports
pkg = import('pkgconfig')

# Dependencies
glib_min_version = '2.40.0'
glib_dep = dependency ('glib-2.0', version: '>=' + glib_min_version)
gobject_dep = dependency ('gobject-2.0', version: '>=' + glib_min_version)
gee_dep = dependency ('gee-0.8', version: '>=0.20.0')

subdir ('lib')
subdir ('test')
