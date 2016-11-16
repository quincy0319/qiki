# ggplot2 �߼���ͼ

## 1. R�е�����ͼ��ϵͳ

R����Ҫ��������Ҫ��ͼ��ϵͳ���ֱ��ǣ�

        * ����ͼ��

        * grid��

        �û�������ͼ���豸�����ⴴ�����������ڸ�����������ϵͳ��Ȼ��ʹ��һϵ�зḻ
        �Ļ�ͼ������Ԫ������ͼ��Ԫ�صİڷź���ۡ���grid��û���ṩ����ͳ��ͼ���Լ�����
        ��ͼ�ĺ�����

        * lattice��

        �ɻ�������ͼ�Σ�����grid����������ͼ����ʾһ�������ķֲ����Ǳ���֮��Ĺ�ϵ���ֱ�
        ��ʾһ�����������ĸ���ˮƽ��effects, gflexclust, Hmisc, mice, odfWeave�Ȱ�
        ��ʹ����lattice���еĺ���������ͼ�Ρ�

        * ggplot2��

        �ṩһ��ȫ��ġ������﷨�ġ�����һ�µ�ͼ������ϵͳ�������û�������ӱ�ġ��д�����
        �����ݿ��ӻ�ͼ�Ρ�

## 2. ggplot2������

ggplot2�У�ͼ�ǲ��ô���������+���ź��������ġ�ÿ�������޸������Լ��Ĳ��֡����������һ��
���ӣ�

```{r}
        library(ggplot2)
        ggplot(data = mtcars, aes(x = wt, y = mpg)) +
                geom_point(pch = 17, color = "blue", size = 2) +
                geom_smooth(method = "lm", color = "red", linetype = 2) +
                labs(title = "Automobie Data", x = "weight", y = "Miles Per Gallon)
```
ggplot() ��ʼ��ͼ�β���ָ��Ҫ�õ���������Դ��mtcars���ͱ�����wt��mpg��
aes() ָ��ÿ���������ݵĽ�ɫ
geom_point() ��ͼ�л��㣬����ɢ��ͼ
geom_smooth() ���ӡ�ƽ�������ߣ�������ʹ�õ����������
labs() �����ע�ͣ��������ǩ�ͱ��⣩

## 3. �ü��κ���ָ��ͼ������

### ���κ���

```{r}
        geom _bar() # ����ͼ
        geom_boxplot() # ����ͼ
        geom_density() # �ܶ�ͼ
        geom_histogram() # ֱ��ͼ
        geom_hline() # ˮƽ��
        geom_jitter() # ������
        geom_line() # ��ͼ
        geom_point() # ɢ��ͼ
        geom_rug() # ��̺ͼ
        geom_smooth() # �������
        geom_text() # ����ע��
        geom_violin() # С����ͼ
        geom_vline() # ����
```

### ���κ����ĳ���ѡ��

color  �Ե㡢�ߺ��������ı߽������ɫ
fill �����������ɫ
alpha ��ɫ��͸���ȣ���0����ȫ͸������1����͸����
linetype ͼ����������1=ʵ�ߣ�2=���ߣ�3=�㣬4=�����ۺţ�5=�����ۺţ�6=˫���ۺţ�
size ��ĳߴ���ߵĿ��
shape �����״��0=���ŷ��Σ�1=����Բ�Σ�2=���������Σ�
position ������������ͼ�͵�ȶ����λ��
binwidth ֱ��ͼ�Ŀ��
notch ��ʾ����ͼ�Ƿ�ӦΪȱ�ڣ�T/F��
sides ��̺ͼ�İ��ã�"b"=�ײ���"l"=�󲿣�"t"=������"r"=�Ҳ���"bl"=���²����ȵȣ�
width ����ͼ�Ŀ��

## 4. ����    

��R�У���ͨ���÷��������ˮƽ�����ӣ������塣������ͨ��ggplot2ͼ��һ����������������
״����ɫ����䡢�ߴ�������͵��Ӿ������ķ����������ɵġ�
���磺
```{r}
        ggplot(data = Salaries, aes(x = salary, fill = rank)) +
                geom_density(alpht = .3)
```

����rank����䲻ͬ����ɫ

```{r}
        ggplot(Salaries, aes(x = yrs.since.phd, y = salary, color = rank, 
                shape = sex)) +
                geom_point()
```

ʹ�ò�ͬ����ɫ����rank����ͬ����״����sex

```{r}
        ggplot(Salaries, aes(x = rank, fill = sex)) + 
                geom_bar(position = "stack") + labs(title = 'position = "stack"')
        ggplot(Salaries, aes(x = rank, fill = sex)) +
                geom_bar(position = "dodge") + labs(title = 'position = "stack"')
        ggplot(Salaries, aes(x = rank, fill = sex)) +
                geom_bar(position = "fill") + labs(title = 'position = "fill"')
```

��һ�����������ͼ��ѧ���ȼ����Ա������ӻ����ڵ���������ǰ����ͼ�п������Կ������ڵ�����
��������ѧ���ȼ�������������֮�⣬Ů�Խ��ڵ�������Ů��������ں͸����ڵ�����Ҫ�ࡣ������
ͼ��ʾ��ʹŮ�Ե��������󣬵���Ů�Խ����ڽ����еı���ԶԶС���������顣

## 5. ����

* facet_wrap(~var, ncol = n) ��ÿ��varˮƽ���г�n�еĶ���ͼ

* facet_wrap(~var, nrow = n) ��ÿ��varˮƽ���г�n�еĶ���ͼ

* facet_grid(rowvar ~ colvar) rowvar��colvar��ϵĶ���ͼ������rowvar��ʾ�У�colvar
��ʾ��

* facet_grid(rowvar ~ .) ÿ��rowvarˮƽ�Ķ���ͼ�����ó�һ������

* facet_grid(. ~ colvar) ÿ��colvarˮƽ�Ķ���ͼ�����ó�һ������

## 6. ��ӹ⻬���ߣ�geom_smooth()����

ʹ��geom_smooth()���������һϵ�е�ƽ�����ߺ��������򡣺����ľ���������£�

* method =      ʹ�õ�ƽ������������lm, glm, smooth, rlm, gam��
* formula =     �ڹ⻬������ʹ�õĹ�ʽ��y~x, y~log(x), y~poly(x, n), y~ns(x, n)��
* se            �����������䣨T/F��
* level         ���Ƶ���������ˮƽ
* fullrange     ָ�����Ӧ����ȫͼ��T������������ݣ�F��

## 7. �޸�ggplot2ͼ�ε����

### 7.1 ������

����������Ϳ̶�����۵ĺ�����

* scale_x_continuous()��scale_y_continuous()

breaks = ָ���̶ȱ�ǣ�labels = ָ���̶ȱ�Ǳ�ǩ��limits = ����Ҫչʾ��ֵ�ķ�Χ

* scale_x_discrete()��scale_y_discrete()

breaks = �����ӵ�ˮƽ���з��ú�����labels = ָ����Щˮƽ�ı�ǩ��limits = ��ʾ��Щˮ
ƽӦ��չʾ

* coord_flip()

�ߵ�x���y��

���Կ�����ggplot2��������x���y�ᣬ�Լ������Ƿ����һ����������ɢ���������ӣ���

### 7.2 ͼ��

```{r}
        ...
        labs(title = "Faculty Salary by Rank and Gender", 
                x = "", y = "", fill = "Gender") +
        theme(legend.position = c(.1, .8))
```

ͼ�������Ͻ��Ƿֱ��������Ե10%�͵ײ���Ե80%�Ĳ��֡������ɾ��ͼ��������ʹ�� *lengend.
position = "none"*��


### 7.3 ���

ggplot2��ʹ�ñ�߰����ݿռ�Ĺ۲�ֵӳ�䵽���ӻ��Ŀռ��С�

```{r}
        ggplot(mtcars, aes(x = wt, y - mpg, size = disp)) +
                geom_point(shape = 21, color = "black", fill = "cornsilk") +
                labs(x = "weight", y = "miles per gallon", 
                        title = "bubble chart", size - "Engine\nDisplacement")
```

aes()�����Ĳ���size = disp���������ͱ���disp�ı�ߣ���ʹ���������Ƶ�ĳߴ硣

### 7.4 ����

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

ָ����ͼ�ı���Ӧ��Ϊ��б�����ɫ14���֡���ı���Ϊ��б�����ɫ10���֡��������ǩӦΪ�Ӵ�
������ɫ9���֡���ͼ�����а�ɫ����������ɫ�ı߿���ˮƽ����Ӧ���ǻ�ɫ��ʵ�ߣ���ˮƽ����
Ӧ���ǻ�ɫ�����ߣ���ֱ���粻�����ͼ��չʾ��ͼ�Ķ�����

### 7.5 ����ͼ

```{r}
        library(ggplot2)
        p1 <- ...
        p2 <- ...
        p3 <- ...
        library(gridExtra)
        grid.arrange(p1, p2, p3, ncol = 3)
```

ÿ��ͼ���������һ������Ȼ����grid.arrange()�������浽����ͼ���С�
