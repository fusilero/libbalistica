vala_args = [ 
  '--target-glib', glib_min_version,
  '--thread',
  '--enable-checking',
]

libbalistica = shared_library ( 'balistica',
  [ 'Atmosphere.vala',
    'Greenhill.vala',
    'Miller.vala',
    'Retard.vala',
    'Solve.vala',
    'Zero.vala',
    'LibBalistica.vala',
    'Pbr.vala',
    'Solution.vala',
    'Windage.vala',
    'conversion/Mass.vala',
    'conversion/Angle.vala',
    'conversion/Temperature.vala'
  ],
  version: meson.project_version(),
  dependencies: [ glib_dep, gee_dep ],
  c_args: [ '-g' ],
  link_args: ['-lm'],
  install: true
)

pkg.generate(
  libraries: libbalistica,
  version: meson.project_version(),
  name: meson.project_name(),
  description: 'Open soure ballistics library written in Vala',
  requires: [
    'glib-2.0',
    'gobject-2.0',
    'gee-0.8',
  ],
)
