//
//  PGTile.h
//  Pirate Game
//
//  Created by Matthew Nguyen on 3/21/14.
//  Copyright (c) 2014 Matthew Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PGWeapon;
@class PGArmor;

@interface PGTile : NSObject
@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) NSString *backgroundImageName;
@property (nonatomic, strong) NSString *actionButtonName;
@property (nonatomic, strong) NSString *actionButtonType;
@property (nonatomic, strong) NSString *actionButtonTypeName;
@property (nonatomic, strong) NSString *actionButtonTypeAmount;
@property (nonatomic, strong) PGWeapon *weapon;
@property (nonatomic, strong) PGArmor *armor;
@property (nonatomic, strong) NSString *healthEffect;

- (id)initWithPropertiesDictionary:(NSDictionary *)propertiesDictionary;
@end
