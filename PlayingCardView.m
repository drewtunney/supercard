//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Drew Tunney on 4/24/14.
//  Copyright (c) 2014 drewtunney. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

#pragma mark - Properties

// here we are going to implement our public API in .h
// once we set up this logic, we need to add a class to the view in the storyboard. We click on the card, and add the class in the identity inspector


- (void)setSuit:(NSString *)suit
{
    _suit = suit;
    // all setters are calling setNeedsDisplay
    // if anything changes, we are telling the system it needs to be redrawn
    [self setNeedsDisplay];
}

- (void)setRank:(NSUInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}

- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

#pragma mark - Drawing

#define CORNER_FRONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CORNER_FRONT_STANDARD_HEIGHT;}
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }
- (CGFloat)cornerOffset { return [self cornerRadius] / 3.0; }


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // self.bounds = fill up the area I have
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    
    // don't want to draw outside of the rect
    [roundedRect addClip];
    
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    [self drawCorners];
    
}

- (NSString *)rankAsString
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"][self.rank];
}

- (void)drawCorners
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    // this font will come in on the scaled font depending on the users settings
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", [self rankAsString], self.suit] attributes:@ { NSFontAttributeName : cornerFont, NSParagraphStyleAttributeName : paragraphStyle }];
    
    CGRect textBounds;
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBounds.size = [cornerText size];
    [cornerText drawInRect:textBounds];
    
}

#pragma mark - Initialization

- (void)setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    // if the phone is turned, probably not important
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setup];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@end
