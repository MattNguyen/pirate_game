//
//  PGCharacter.m
//  Pirate Game
//
//  Created by Matthew Nguyen on 4/22/14.
//  Copyright (c) 2014 Matthew Nguyen. All rights reserved.
//

#import "PGCharacter.h"
#import "PGWeapon.h"
#import "PGArmor.h"

@implementation PGCharacter

-(id)initWithWeapon:(PGWeapon *)weapon andArmor:(PGArmor *)armor
{
    if ((self = [super init])) {
        _weapon = weapon;
        _armor = armor;
        _healthAmount = 100 + [self.armor healthBonus];
        _damageAmount = [self.weapon damage];
    }
    return self;
}

-(id)init
{
    return [self initWithWeapon:[[PGWeapon alloc] init] andArmor:[[PGArmor alloc] init]];
}

-(void)updateFromTile:(PGTile *)tile
{
    int previousHealthBonus = self.armor.healthBonus;

    if ([tile.actionButtonType isEqual:@"healthEffect"]) {
        // Health amount should not exceed 100 after applying healthEffect
        int newHealthAmountTotal = self.healthAmount + [tile.actionButtonTypeAmount integerValue];
        // TODO Fix this
        if (newHealthAmountTotal > 100) {
            self.healthAmount = 100;
        } else {
            self.healthAmount = newHealthAmountTotal;
        }
    } else {
        NSString *classAsString = [NSString stringWithFormat:@"PG%@", [tile.actionButtonType capitalizedString]];
        
        [self setValue:[[NSClassFromString(classAsString) alloc] initFromTile:tile] forKey:tile.actionButtonType];
        
        if ([tile.actionButtonType isEqual:@"weapon"]) {
            _damageAmount = [self.weapon damage];
        } else if ([tile.actionButtonType isEqual:@"armor"]) {
            _healthAmount = _healthAmount - previousHealthBonus + tile.armor.healthBonus;
        }
    }
    
}
@end
