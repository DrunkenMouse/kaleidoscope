//
//  ViewController.h
//  万花筒
//
//  Created by 王奥东 on 16/11/11.
//  Copyright © 2016年 王奥东. All rights reserved.
//  参考： 实战宝典 进阶篇

#import <UIKit/UIKit.h>
#import "Slider.h"

@interface ViewController : UIViewController {
    CIFilter *filter;
    CGRect imageRect;
    
    IBOutlet UIImageView *imageView;
    
    IBOutlet Slider *sizeSlider;
  
    IBOutlet Slider *rotationSlider;
    
    IBOutlet Slider *decaySlider;
    
    IBOutlet UIView *vv;
    
    IBOutlet UIButton *button;
    
}

- (IBAction)show:(id)sender;

@end
