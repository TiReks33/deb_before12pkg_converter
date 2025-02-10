# deb_before12pkg_converter
Convert newer .deb pkgs (Debian 12+) to older versions of Debian OS (11 and older).
## Description
Debian’s dpkg system didn’t support zstd compression for packages prior to version 1.21.18. Support was added just in time for Debian 12. If you try to dpkg your package to an older OS you will stack with such error:

[**Typical error**]:  

> dpkg-deb: error: archive '/home/user/pkg.deb' uses unknown compression for member 'control.tar.zst', giving up
dpkg: error processing archive /home/user/pkg.deb (--install):
 dpkg-deb --control subprocess returned error exit status 2
Errors were encountered while processing:
 /home/user/pkg.deb

This convertion script helps convert newer .deb pkgs (Debian 12+) to older versions of Debian OS (11 and older).
## Usage
Put package full path as first arg, and ***\*optional\**** output path (/tmp as default).
## Example
```
/bin/bash deb_before12pkg_converter.sh ~/qtcreator_proj/build-adb-explorer-Desktop-Release/DistributionKit/adb-explorer11c.deb ~/Documents/
```
