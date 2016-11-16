# ggplot2 高级绘图

## 1. R中的四种图形系统

R中主要有四种主要的图形系统，分别是：

        * 基础图形

        * grid包

        用户可以在图形设备上随意创建矩形区域，在该区域定义坐标系统，然后使用一系列丰富
        的绘图基础单元来控制图形元素的摆放和外观。但grid包没有提供生成统计图形以及完整
        绘图的函数。

        * lattice包

        可绘制网格图形，基于grid创建。网格图形显示一个变量的分布或是变量之间的关系，分别
        显示一个或多个变量的各个水平。effects, gflexclust, Hmisc, mice, odfWeave等包
        都使用了lattice包中的函数来生成图形。

        * ggplot2包

        提供一个全面的、基于语法的、连贯一致的图形生成系统，允许用户创建新颖的、有创新性
        的数据可视化图形。

## 2. ggplot2包介绍

ggplot2中，图是采用串联起来（+）号函数创建的。每个函数修改属于自己的部分。下面给出了一个
例子：

```{r}
        library(ggplot2)
        ggplot(data = mtcars, aes(x = wt, y = mpg)) +
                geom_point(pch = 17, color = "blue", size = 2) +
                geom_smooth(method = "lm", color = "red", linetype = 2) +
                labs(title = "Automobie Data", x = "weight", y = "Miles Per Gallon)
```
ggplot() 初始化图形并且指定要用到的数据来源（mtcars）和变量（wt、mpg）
aes() 指定每个变量扮演的角色
geom_point() 在图中画点，创建散点图
geom_smooth() 增加“平滑”曲线，例子中使用的是线性拟合
labs() 可添加注释（包括轴标签和标题）

## 3. 用几何函数指定图的类型

### 几何函数

```{r}
        geom _bar() # 条形图
        geom_boxplot() # 箱线图
        geom_density() # 密度图
        geom_histogram() # 直方图
        geom_hline() # 水平线
        geom_jitter() # 抖动线
        geom_line() # 线图
        geom_point() # 散点图
        geom_rug() # 地毯图
        geom_smooth() # 拟合曲线
        geom_text() # 文字注解
        geom_violin() # 小提琴图
        geom_vline() # 垂线
```

### 几何函数的常见选项

color  对点、线和填充区域的边界进行着色
fill 对填充区域着色
alpha 颜色的透明度，从0（完全透明）到1（不透明）
linetype 图案的线条（1=实线，2=虚线，3=点，4=点破折号，5=长破折号，6=双破折号）
size 点的尺寸和线的宽度
shape 点的形状（0=开放方形，1=开放圆形，2=开放三角形）
position 绘制诸如条形图和点等对象的位置
binwidth 直方图的宽度
notch 表示方块图是否应为缺口（T/F）
sides 地毯图的安置（"b"=底部，"l"=左部，"t"=顶部，"r"=右部，"bl"=左下部，等等）
width 箱线图的宽度

## 4. 分组    

在R中，组通常用分类变量的水平（因子）来定义。分组是通过ggplot2图将一个或多个带有诸如形
状、颜色、填充、尺寸和线类型的视觉特征的分组变量来完成的。
例如：
```{r}
        ggplot(data = Salaries, aes(x = salary, fill = rank)) +
                geom_density(alpht = .3)
```

按照rank来填充不同的颜色

```{r}
        ggplot(Salaries, aes(x = yrs.since.phd, y = salary, color = rank, 
                shape = sex)) +
                geom_point()
```

使用不同的颜色区分rank，不同的形状区分sex

```{r}
        ggplot(Salaries, aes(x = rank, fill = sex)) + 
                geom_bar(position = "stack") + labs(title = 'position = "stack"')
        ggplot(Salaries, aes(x = rank, fill = sex)) +
                geom_bar(position = "dodge") + labs(title = 'position = "stack"')
        ggplot(Salaries, aes(x = rank, fill = sex)) +
                geom_bar(position = "fill") + labs(title = 'position = "fill"')
```

用一个分组的条形图按学术等级和性别来可视化教授的人数。从前两个图中可以明显看出教授的人数
大于其他学术等级的人数。除此之外，女性教授的人数比女性助理教授和副教授的人数要多。第三个
图表示即使女性的总数更大，但是女性教授在教授中的比重远远小于其他两组。

## 5. 刻面

* facet_wrap(~var, ncol = n) 将每个var水平排列成n列的独立图

* facet_wrap(~var, nrow = n) 将每个var水平排列成n行的独立图

* facet_grid(rowvar ~ colvar) rowvar和colvar组合的独立图，其中rowvar表示行，colvar
表示列

* facet_grid(rowvar ~ .) 每个rowvar水平的独立图，配置成一个单列

* facet_grid(. ~ colvar) 每个colvar水平的独立图，配置成一个单行

## 6. 添加光滑曲线：geom_smooth()函数

使用geom_smooth()函数来添加一系列的平滑曲线和置信区域。函数的具体参数如下：

* method =      使用的平滑参数（包括lm, glm, smooth, rlm, gam）
* formula =     在光滑函数中使用的公式（y~x, y~log(x), y~poly(x, n), y~ns(x, n)）
* se            绘制置信区间（T/F）
* level         绘制的置信区间水平
* fullrange     指定拟合应涵盖全图（T）或仅仅是数据（F）

## 7. 修改ggplot2图形的外观

### 7.1 坐标轴

控制坐标轴和刻度线外观的函数：

* scale_x_continuous()和scale_y_continuous()

breaks = 指定刻度标记，labels = 指定刻度标记标签，limits = 控制要展示的值的范围

* scale_x_discrete()和scale_y_discrete()

breaks = 对因子的水平进行放置和排序，labels = 指定这些水平的标签，limits = 表示哪些水
平应该展示

* coord_flip()

颠倒x轴和y轴

可以看到，ggplot2函数区分x轴和y轴，以及轴线是否代表一个连续或离散变量（因子）。

### 7.2 图例

```{r}
        ...
        labs(title = "Faculty Salary by Rank and Gender", 
                x = "", y = "", fill = "Gender") +
        theme(legend.position = c(.1, .8))
```

图例的左上角是分别距离左侧边缘10%和底部边缘80%的部分。如果想删除图例，可以使用 *lengend.
position = "none"*。


### 7.3 标尺

ggplot2包使用标尺把数据空间的观察值映射到可视化的空间中。

```{r}
        ggplot(mtcars, aes(x = wt, y - mpg, size = disp)) +
                geom_point(shape = 21, color = "black", fill = "cornsilk") +
                labs(x = "weight", y = "miles per gallon", 
                        title = "bubble chart", size - "Engine\nDisplacement")
```

aes()函数的参数size = disp生成连续型变量disp的标尺，并使用它来控制点的尺寸。

### 7.4 主题

```{r}
        mytheme <- theme(plot.title = element_text(face = "bold.italic", 
                                size = "14", color = "brown"), 
                        axis.title = element_text(face = "bold.italic"), 
                                size = "10", color = "brown"), 
                        panel.background = element_rect(fill = "white", 
                                color = "darkblue"), 
                        panel.grid.major.y = element_line(color = "grey", 
                                linetype = 1), 
                        panel.grid.minor.y = element_line(color = "grey", 
                                linetype = 2), 
                        panel.grid.minor.x = element_blank(), 
                        lengend.position = "top")
```

指定了图的标题应该为粗斜体的棕色14号字。轴的标题为粗斜体的棕色10号字。坐标轴标签应为加粗
的深蓝色9号字。画图区域有白色的填充和深蓝色的边框。主水平网格应该是灰色的实线，次水平网络
应该是灰色的虚线；垂直网络不输出；图例展示在图的顶部。

### 7.5 多重图

```{r}
        library(ggplot2)
        p1 <- ...
        p2 <- ...
        p3 <- ...
        library(gridExtra)
        grid.arrange(p1, p2, p3, ncol = 3)
```

每个图都被保存成一个对象，然后用grid.arrange()函数保存到单个图形中。
