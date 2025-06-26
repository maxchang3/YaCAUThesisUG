<img src="./pictures/CAU.png" height="100" align="right" />

# YaCAUGrad

> Yet Another China Agricultural University LaTeX Thesis Template for Undergraduate

> 又一个中国农业大学本科生毕业论文 LaTeX 模板

`yacaugrad` 是基于 [CAU-Undergraduate-Thesis-Template](https://github.com/Wubeizhongxinghua/CAU-Undergraduate-Thesis-Template) 项目的改进版本，旨在提供更加完善和易用的中国农业大学本科毕业论文 LaTeX 模板。

遵循[《中国农业大学本科生毕业论文（设计）撰写基本规范》](https://cem.cau.edu.cn/module/download/downfile.jsp?classid=0&filename=c806c54bfaac421c9103c7760d3a77f9.pdf)，可自动生成符合要求的本科生毕业论文格式。**但是一些细节之处根据个人喜好主观进行了调整，可能不完全符合学校的要求，请根据实际情况进行修改。**

## 主要特性

本模板在原版基础上进行了以下改进：

- **现代化配置系统**：引入基于 `kvoptions` 的键值配置系统，通过 `\causetup{}` 和 `\cauget{}` 命令提供统一的配置接口
- **跨平台字体支持**：内嵌 Windows 中文字体，保证跨平台渲染一致性
- **完整文档结构**：添加原创性声明等原始模板中缺少的内容
- **简化操作流程**：抽象常用命令和环境，简化文档编写
- **规范化单位**：将页面设置中的 `pt` 单位统一为 `mm`/`bp`


## 使用指南

### 环境要求

| 组件         | 推荐版本/说明                       |
| ------------ | ----------------------------------- |
| LaTeX 发行版 | TeXLive 2023 或更新版本             |
| 编辑器       | Visual Studio Code 使用推荐的插件 |

### 快速开始

1. **下载模板**：克隆或下载模板文件到本地目录
2. **配置信息**：在 `private.tex` 中填写个人信息
3. **设置论文**：在 `thesis.tex` 中设置论文基本信息
4. **开始写作**：开始撰写论文内容

### 配置文件

#### 个人信息配置 (`private.tex`)

```latex
\causetup{
    name           = {张三},
    advisor        = {李教授},
    advisor-title  = {教授},
    co-advisor     = {王副教授},
    major          = {计算机科学与技术},
    college        = {信息与电气工程学院},
    keywords       = {深度学习，神经网络，人工智能},
    keywords-en    = {deep learning, neural network, artificial intelligence}
}
```

#### 论文信息配置 (`thesis.tex`)

```latex
\causetup{
    title      = {基于深度学习的图像识别技术研究},
    title-en   = {Research on Image Recognition Technology Based on Deep Learning}
}
```

## 命令参考

### 配置命令
| 命令                        | 功能         |
| --------------------------- | ------------ |
| `\causetup{key=value, ...}` | 设置配置参数 |
| `\cauget{key}`              | 获取配置值   |

### 文档生成命令
| 命令                          | 功能             |
| ----------------------------- | ---------------- |
| `\makecover`                  | 生成论文封面     |
| `\makeoriginality{signature}` | 生成原创性声明页 |
| `\makelistoffigtbl`           | 生成图表目录     |
| `\makebib`                    | 生成参考文献列表 |

### 内容环境
| 环境                                  | 功能         |
| ------------------------------------- | ------------ |
| `\begin{abstract}...\end{abstract}`   | 中文摘要环境 |
| `\begin{abstract*}...\end{abstract*}` | 英文摘要环境 |
| `\begin{thank}...\end{thank}`         | 致谢环境     |

### 图表插入
| 命令                                            | 功能     |
| ----------------------------------------------- | -------- |
| `\caufig{路径}{标题}{描述}{宽度}{引用标签}`     | 插入图片 |
| `\cautable{标题}{列格式}{注释}{引用标签}{内容}` | 插入表格 |

## 编译说明

**标准编译流程**：
```bash
xelatex → biber → xelatex → xelatex
```

**推荐开发环境**：
- Visual Studio Code
  - LaTeX Workshop 扩展
  - LaTeX Utilities 扩展

支持自动编译和实时预览功能。

## License

本项目采用 [LaTeX Project Public License v1.3c](https://www.latex-project.org/lppl.txt) 开源协议。

> **注意**：`fonts/` 目录下的字体文件为 Windows 系统字体，仅用于测试和演示目的。

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个模板！

