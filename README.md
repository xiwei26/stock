# 股票行情助手

一个 Manifest V3 Chrome 扩展，用于快速查看 A 股、港股、美股和国际指数行情，并管理本地自选股票。

## 本地运行

1. 打开 Chrome 的 `chrome://extensions`。
2. 开启「开发者模式」。
3. 选择「加载已解压的扩展程序」，并选择本项目目录。

## 发布到 Chrome 网上应用店

发布资料已准备在以下文件中：

- [商店文案](STORE_LISTING.md)
- [隐私政策](PRIVACY.md)
- [截图清单](store-assets/README.md)

使用 PowerShell 执行 `./package-extension.ps1` 后，会在 `release/` 生成可上传的 ZIP 包。公开隐私政策将部署至 `https://xiwei26.github.io/stock/`。
