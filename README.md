# libbalistica

## Build & Install
```bash
mkdir build
meson . build/
cd build
ninja build
ninja install
```

## Ubuntu
When installing on Ubuntu, you may have to run meson like so in order for the shared object file to show up in a place ldconfig will be able to see it by default
```bash
meson . build/ --libdir=/usr/local/lib
```
