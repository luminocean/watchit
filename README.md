# watchit

watchit是一个前端开发的辅助工具，其主要功能有：
- 在指定目录下启动一个静态web服务器，用于向浏览器提供静态文件访问（效果与python3 -m http.server相同）
- 监视启动web服务器的目录中任意文件的修改操作，当有修改时自动刷新页面

# 基本使用

```
Usage: watchit [options]
    -w, --watch        Watch path, 要监视的路径
    -p, --port         Server port, 启动的服务器端口
    -v, --version      Version, 版本信息
    -h, --help         Display this help message, 帮助消息
```
