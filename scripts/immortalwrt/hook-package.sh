#!/bin/bash
# Set to local prepare

# autocore
rm -rf package/emortal/autocore
git clone https://github.com/xuanranran/autocore-arm -b openwrt-24.10 package/emortal/autocore

# default settings
rm -rf package/emortal/default-settings
git clone https://github.com/xuanranran/default-settings -b openwrt-24.10 package/emortal/default-settings

# custom packages
rm -rf customfeeds/luci/applications/{luci-app-filebrowser,luci-app-argon-config}
rm -rf customfeeds/luci/themes/luci-theme-argon
rm -rf customfeeds/packages/net/shadowsocks-libev

rm -rf customfeeds/packages/net/{*alist,chinadns-ng,dns2socks,dns2tcp,lucky,sing-box}
# chmod 755 customfeeds/lovepackages/luci-app-onliner/root/usr/share/onliner/setnlbw.sh

sed -i 's/video,+libmesa +libwayland +libgudev/video,+libgudev/g' customfeeds/packages/multimedia/gst1-plugins-base/Makefile
sed -i 's/controller,,+libgraphene +libjpeg +libpng/controller,,+libjpeg +libpng/g' customfeeds/packages/multimedia/gst1-plugins-base/Makefile

sed -i 's/1.14.1/1.14.2/g' customfeeds/packages/net/zerotier/Makefile
sed -i 's/4f9f40b27c5a78389ed3f3216c850921f6298749e5819e9f2edabb2672ce9ca0/c2f64339fccf5148a7af089b896678d655fbfccac52ddce7714314a59d7bddbb/g' customfeeds/packages/net/zerotier/Makefile

# Update golang 1.23.x
rm -rf customfeeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang customfeeds/packages/lang/golang
# git clone https://github.com/sbwml/packages_lang_golang -b 23.x customfeeds/packages/lang/golang

# rm -rf customfeeds/packages/utils/lrzsz
# git clone https://github.com/sbwml/packages_utils_lrzsz package/new/lrzsz

# Docker
rm -rf customfeeds/luci/applications/luci-app-dockerman
git clone https://git.cooluc.com/sbwml/luci-app-dockerman -b openwrt-23.05 customfeeds/luci/applications/luci-app-dockerman
rm -rf customfeeds/packages/utils/{docker,dockerd,containerd,runc}
git clone https://github.com/sbwml/packages_utils_docker customfeeds/packages/utils/docker
git clone https://github.com/sbwml/packages_utils_dockerd customfeeds/packages/utils/dockerd
git clone https://github.com/sbwml/packages_utils_containerd customfeeds/packages/utils/containerd
git clone https://github.com/sbwml/packages_utils_runc customfeeds/packages/utils/runc
sed -i '/sysctl.d/d' customfeeds/packages/utils/dockerd/Makefile
pushd customfeeds/packages
curl -s https://raw.githubusercontent.com/sbwml/r4s_build_script/refs/heads/master/openwrt/patch/docker/0001-dockerd-fix-bridge-network.patch | patch -p1
curl -s https://raw.githubusercontent.com/sbwml/r4s_build_script/refs/heads/master/openwrt/patch/docker/0002-docker-add-buildkit-experimental-support.patch | patch -p1
curl -s https://raw.githubusercontent.com/sbwml/r4s_build_script/refs/heads/master/openwrt/patch/docker/0003-dockerd-disable-ip6tables-for-bridge-network-by-defa.patch | patch -p1
popd

# samba4 - bump version
rm -rf customfeeds/packages/net/samba4
git clone https://github.com/sbwml/feeds_packages_net_samba4 customfeeds/packages/net/samba4
sed -i 's/ftp.gwdg.de/download.samba.org/g' customfeeds/packages/net/samba4/Makefile

# liburing - 2.7 (samba-4.21.0)
rm -rf customfeeds/packages/libs/liburing
git clone --depth 1 https://github.com/sbwml/feeds_packages_libs_liburing customfeeds/packages/libs/liburing
# enable multi-channel
sed -i '/workgroup/a \\n\t## enable multi-channel' customfeeds/packages/net/samba4/files/smb.conf.template
sed -i '/enable multi-channel/a \\tserver multi channel support = yes' customfeeds/packages/net/samba4/files/smb.conf.template
# default config
sed -i 's/#aio read size = 0/aio read size = 0/g' customfeeds/packages/net/samba4/files/smb.conf.template
sed -i 's/#aio write size = 0/aio write size = 0/g' customfeeds/packages/net/samba4/files/smb.conf.template
sed -i 's/invalid users = root/#invalid users = root/g' customfeeds/packages/net/samba4/files/smb.conf.template
sed -i 's/bind interfaces only = yes/bind interfaces only = no/g' customfeeds/packages/net/samba4/files/smb.conf.template
sed -i 's/#create mask/create mask/g' customfeeds/packages/net/samba4/files/smb.conf.template
sed -i 's/#directory mask/directory mask/g' customfeeds/packages/net/samba4/files/smb.conf.template
sed -i 's/0666/0644/g;s/0744/0755/g;s/0777/0755/g' customfeeds/luci/applications/luci-app-samba4/htdocs/luci-static/resources/view/samba4.js
sed -i 's/0666/0644/g;s/0777/0755/g' customfeeds/packages/net/samba4/files/samba.config
sed -i 's/0666/0644/g;s/0777/0755/g' customfeeds/packages/net/samba4/files/smb.conf.template

# natmap
pushd customfeeds/luci
curl -s https://raw.githubusercontent.com/xuanranran/r4s_build_script/refs/heads/master/openwrt/patch/luci/applications/luci-app-natmap/0001-luci-app-natmap-add-default-STUN-server-lists.patch | patch -p1
popd

# procps-ng - top
sed -i 's/enable-skill/enable-skill --disable-modern-top/g' customfeeds/packages/utils/procps-ng/Makefile

# xdp-tools
rm -rf package/network/utils/xdp-tools
git clone --depth 1 https://github.com/sbwml/package_network_utils_xdp-tools package/network/utils/xdp-tools

# 替换杂项
rm -rf customfeeds/luci/applications/luci-app-package-manager
pushd customfeeds/luci/applications/
git clone --depth 1 https://github.com/openwrt/luci openwrt_package-manager && mv -n openwrt_package-manager/applications/luci-app-package-manager ./ ; rm -rf openwrt_package-manager
popd

rm -rf package/emortal/cpufreq


