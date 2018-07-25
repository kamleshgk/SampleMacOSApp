//
//  TestView.m
//  bezier
//
//  Created by KamyFC on 18/07/18.
//  Copyright © 2018 KamyFC. All rights reserved.
//

#import "TestView.h"
#import "FilterManager.h"
#import "NSImageUtils.h"

@implementation TestView

@synthesize originalImage, freehandBezierPath;

#pragma mark - Redrawing

- (void)awakeFromNib {
    freehandBezierPath = [NSBezierPath bezierPath];
    [freehandBezierPath setLineCapStyle:NSRoundLineCapStyle];
    [freehandBezierPath setLineJoinStyle:NSRoundLineJoinStyle];
    [freehandBezierPath setLineWidth:50];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [[NSColor whiteColor] setStroke];
    [freehandBezierPath stroke];
    // Drawing code here.
    /*NSBezierPath * path = [NSBezierPath bezierPath];
    [path setLineWidth: 4];

    NSPoint startPoint = {  21, 21 };
    NSPoint endPoint   = { 128,128 };
    
    [path  moveToPoint: startPoint];
    
    [path curveToPoint: endPoint
         controlPoint1: NSMakePoint ( 128, 21 )
         controlPoint2: NSMakePoint (  21,128 )];
    
    [[NSColor whiteColor] set];
    [path fill];
    
    [[NSColor grayColor] set];
    [path stroke];*/
}



- (BOOL)acceptsFirstResponder {
    return YES;
}

@end
