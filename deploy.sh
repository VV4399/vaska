#!/bin/bash
set -e

PORTFOLIO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🚀 部署 VASKA 作品集到 Vercel"
echo ""

# 1. 创建 Vercel 配置
echo '{"framework":null,"buildCommand":"","outputDirectory":"."}' > "$PORTFOLIO_DIR/vercel.json"
echo "✅ vercel.json 已创建"

# 2. 检查 git
cd "$PORTFOLIO_DIR"
if ! git remote -v | grep -q origin; then
    echo ""
    echo "📝 创建 Git 仓库..."
    git init 2>/dev/null || true
    git add . 2>/dev/null || true
    git commit -m "deploy: portfolio v1" 2>/dev/null || true
    echo "✅ Git 仓库初始化完成"
fi

# 3. 安装并登录 Vercel
echo ""
echo "📦 安装 Vercel CLI (首次约需 1-2 分钟)..."
npx vercel --version

echo ""
echo "🔐 请登录 Vercel（浏览器会自动打开）"
npx vercel login

echo ""
echo "🚀 开始部署..."
echo ""
npx vercel --yes

echo ""
echo "✅ 部署完成！"
echo "请访问输出的 URL 查看你的作品集"
