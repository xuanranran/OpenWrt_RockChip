# SPDX-License-Identifier: GPL-2.0-only
# Based on sbwml/package_kernel_tcp-brutal, commit 795472817cc0.

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=tcp-brutal
PKG_VERSION:=1.0.3
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/apernet/tcp-brutal/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=a52f004f70bba072c2d8bb3774071e91aab25d0fe33cd6a7b76e1d6d9e664a7f
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=sbwml <admin@cooluc.com>

include $(INCLUDE_DIR)/package.mk

define KernelPackage/tcp-brutal
  SUBMENU:=Network Support
  TITLE:=TCP Brutal congestion control
  FILES:=$(PKG_BUILD_DIR)/brutal.ko
  AUTOLOAD:=$(call AutoProbe,brutal)
endef

define Build/Compile
	+$(KERNEL_MAKE) M=$(PKG_BUILD_DIR) modules
endef

$(eval $(call KernelPackage,tcp-brutal))
