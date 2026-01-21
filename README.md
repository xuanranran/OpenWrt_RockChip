# OpenWrt — RockChip多设备固件云编译
- 支持rk3588，rk356x，rk3399，rk3328
### 源代码地址
https://github.com/immortalwrt/immortalwrt

### 支持设备
```
armsom_sige3
armsom_sige7
friendlyarm_nanopc-t4
friendlyarm_nanopc-t6
friendlyarm_nanopi-r2c
friendlyarm_nanopi-r2c-plus
friendlyarm_nanopi-r2s
friendlyarm_nanopi-r3s
friendlyarm_nanopi-r4s
friendlyarm_nanopi-r4se
friendlyarm_nanopi-r5c
friendlyarm_nanopi-r5s
friendlyarm_nanopi-r6c
friendlyarm_nanopi-r6s
radxa_rock-5a
radxa_rock-5b
xunlong_orangepi-5
xunlong_orangepi-5-plus

```

### 固件默认配置
- 用户名：`root` 密码：`password` 管理IP：`192.168.11.1`
- 下载地址：https://github.com/xuanranran/OpenWrt_RockChip/releases 对应 Tag 标签内下载固件
- 刷机方法请参考dn2刷机 https://github.com/xuanranran/OpenWrt_RockChip/blob/master/data/emmc.md

### 固件升级

本仓库提供自动升级脚本，支持自动检测设备型号和选择Docker版本。

**方式一：使用本地脚本（推荐）**
```bash
# 下载并运行升级脚本
wget https://raw.githubusercontent.com/xuanranran/OpenWrt_RockChip/master/upgrade_openwrt.sh && chmod +x upgrade_openwrt.sh && ./upgrade_openwrt.sh
```

**方式二：直接运行（在线）**
```bash
bash <(curl -sL https://raw.githubusercontent.com/xuanranran/OpenWrt_RockChip/master/upgrade_openwrt.sh)
```

**功能特点：**
- ✅ 自动检测设备型号（24个RockChip设备型号）
- ✅ 支持选择标准版或Docker版固件
- ✅ 自动下载对应设备的最新固件
- ✅ SHA256校验确保文件完整性

### 固件展示
<img width="1304" alt="image" src="https://github.com/xuanranran/OpenWrt_RockChip/blob/master/data/1.png?raw=true">

### 特别提示 [![](https://img.shields.io/badge/-个人免责声明-FFFFFF.svg)](#特别提示-)

- **因精力有限不提供任何技术支持和教程等相关问题解答，不保证完全无 BUG！**

- **本人不对任何人因使用本固件所遭受的任何理论或实际的损失承担责任！**

- **本固件禁止用于任何商业用途，请务必严格遵守国家互联网使用相关法律规定！**

### 有bug请在 https://github.com/xuanranran/OpenWrt_RockChip/issues 提问题

### 鸣谢

特别感谢以下项目：

Openwrt 官方项目：

<https://github.com/openwrt/openwrt>

Lean 大的 Openwrt 项目：

<https://github.com/coolsnowwolf/lede>

immortalwrt 的 OpenWrt 项目：

<https://github.com/immortalwrt/immortalwrt>

P3TERX 大佬的 Actions-OpenWrt 项目：

<https://github.com/P3TERX/Actions-OpenWrt>

SuLingGG 大佬的 Actions 编译框架 项目：

https://github.com/SuLingGG/OpenWrt-Rpi
