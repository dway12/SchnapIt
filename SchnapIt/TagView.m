//
//  TagView.m
//  SchnapIt
//
//  Created by David Way on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TagView.h"
#import "Constants.h"

@implementation TagView

@synthesize  dictionaryBox;


- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];//colorWithRed:1 green:1 blue:1 alpha:0.6]];
        selectedBox=0;
        move=NO;
        size=NO;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //CGContextSetRGBStrokeColor(context, 255, 0, 0, 1);
    CGContextSetLineWidth(context, LINEWIDTH);
    //NSLog(@"El rectangulo seleccionado es: %d",selectedBox);
    //NSLog(@"La cuenta es: %d",[dictionaryBox count]);
    
    for (int i= 0; i<[dictionaryBox count]; i++) {
        if (i==selectedBox) {
            continue;
        }
        [self drawBox:context:[dictionaryBox objectForKey:[NSString stringWithFormat:@"%d",i]]];
    }
    if (selectedBox!=-1) {
        [self drawSelectedBox:context:[dictionaryBox objectForKey:[NSString stringWithFormat:@"%d",selectedBox]]];
    }
    
    UIGraphicsEndImageContext();
    
    
}



-(void) drawSelectedBox:(CGContextRef ) context:(Box *) box1{
    
    CGPoint upperRight = CGPointMake([box1 lowerRight].x, [box1 upperLeft].y);
    CGPoint lowerLeft = CGPointMake([box1 upperLeft].x, [box1 lowerRight].y);
    CGRect rect = CGRectMake([box1 upperLeft].x, [box1 upperLeft].y, [box1 lowerRight].x-[box1 upperLeft].x, [box1 lowerRight].y-[box1 upperLeft].y);
    
    //[[UIColor clearColor] setFill];
    //UIRectFill( rect );
    CGContextSetStrokeColorWithColor(context, box1.color.CGColor);
    //CGContextBeginPath(context);
    CGContextStrokeRect(context, rect );
    
    CGContextStrokeEllipseInRect(context, CGRectMake([box1 upperLeft].x-LINEWIDTH, [box1 upperLeft].y-LINEWIDTH, 2*LINEWIDTH, 2*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake([box1 lowerRight].x-LINEWIDTH, [box1 lowerRight].y-LINEWIDTH, 2*LINEWIDTH, 2*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake(upperRight.x-LINEWIDTH, upperRight.y-LINEWIDTH, 2*LINEWIDTH, 2*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake(lowerLeft.x-LINEWIDTH, lowerLeft.y-LINEWIDTH, 2*LINEWIDTH, 2*LINEWIDTH));
    
    CGContextSetRGBStrokeColor(context, 255, 255, 255, 1);
    CGContextSetLineWidth(context, 1);
    CGContextStrokeEllipseInRect(context, CGRectMake([box1 upperLeft].x-1.5*LINEWIDTH, [box1 upperLeft].y-1.5*LINEWIDTH, 3*LINEWIDTH, 3*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake([box1 lowerRight].x-1.5*LINEWIDTH, [box1 lowerRight].y-1.5*LINEWIDTH, 3*LINEWIDTH, 3*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake(upperRight.x-1.5*LINEWIDTH, upperRight.y-1.5*LINEWIDTH, 3*LINEWIDTH, 3*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake(lowerLeft.x-1.5*LINEWIDTH, lowerLeft.y-1.5*LINEWIDTH, 3*LINEWIDTH, 3*LINEWIDTH));
    
    
    
    
    
    
    
    
}

-(void) drawBox:(CGContextRef ) context:(Box *) box1{
    
    //CGPoint upperRight = CGPointMake(, [box1 upperLeft].y);
    //CGPoint lowerLeft = CGPointMake([box1 upperLeft].x, [box1 lowerRight].y);
    
    
    CGContextSetStrokeColorWithColor(context, box1.color.CGColor);
    
    CGContextBeginPath(context);
    CGContextAddRect(context, CGRectMake([box1 upperLeft].x, [box1 upperLeft].y, [box1 lowerRight].x-[box1 upperLeft].x, [box1 lowerRight].y-[box1 upperLeft].y) );
    /*CGContextMoveToPoint(context, [box1 upperLeft].x, [box1 upperLeft].y);
     CGContextAddLineToPoint(context, upperRight.x, upperRight.y);
     CGContextAddLineToPoint(context, [box1 lowerRight].x, [box1 lowerRight].y);
     CGContextAddLineToPoint(context, lowerLeft.x, lowerLeft.y);
     CGContextAddLineToPoint(context, [box1 upperLeft].x, [box1 upperLeft].y);*/
    CGContextClosePath(context);
    CGContextStrokePath(context);
    
    
    
}
-(void) setSelectedBox:(int) i{
    selectedBox = i;
}


-(int) SelectedBox{
    return selectedBox;
}


-(void) dealloc{
    [dictionaryBox release];
    [super dealloc];
    
}

@end
