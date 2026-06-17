@echo off
:: 设置编码为UTF-8，防止中文乱码
chcp 65001 >nul
echo ===================================================
echo        [GIT AUTOMATION] 正在启动大哲推流...
echo ===================================================

:: 1. 检查当前目录是否是 Git 仓库
if not exist .git (
    echo [ERROR] 当前目录不是 Git 仓库，正在尝试初始化...
    git init
    echo [INFO] 请确保您已经运行过 git remote add origin ^<您的仓库地址^>
)

:: 2. 暂存所有更改 (包括新增的 html 和图片等)
echo [1/3] 正在暂存文件 (git add) ...
git add .

:: 3. 自动生成包含当前时间的 Commit 信息
set COMMIT_MSG=更新数独与解谜页面代码_提交时间_%date:~0,10%_%time:~0,8%
echo [2/3] 正在生成刻印 (git commit) ...
git commit -m "%COMMIT_MSG%"

:: 4. 推送到远程分支 (默认推送到 main，如果你的默认分支是 master 请改为 master)
echo [3/3] 正在破开虚空连接远程仓库 (git push) ...
git push origin main

if %errorlevel% equ 0 (
    echo ===================================================
    echo [SUCCESS] 同步推演完成！代码已成功上传至远程节点。
    echo ===================================================
) else (
    echo ===================================================
    echo [FAILED] 推送失败，请检查网络连接或分支权限。
    echo ===================================================
)

pause