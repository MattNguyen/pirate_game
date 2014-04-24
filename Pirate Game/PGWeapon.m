//
//  PGWeapon.m
//  Pirate Game
//
//  Created by Matthew Nguyen on 4/22/14.
//  Copyright (c) 2014 Matthew Nguyen. All rights reserved.
//

#import "PGWeapon.h"

@implementation PGWeapon
+(NSString *)classTypeAsString
{
    return @"weapon";
}

-(id)initFromTile:(PGTile *)tile
{
    return [self initWithName:tile.actionButtonTypeName andDamage:[tile.actionButtonTypeAmount integerValue]];
}

-(id)initWithName:(NSString *)name andDamage:(int)damage
{
    if ((self = [super init])) {
        _name = name;
        _damage = damage;
    }
    return self;
}

-(id)init
{
    return [self initWithName:@"Fists" andDamage:1];
}
@end
