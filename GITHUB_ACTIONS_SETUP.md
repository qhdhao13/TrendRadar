# GitHub Actions 设置指南

## 📋 配置步骤

### 1. 将代码推送到 GitHub

```bash
# 如果还没有 Git 仓库，初始化并推送
git init
git add .
git commit -m "初始化秦皇岛银行负面舆情监控系统"
git branch -M main
git remote add origin https://github.com/你的用户名/你的仓库名.git
git push -u origin main
```

### 2. 配置 GitHub Secrets（必需）

在 GitHub 仓库中设置 Secrets：

1. 进入你的 GitHub 仓库
2. 点击 **Settings** → **Secrets and variables** → **Actions**
3. 点击 **New repository secret**
4. 添加以下 Secret：

#### 必需配置

| Secret 名称 | 值 | 说明 |
|-----------|-----|------|
| `FEISHU_WEBHOOK_URL` | 你的飞书机器人 webhook 地址 | 例如：`https://open.feishu.cn/open-apis/bot/v2/hook/xxxxx` |

⚠️ **重要**：Secret 名称必须完全一致（区分大小写）

### 3. 启用 GitHub Actions

1. 进入仓库的 **Actions** 标签页
2. 如果提示需要启用 Actions，点击 **Enable Actions**
3. 在左侧选择 **秦皇岛银行负面舆情监控** workflow
4. 点击 **Run workflow** 可以手动测试一次

## ⏰ 执行时间

- **定时执行**：每天凌晨 1:00（北京时间）
- **手动执行**：可以在 Actions 页面手动触发
- **注意**：GitHub Actions 使用 UTC 时间，可能有最多 15 分钟的延迟

## 📊 查看运行日志

1. 进入仓库的 **Actions** 标签页
2. 点击左侧的 **秦皇岛银行负面舆情监控**
3. 点击最新的运行记录查看详细日志

## ✅ 验证配置

配置完成后，系统会：
1. 每天凌晨 1 点自动运行
2. 抓取 11 个平台的热点新闻
3. 筛选包含"秦皇岛银行"的负面舆情
4. 推送到飞书机器人

## 🔧 故障排查

### 如果 Actions 没有运行

1. 检查 Secrets 是否配置正确
2. 检查 workflow 文件是否在 `.github/workflows/` 目录下
3. 检查代码是否已推送到 GitHub

### 如果飞书没有收到消息

1. 检查 `FEISHU_WEBHOOK_URL` Secret 是否正确
2. 查看 Actions 运行日志，确认是否有错误
3. 手动触发一次测试

## 📝 注意事项

1. **免费额度**：GitHub Actions 免费账户每月有 2000 分钟运行时间
2. **延迟**：定时任务可能有最多 15 分钟的延迟
3. **数据存储**：抓取的数据会保存在 `output/` 目录，并自动提交到仓库

