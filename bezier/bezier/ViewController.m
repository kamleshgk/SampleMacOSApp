//
//  ViewController.m
//  bezier
//
//  Created by KamyFC on 15/07/18.
//  Copyright © 2018 KamyFC. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"



@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    TestView *testView = (TestView *)self.view;
    NSImage *originalImage =self.imageView.image;
    testView.originalImage = originalImage;

    NSImage *exampleImage = [NSImage imageNamed:@"charger"];
    [self.imageView setImage:exampleImage];
    [self.imageView setImageScaling: NSImageScaleProportionallyUpOrDown];
    
    // Do any additional setup after loading the view.
    [self.view setNeedsDisplay:YES];
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

#pragma mark - Events

- (void)mouseDown:(NSEvent *)theEvent {
    
    id clickedObject = [self.view hitTest:[theEvent locationInWindow]];
    
    if ([clickedObject isKindOfClass:[NSImageView class]]) {
        
        NSPoint currentPoint    = [self.view convertPoint:[theEvent locationInWindow] fromView:nil];
        TestView *testView = (TestView *)self.view;
        [testView.freehandBezierPath moveToPoint:currentPoint];
        
        [self.view setNeedsDisplay:YES];
    }
}

- (void)mouseDragged:(NSEvent *)theEvent {
    id clickedObject = [self.view hitTest:[theEvent locationInWindow]];
    if ([clickedObject isKindOfClass:[NSImageView class]]) {
        
        NSPoint currentPoint    = [self.view convertPoint:[theEvent locationInWindow] fromView:nil];
        NSLog(@"NORMAL - x %0.0f, y %0.0f, width %0.0d, height %0.0d", currentPoint.x, currentPoint.y, 0,  0);

        CGRect nsRectFlippedY = CGRectMake(currentPoint.x , currentPoint.y,   0,  0);
        CGFloat flippedY = self.imageView.frame.size.height - NSMaxY(nsRectFlippedY);
        NSLog(@"FLIPPED - x %0.0f, y %0.0f, width %0.0d, height %0.0d", currentPoint.x, flippedY, 0,  0);
        
        TestView *testView = (TestView *)self.view;
        [testView.freehandBezierPath lineToPoint:currentPoint];
        
        [self.view setNeedsDisplay:YES];
    }
}

- (void)mouseUp:(NSEvent *)theEvent {
    id clickedObject = [self.view hitTest:[theEvent locationInWindow]];
    
    if ([clickedObject isKindOfClass:[NSImageView class]]) {
        
        NSPoint currentPoint    = [self.view convertPoint:[theEvent locationInWindow] fromView:nil];
        
        [self.view setNeedsDisplay:YES];
    }
}
@end
