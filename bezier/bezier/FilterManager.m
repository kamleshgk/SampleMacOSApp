//
//  FilterManager.m
//  Blur
//
//  Created by KamyFC on 15/07/18.
//  Copyright © 2018 Binyamin. All rights reserved.
//

#import "FilterManager.h"

@implementation FilterManager


-(CIImage *)getBlurredImage:(CIImage *)img withAmount:(float)intensity {
    
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIDiscBlur"];
    [blurFilter setValue:img forKey:kCIInputImageKey];
    [blurFilter setValue:@(intensity) forKey:@"inputRadius"];
    
    return blurFilter.outputImage; 
}

@end
