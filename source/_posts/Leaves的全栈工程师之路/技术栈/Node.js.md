---
title: Node.js概览笔记
tags:
  - node.js
  - 前端
categories:
  - Leaves的全栈工程师之路
  - 技术栈
date:
updated:
---
Node.js 是一个基于 Chrome V8 JavaScript 引擎的开源、跨平台 JavaScript 运行时环境，允许你在服务器端运行 JavaScript 代码。与传统的 JavaScript 仅能在浏览器中运行不同，Node.js 拓展了其应用场景，使开发者能够使用 JavaScript 构建服务器端应用程序。

  

## Node.js 的特点

  

1. 事件驱动、非阻塞 I/O

Node.js 使用单线程的事件循环机制，处理 I/O 操作时采用异步（非阻塞）方式，这使得它在处理大量并发请求时非常高效，适合 I/O 密集型应用，比如 web 服务器或 API。

2. 轻量、快速

Node.js 基于 V8 引擎，具有出色的性能和轻量的特点。因为使用了异步 I/O 和事件驱动机制，它在处理网络请求时能比传统的同步阻塞式服务器更高效。

3. 单线程，处理高并发

虽然 Node.js 采用单线程，但是通过事件循环可以处理成千上万的并发连接。这使得它特别适合于高并发的网络应用场景，如聊天室、实时应用、在线游戏等。

4. 丰富的模块生态系统（npm）

Node.js 自带 npm（Node 包管理器），拥有世界上最大的开源库生态系统，包含数十万个可复用的库，开发者可以轻松引入第三方模块，从而大大提高开发效率。

  

## Node.js 的核心模块

  

Node.js 提供了一些核心模块，这些模块不需要通过 npm 安装，直接可以通过 require 导入使用：

  

• http：用于创建 HTTP 服务器。

• fs：文件系统模块，用于操作文件。

• path：处理文件和目录路径的模块。

• os：操作系统模块，获取操作系统相关信息。

• events：事件模块，用于处理事件。

  

Node.js 示例代码

  

以下是一个简单的 HTTP 服务器示例：

  

// 引入http模块

const http = require('http');

  

// 创建服务器

const server = http.createServer((req, res) => {

  // 设置响应头

  res.writeHead(200, { 'Content-Type': 'text/plain' });

  // 响应内容

  res.end('Hello, Node.js!');

});

  

// 监听端口

server.listen(3000, () => {

  console.log('服务器运行在 http://localhost:3000');

});

  

这段代码创建了一个简单的 HTTP 服务器，当用户访问 http://localhost:3000 时，服务器会响应 Hello, Node.js!。

  

## 核心概念

  

1. 异步编程

Node.js 的一大特点是异步编程。大多数 I/O 操作都是异步的，像读取文件、网络请求等都不会阻塞程序的执行。你可以通过回调函数、Promise 或者 async/await 来处理异步操作。

示例：

  

const fs = require('fs');

  

// 使用回调函数处理异步

fs.readFile('example.txt', 'utf8', (err, data) => {

  if (err) {

    console.error(err);

    return;

  }

  console.log(data);

});

  

  

2. npm 和模块化

Node.js 应用程序通常是模块化的，每个功能点都可以封装为独立的模块，并通过 npm 进行管理。npm 是 Node.js 的包管理器，类似于 Python 的 pip 或 Java 的 Maven。可以通过以下命令安装第三方模块：

  

npm install express

  

例如，使用 Express.js 构建一个 Web 服务器：

  

const express = require('express');

const app = express();

  

app.get('/', (req, res) => {

  res.send('Hello, Express!');

});

  

app.listen(3000, () => {

  console.log('服务器运行在 http://localhost:3000');

});

  

  

3. 事件驱动模型

Node.js 的事件驱动架构使得它非常适合处理 I/O 操作，如网络请求、文件操作等。每当有事件发生时，Node.js 会调用相应的回调函数处理该事件。

示例：

  

const EventEmitter = require('events');

const eventEmitter = new EventEmitter();

  

// 监听事件

eventEmitter.on('sayHello', () => {

  console.log('Hello World!');

});

  

// 触发事件

eventEmitter.emit('sayHello');

  

  

  

入门步骤

  

1. 安装 Node.js

到 Node.js 官方网站 [nodejs.org](https://nodejs.org/) 下载并安装最新版。安装完成后，你可以使用 node -v 和 npm -v 检查安装是否成功。

2. 运行第一个程序

创建一个 app.js 文件，写入以下内容：

  

console.log('Hello, Node.js!');

  

在终端执行命令 node app.js，查看输出。

  

3. 学习核心模块

熟悉 Node.js 的核心模块，如 http、fs、path 等，了解如何处理文件、创建 HTTP 服务器等。

4. 掌握异步编程

学习 Node.js 的异步编程模型，理解回调、Promise 和 async/await。

5. 使用 npm 管理包

学习使用 npm 安装和管理依赖，了解如何通过模块化提高代码的可维护性。

  
