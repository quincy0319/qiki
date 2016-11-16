# Windows Graphic Devices

R语言中的绘图设备包含两种：窗口和图形设备。使用窗口设备绘图图形直接输出到R UI的子窗口中，
使用图形设备则输出到文件中，缺省设备为窗口设备，输入绘图命令时，缺省打开一个绘图窗口，后
续绘图均使用该绘图窗口。

```{r}
        windows(width, height, pointsize, record, rescale, xpinch, ypinch,
                bg, canvas, gamma, xpos, ypos, buffered, title,
                restoreConsole, clickToConfirm, fillOddEven,
                family, antialias)

        win.graph(width, height, pointsize)
        
        x11(width, height, pointsize, bg, gamma, xpos, ypos, title)

        win.metafile(filename = "", width = 7, height = 7, pointsize = 12,
                family, restoreConsole = TRUE)

        win.print(width = 7, height = 7, pointsize = 12, printer = "",
                family, antialias, restoreConsole = TRUE)
```

