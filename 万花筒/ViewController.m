//
//  ViewController.m
//  万花筒
//
//  Created by 王奥东 on 16/11/11.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    vv.layer.cornerRadius = 10;
    button.layer.cornerRadius = 10;
    //CITriangleKaleidoscope 三角万花筒
    filter = [CIFilter filterWithName:@"CITriangleKaleidoscope"];
    [sizeSlider setupWithAttributes:filter.attributes forKey:@"inputSize"];
    [rotationSlider setupWithAttributes:filter.attributes forKey:@"inputRotation"];
    [decaySlider setupWithAttributes:filter.attributes forKey:@"inputDecay"];
    
    [filter setValue:[CIImage imageWithCGImage:imageView.image.CGImage] forKey:kCIInputImageKey];
    
    CGSize size = imageView.image.size;
    
    [filter setValue:[CIVector vectorWithX:size.width/2 Y:size.height/2] forKey:@"inputPoint"];
    imageRect  = CGRectMake(0, 0, size.width, size.height);
    
}


- (IBAction)show:(id)sender {

    //获取过滤器的值
    
    //fiter会自己去找到filter.inputKeys数组里对应的key名，而后修改其值
    //三个Slider中分别保存了自己所应修改的key名
    NSString *a1 = [NSString stringWithFormat:@"%f",sizeSlider.value];
    NSString *a2 = [NSString stringWithFormat:@"%f",rotationSlider.value];
    NSString *a3 = [NSString stringWithFormat:@"%f",decaySlider.value];
    [filter setValue:a1 forKey:sizeSlider.attributeKey];
    [filter setValue:a2 forKey:rotationSlider.attributeKey];
    [filter setValue:a3 forKey:decaySlider.attributeKey];
    

    CIImage *result = filter.outputImage;
    if (result) {
        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef cgImage = [context createCGImage:result fromRect:imageRect];
        imageView.image = [UIImage imageWithCGImage:cgImage];
        CGImageRelease(cgImage);
    }else {
        
        NSLog(@"warning: nil result");
    }
    
}










@end
