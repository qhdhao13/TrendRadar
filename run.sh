#!/bin/bash
# 秦皇岛银行负面舆情监控系统 - 运行脚本

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# 激活虚拟环境
source venv/bin/activate

# 运行主程序
python3 main.py

# 退出虚拟环境
deactivate

