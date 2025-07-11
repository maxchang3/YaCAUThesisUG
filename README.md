> [!TIP]
> 此 $\LaTeX$ 模板仅支持本科生使用。如果您确定仅提交 PDF 即可满足老师审阅需求，强烈推荐使用 [Typst](https://typst.app/docs) 以获得更快的编译速度与更佳的编写体验。
> 
> **Typst 是一款现代文档排版工具，语法简洁，支持快速编写与实时预览，生态也在持续发展中。** 
> 
> [CAU-ThesisTemplate-Typst](https://github.com/JWangL5/CAU-ThesisTemplate-Typst) 是一个优秀的基于 Typst 的中国农业大学学位论文模板，同时支持本硕博三种学位论文格式，也是目前唯一同时支持这三种学位类型的模板。
>
> 同时，您还可以使用 [touying-simpl-cau](https://github.com/maxchang3/touying-simpl-cau) 快速创建符合中国农业大学主题风格的演示文稿/幻灯片。

<img src="./pictures/CAU.png" height="100" align="right" />

# YaCAUThesisUG

> **Y**et **A**nother **CAU** LaTeX **Thesis** Template for **U**nder**g**raduate

> 又一个中国农业大学**本科生**毕业论文 LaTeX 模板

`yacauthesisug` 是基于 [CAU-Undergraduate-Thesis-Template](https://github.com/Wubeizhongxinghua/CAU-Undergraduate-Thesis-Template) 项目的个人修改版本。

遵循[《中国农业大学本科生毕业论文（设计）撰写基本规范》](https://cem.cau.edu.cn/module/download/downfile.jsp?classid=0&filename=c806c54bfaac421c9103c7760d3a77f9.pdf)，可自动生成符合要求的本科生毕业论文格式。

> [!WARNING]
> 一些细节之处根据个人喜好主观进行了调整，可能不完全符合学校的要求，请根据实际情况进行修改。

## 主要修改

本模板在原版基础上进行了以下改进：

- **现代化配置系统**：通过 `\causetup{}` 命令提供统一的配置接口
- **简化操作流程**：抽象常用命令和环境，简化文档编写
- **完整文档结构**：添加原创性声明等原始模板中缺少的内容
- **跨平台一致性**：内嵌 Windows 中文字体，保证跨平台渲染一致性
- **优化编写体验**：内置 VS Code 配置，（安装好 LaTeX 发行版后）开箱即用
- **规范化单位**：将页面设置中的 `pt` 单位统一为 `mm`/`bp`

## 使用指南


### 环境推荐

| 组件                 | 推荐/说明                                                                              |
| -------------------- | -------------------------------------------------------------------------------------- |
| LaTeX 发行版         | 推荐 [TeXLive](https://www.tug.org/texlive/) 2023 或更新版本                           |
| 编辑器               | [VS Code](https://code.visualstudio.com/) 并使用推荐的插件（首次进入工作区会提示安装） |
| 文献管理工具（可选） | [Zotero](https://www.zotero.org/) 或 [JafRef](https://www.jabref.org/)                 |

如果需要插入额外的页面（如任务书等），可以先使用 Word 导出 PDF，然后使用 PDF Expert 或 Adobe Acrobat 等工具进行编辑插入。

### 编译流程

```bash
xelatex → biber → xelatex → xelatex
```

### 快速开始

1. **下载模板**：克隆或下载模板文件到本地目录，或点击 <kbd>[Use this template](https://github.com/new?template_name=yacauthesisug&template_owner=maxchang3)</kbd> 创建新仓库
2. **配置信息**：在 `private.tex` 中填写个人信息
3. **设置论文**：在 `thesis.tex` 中设置论文基本信息
4. **开始写作**：开始撰写论文内容

### 配置文件

`causetup.tex` 中的配置项可以在任意位置使用 `\causetup{key=value}` 命令进行设置。为了便于管理和修改，推荐将个人信息和论文信息分开配置。

#### 个人信息配置 (`private.tex`)

> [!TIP]
> 建议在项目根目录创建 `.gitignore` 文件，添加 `private.tex` 以防止个人信息被意外提交到版本控制系统。

```latex
\causetup{
    name       = {张其麦},
    advisor    = {王一},
    advisor-title = {副教授},
    major      = {计算机科学与技术},
    college    = {信息与电气工程学院},
    education  = {
      你的教育经历
    },
    introduction = {
      男，2039 年 3 月出生，某某省某某人。
    }
}
```

#### 论文信息配置 (`thesis.tex`)

```latex
\causetup{
    title       = {基于深度学习的图像识别技术研究},
    title-en    = {Research on Image Recognition Technology Based on Deep Learning},
    keywords    = {深度学习，神经网络，人工智能},
    keywords-en = {deep learning, neural network, artificial intelligence}
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


## License

本项目采用 [LaTeX Project Public License v1.3c](https://www.latex-project.org/lppl.txt) 开源协议。

> **注意**：`fonts/` 目录下的字体文件为 Windows 系统字体，仅用于测试和演示目的。

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个模板！

