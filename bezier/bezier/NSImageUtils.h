//
//  NSImageUtils.h
//  Blur
//
//  Created by KamyFC on 15/07/18.
//  Copyright © 2018 Binyamin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface NSImageUtils : NSObject

- (NSImage *) resizeImageToNewSize:(NSImage *)sourceImage newSize:(NSSize)newSize;
- (NSImage *) cropImageToSize:(NSImage *)sourceImage newSize:(NSSize)newSize fromPoint:(NSPoint) point;
- (NSImage *) overlayImages:(NSImage *)backgroundImage overlayImage:(NSImage *)overlayImage
                                                       overLayRect:(NSRect)overLayRect;
@end
