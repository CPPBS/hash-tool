# Hash Tool – 文件哈希计算器（Windows 批处理）

> *A lightweight Windows batch script to compute file hashes via PowerShell's `Get-FileHash`.*

---

## 简介 | *Introduction*

这是一个轻量级的 Windows 批处理脚本，借助 PowerShell 内置的 `Get-FileHash` 命令，快速计算文件的哈希值。  
*This is a lightweight Windows batch script that uses PowerShell's `Get-FileHash` cmdlet to quickly compute file hashes.*

支持**拖拽多个文件**和**交互式菜单**，也支持命令行直接传入文件路径。  
*It supports drag‑and‑drop of multiple files, an interactive menu, and command‑line arguments.*

---

## 功能特点 | *Features*

- **交互菜单** – 启动后显示算法列表，输入数字选择，或输入 `a` 一次性计算全部 7 种哈希。  
  *Interactive menu – choose an algorithm by number, or enter `a` for all 7 hashes.*

- **拖拽支持** – 将文件直接拖到批处理文件图标上，或在交互模式下拖入控制台窗口。  
  *Drag‑and‑drop – drop files onto the batch file or into the console window.*

- **多文件处理** – 依次处理每个拖入的文件，并分别显示结果。  
  *Multi‑file processing – each file is processed and its hash(es) displayed.*

- **支持算法**（*Supported algorithms*）：
  - SHA1
  - SHA256
  - SHA384
  - SHA512
  - MACTripleDES
  - MD5
  - RIPEMD160

- **全部计算模式** – 选择 `a` 后，对每个文件依次计算以上所有哈希。  
  *All‑in‑one mode – computes all 7 algorithms for every file.*

---

## 系统要求 | *Requirements*

- Windows 操作系统（已在 Windows 10 / 11 上测试）  
  *Windows OS (tested on Windows 10 / 11)*
- PowerShell（所有现代 Windows 均预装）  
  *PowerShell (pre‑installed on all modern Windows)*

---

## 安装 | *Installation*

1. 下载 `hash.bat` 到任意文件夹。  
   *Download `hash.bat` to any folder.*

2. （可选）将该文件夹添加到系统 `PATH` 环境变量，以便在任意位置直接运行。  
   *(Optional) Add that folder to your `PATH` to run from anywhere.*

---

## 使用方法 | *Usage*

### 交互模式（推荐）| *Interactive mode (recommended)*

双击 `hash.bat` 打开控制台窗口，会显示菜单。输入对应数字（或 `a`），然后将一个或多个文件拖入窗口，按 **Enter** 键即可。  
*Double‑click `hash.bat` to open the console with the menu. Enter the algorithm number (or `a`), then drag one or more files into the window and press **Enter**.*

### 命令行模式 | *Command‑line mode*

也可以直接传入文件路径（脚本会先询问算法）：  
*You can also pass file paths directly (the script will ask for the algorithm first):*
```cmd
hash.bat C:\path\to\file1.txt D:\file2.pdf
```

### 示例 | *Example*

```
       Num|Type
  ──────────────
    0|exit
    1|sha1
    2|sha256
    ...
    a|ALL

type: 2
Processing files (Algorithm: SHA256) ...

  [myfile.txt] ...
     Hash: 9f86d081884c7d659a9fe9590b4a3f4b6b8c7d9e...
```

---

## 注意事项 | *Notes*

- 脚本调用 `powershell -Command`，通常执行策略允许单条命令，无需额外设置。  
  *The script uses `powershell -Command` – execution policy usually allows single commands without extra config.*

- 大文件计算哈希可能需要几秒钟，请耐心等待。  
  *Hashing large files may take a few seconds – please be patient.*

- `MACTripleDES` 是一种密钥哈希，`Get-FileHash` 默认使用空密钥，行为可能因环境而异。  
  *`MACTripleDES` is a keyed hash; `Get-FileHash` uses an empty key by default (behaviour may vary).*

---

## 许可证 | *License*

本脚本采用 [MIT 许可证](LICENSE)，可自由使用、修改和分发。  
*This script is provided under the [MIT License](LICENSE) – feel free to use, modify, and distribute.*
