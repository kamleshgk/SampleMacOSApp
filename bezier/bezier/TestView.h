//
//  TestView.h
//  bezier
//
//  Created by KamyFC on 18/07/18.
//  Copyright © 2018 KamyFC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TestView : NSView
{
    NSImage *originalImage;
    NSBezierPath *freehandBezierPath;
}

@property (nonatomic) NSImage *originalImage;
@property (nonatomic) NSBezierPath *freehandBezierPath;

@end
