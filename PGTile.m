//
//  PGTile.m
//  Pirate Game
//
//  Created by Matthew Nguyen on 3/21/14.
//  Copyright (c) 2014 Matthew Nguyen. All rights reserved.
//

#import "PGTile.h"
#import "PGArmor.h"
#import "PGWeapon.h"

@implementation PGTile

-(id)initWithPropertiesDictionary:(NSDictionary *)propertiesDictionary
{
    if ((self = [super init])) {
        _story = nil;
        _backgroundImageName = nil;
        _actionButtonName = nil;
        
        NSArray *keys = [propertiesDictionary allKeys];

        for (NSString *key in keys) {
            [self setValue:[propertiesDictionary objectForKey:key] forKey:key];
        }
        
        // Assign appropriate object to property
        NSString *classAsString = [NSString stringWithFormat:@"PG%@", [self.actionButtonType capitalizedString]];
        id class = [[NSClassFromString(classAsString) alloc] initFromTile:self];
        [self setValue:class forKey:self.actionButtonType];

    }
    return self;
}
@end
