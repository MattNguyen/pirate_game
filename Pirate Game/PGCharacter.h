//
//  PGCharacter.h
//  Pirate Game
//
//  Created by Matthew Nguyen on 4/22/14.
//  Copyright (c) 2014 Matthew Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGTile.h"
@class PGWeapon;
@class PGArmor;

@interface PGCharacter : NSObject
@property (nonatomic) int healthAmount;
@property (nonatomic) int damageAmount;
@property (nonatomic, strong) PGWeapon *weapon;
@property (nonatomic, strong) PGArmor *armor;

-(void)updateFromTile:(PGTile *)tile;
@end