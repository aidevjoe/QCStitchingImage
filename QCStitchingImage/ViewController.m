//
//  ViewController.m
//  layer
//
//  Created by Joe on 16/8/10.
//  Copyright © 2016年 Joe. All rights reserved.
//

#define RANDOM_COLOR [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]
#import "ViewController.h"
#import "QCStitchingImage.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        NSArray * networkArray = @[
                         @"http://wx.qlogo.cn/mmopen/SEQ2uumQjyuWXqk0HmBcJOUTyvg4WwRBkg3X3h2U3ksZvCc9wPVz7wQ5WQlUb2v2PhnVyUAPcQXibMZyMDc1HzQ/0",
                         @"http://wx.qlogo.cn/mmopen/9C2tmO90VybnuU61jtDN9PSBu5PeqncYlS5Bkxv7epCzmws0SmYqDBDzLVkoH5hC168dBcVNfIaZ4tcqkwG6hP61ciavwhy1a/0",
                         @"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScwiaWmlPEnnuS4BjFkPB81oMLH0I3M9BVe16R6icE0PBY0OuqBGl9yKHn1NJbdqPnfjuPv65LEGd0ChH6BicURrCw/0",
                         @"http://wx.qlogo.cn/mmopen/5MbjZeuCUzzP1DUSvM1v0nBRJxWm7GC3noGlfzFP8t6MqmkoeKzcUPCiasIibm5n6xeWXmTLma9yl4XvElA0ibdFeuoTuhLkibFib/0",
                         @"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZdfDXbzakpicxSGcUQOoGZvNLe28vsY6vMb3lVMOFKSYB1IeOLIEmThyiaIDvC1PeXiaT47V68LJrHm/0",
                         @"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZXgdZXC2ibe0H4ic5eDmzGBW8micqpAgvcBbfX3punhgSNpcIE9RJJd0EC48VSvs3B78rd05ORHkKGW/0",
                         @"http://wx.qlogo.cn/mmopen/EnbZmnxAsQj5R9UcnJfuGc6YHGibPslyibWiciaLtDJlogXgmWiaqFBb1Mwoq9BjXc3SeIcAUovIibpg6532I5bicBHYGol5VuCg5TK/0",
                         @"http://wx.qlogo.cn/mmopen/fiaTE6Cian9ibdmGcOXmg8gZDtd6J42rB2OpkNjlX7BNBHCPePJfcaUhicTm2ibm84CNO67tVIKltjImGaqvXyH9CzcVhvUw7HELA/0",
                         @"http://wx.qlogo.cn/mmopen/ajNVdqHZLLAJYLkTTAFVXQrcbxNTPBz8yicBw7oDQtoRyFyQvqc3Mo9k2zX8U8nB9KkNLicIBPzenSEER5jP3azA/0"];

    
    QCStitchingImage *stitchingImage = [QCStitchingImage stitchingWithFrame:CGRectMake(50, 50, 150, 150) imageArray: networkArray];
    [self.view addSubview:stitchingImage];
    
    
    NSArray *locationArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    QCStitchingImage *stitchingImage2 = [QCStitchingImage stitchingWithFrame:CGRectMake(50, 210, 150, 150) imageArray:locationArray];
    [self.view addSubview:stitchingImage2];
}




@end
