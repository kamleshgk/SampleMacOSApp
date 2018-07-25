//
//  NSImageUtils.m
//  Blur
//
//  Created by KamyFC on 15/07/18.
//  Copyright © 2018 Binyamin. All rights reserved.
//

#import "NSImageUtils.h"

@implementation NSImageUtils

- (NSImage *) resizeImageToNewSize:(NSImage *)sourceImage newSize:(NSSize)newSize
{
    // Report an error if the source isn't a valid image
    NSImage *smallImage = [[NSImage alloc] initWithSize: newSize];
    [smallImage lockFocus];
    [sourceImage setSize: newSize];
    [[NSGraphicsContext currentContext] setImageInterpolation:NSImageInterpolationHigh];
    [sourceImage drawAtPoint:NSZeroPoint fromRect:CGRectMake(0, 0, newSize.width, newSize.height) operation:NSCompositingOperationCopy fraction:1.0];
    [smallImage unlockFocus];
    return smallImage;
}

- (NSImage *) cropImageToSize:(NSImage *)sourceImage newSize:(NSSize)newSize fromPoint:(NSPoint) point
{
    CGImageSourceRef source;
    
    source = CGImageSourceCreateWithData((CFDataRef)[sourceImage TIFFRepresentation], NULL);
    CGImageRef imageRef =  CGImageSourceCreateImageAtIndex(source, 0, NULL);
    
    CGRect sizeToBe = CGRectMake(point.x, point.y, newSize.width, newSize.height);
    CGImageRef croppedImage = CGImageCreateWithImageInRect(imageRef, sizeToBe);
    NSImage *finalImage = [[NSImage alloc] initWithCGImage:croppedImage size:NSZeroSize];
    CFRelease(imageRef);
    CFRelease(croppedImage);
    
    return finalImage;
}

- (NSImage *) overlayImages:(NSImage *)backgroundImage overlayImage:(NSImage *)overlayImage
               overLayRect:(NSRect)overLayRect
{
    NSImage *newImage = [[NSImage alloc] initWithSize:[backgroundImage size]];
    [newImage lockFocus];
    
    CGRect newImageRect = CGRectZero;
    newImageRect.size = [newImage size];
    
    [backgroundImage drawInRect:newImageRect];
    [overlayImage drawInRect:overLayRect];
    
    [newImage unlockFocus];
 
    return newImage;
}

@end
