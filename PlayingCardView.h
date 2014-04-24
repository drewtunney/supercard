//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Drew Tunney on 4/24/14.
//  Copyright (c) 2014 drewtunney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

// this is our public class
// now we think, what do we need this view to do?

// the properties of our card
@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;

@end
