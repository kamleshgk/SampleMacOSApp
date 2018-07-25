//
//  FilterManager.h
//  Blur
//
//  Created by KamyFC on 15/07/18.
//  Copyright © 2018 Binyamin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreImage/CoreImage.h>
#import <QuartzCore/QuartzCore.h>

@interface FilterManager : NSObject
{
    
    
}

-(CIImage *)getBlurredImage:(CIImage *)img withAmount:(float)intensity;


@end

