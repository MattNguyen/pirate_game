//
//  PGArmor.h
//  Pirate Game
//
//  Created by Matthew Nguyen on 4/22/14.
//  Copyright (c) 2014 Matthew Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGTile.h"

@interface PGArmor : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic) int healthBonus;

+(NSString *)classTypeAsString;
-(id)initFromTile:(PGTile *)tile;

@end
