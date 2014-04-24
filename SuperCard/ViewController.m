//
//  ViewController.m
//  SuperCard
//
//  Created by Drew Tunney on 4/24/14.
//  Copyright (c) 2014 drewtunney. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.playingCardView.suit = @"♥︎";
    self.playingCardView.rank = 6;
}


@end
