# QCStitchingImage
仿微信群九宫格头像
使用Layer实现, 比UIImageView的性能好
如果您使用SDWebImage下载网络图片,需添加额外支持文件
SDWebImage不支持直接对Layer的Content进行图片设置
需添加对SDWebImage的分类文件

使用示例:

    QCStitchingImage *stitchingImage = [QCStitchingImage stitchingWithFrame:CGRectMake(50, 50, 150, 150) imageArray: networkArray];
    [self.view addSubview:stitchingImage];
使用


 ![image](https://github.com/Joe0708/QCStitchingImage/blob/master/Demo.gif)
