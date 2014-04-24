//
//  PGViewController.h
//  Pirate Game
//
//  Created by Matthew Nguyen on 3/21/14.
//  Copyright (c) 2014 Matthew Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGBoard.h"
#import "PGTile.h"
#import "PGCharacter.h"
#import "PGBoss.h"

@interface PGViewController : UIViewController
@property (nonatomic) CGPoint currentPoint;
@property (nonatomic, strong) PGTile *currentTile;
@property (nonatomic, strong) PGBoard *board;
@property (nonatomic, strong) PGCharacter *character;
@property (nonatomic, strong) PGBoss *boss;

@property (strong, nonatomic) IBOutlet UILabel *healthAmount;
@property (strong, nonatomic) IBOutlet UILabel *damageAmount;
@property (strong, nonatomic) IBOutlet UILabel *weaponName;
@property (strong, nonatomic) IBOutlet UILabel *armorName;
@property (strong, nonatomic) IBOutlet UILabel *storyDescription;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;

@property (strong, nonatomic) IBOutlet UIButton *actionButton;

- (IBAction)actionButtonPressed:(UIButton *)sender;


- (void)changeViewToNorthButtonCoordinate;
- (void)changeViewToEastButtonCoordinate;
- (void)changeViewToSouthButtonCoordinate;
- (void)changeViewToWestButtonCoordinate;

- (PGTile *)tileAtPoint:(CGPoint)point;

@end
