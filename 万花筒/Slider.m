//
//  Slider.m
//  万花筒
//
//  Created by 王奥东 on 16/11/11.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "Slider.h"

@implementation Slider

-(void)setupWithAttributes:(NSDictionary *)attributes forKey:(NSString *)attrKey{
    NSDictionary *attr = attributes[attrKey];
    self.minimumValue = [attr[kCIAttributeSliderMin] floatValue];//最小值
    self.maximumValue = [attr[kCIAttributeSliderMax] floatValue];//最大值
    self.value = [attr[kCIAttributeDefault] floatValue];//当前值
    self.attributeKey = attrKey;
}

@end
