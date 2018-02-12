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
  dependencies: [ glib_dep, gee_dep ],
  c_args: [ '-g' ],
  link_args: ['-lm'],
  install: true
  )
