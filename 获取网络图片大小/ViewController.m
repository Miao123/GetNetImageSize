//
//  ViewController.m
//  获取网络图片大小
//
//  Created by 苗建浩 on 2017/6/9.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
#import "SDWebImage/UIImageView+WebCache.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"获取网络图片大小";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [headView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://smartpark.oss-cn-shanghai.aliyuncs.com/files/img/F6/3A/F63A21B53387A9C4D3FD50EF678AB3C5"]] placeholderImage:[UIImage imageNamed:@"111"]];
    [self.view addSubview:headView];
    
    
    UIImageView * imageView = [[UIImageView alloc] init];
    NSURL * url = [NSURL URLWithString:@"http://smartpark.oss-cn-shanghai.aliyuncs.com/files/img/F6/3A/F63A21B53387A9C4D3FD50EF678AB3C5"];
    [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"111"]];
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    //  判断是否有缓存
    [manager diskImageExistsForURL:url completion:^(BOOL isInCache) {
        UIImage * image;
        if (isInCache) {
            image = [[manager imageCache] imageFromDiskCacheForKey:url.absoluteString];
            NSLog(@"有缓存");
        }else{
            NSLog(@"没缓存");
            NSData *data = [NSData dataWithContentsOfURL:url];
            image = [UIImage imageWithData:data];
        }
        CGSize size = image.size;
        NSLog(@"image 宽%g  高%g  isInCache %d",size.width,size.height,isInCache);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
