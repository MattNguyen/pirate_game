//
//  PGArmor.m
//  Pirate Game
//
//  Created by Matthew Nguyen on 4/22/14.
//  Copyright (c) 2014 Matthew Nguyen. All rights reserved.
//

#import "PGArmor.h"

@implementation PGArmor
+(NSString *)classTypeAsString
{
    return @"armor";
}

-(id)initFromTile:(PGTile *)tile
{
    return [self initWithName:tile.actionButtonTypeName andHealthBonus:[tile.actionButtonTypeAmount integerValue]];
}

-(id)initWithName:(NSString *)name andHealthBonus:(int)healthBonus
{
    if ((self = [super init])) {
        _name = name;
        _healthBonus = healthBonus;
    }
    return self;
}

-(id)init
{
    return [self initWithName:@"T-Shirt" andHealthBonus:0];
}

@end
