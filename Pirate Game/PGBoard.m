//
//  PGBoard.m
//  Pirate Game
//
//  Created by Matthew Nguyen on 3/21/14.
//  Copyright (c) 2014 Matthew Nguyen. All rights reserved.
//

#import "PGBoard.h"
#import "PGTile.h"

@implementation PGBoard
-(id)initLayoutWithWidth:(int)width andHeight:(int)height
{
    if ((self = [super init])) {
        _width = width;
        _height = height;
        _layout = [[NSMutableArray alloc] init];
        
        NSArray *tileProperties = @[
          @{
              @"backgroundImageName": @"PirateStart.jpg",
              @"story": @"Alright, lets get going. Might as well put some armor on you.",
              @"actionButtonName": @"Pick up basic armor",
              @"actionButtonType": @"armor",
              @"actionButtonTypeName": @"Basic armor",
              @"actionButtonTypeAmount": @"5"
          },
          @{
              @"backgroundImageName": @"PirateBlacksmith.jpeg",
              @"story": @"Here's a dude that will hook you up with a sword",
              @"actionButtonName": @"Take sword",
              @"actionButtonType": @"weapon",
              @"actionButtonTypeName": @"the ripper",
              @"actionButtonTypeAmount": @"20"
          },
          @{
              @"backgroundImageName": @"PirateFriendlyDock.jpg",
              @"story": @"Chill out with the homies",
              @"actionButtonName": @"Rest",
              @"actionButtonType": @"healthEffect",
              @"actionButtonTypeName": [NSNull null],
              @"actionButtonTypeAmount": @"20"

          },
          @{
              @"backgroundImageName": @"PirateOctopusAttack.jpg",
              @"story": @"It's a fucking octopus!",
              @"actionButtonName": @"Kill the bitch!",
              @"actionButtonType": @"healthEffect",
              @"actionButtonTypeName": [NSNull null],
              @"actionButtonTypeAmount": @"-10"
          },
          @{
              @"backgroundImageName": @"PirateParrot.jpg",
              @"story": @"Let's train this bird to kill",
              @"actionButtonName": @"Train bird to kill",
              @"actionButtonType": @"weapon",
              @"actionButtonTypeName": @"Killer Parrot",
              @"actionButtonTypeAmount": @"15"
          },
          @{
              @"backgroundImageName": @"PirateAttack.jpg",
              @"story": @"PIRATE Attack!!!!",
              @"actionButtonName": @"Run away",
              @"actionButtonType": @"healthEffect",
              @"actionButtonTypeName": [NSNull null],
              @"actionButtonTypeAmount": @"-20"
          },
          @{
              @"backgroundImageName": @"PiratePlank.jpg",
              @"story": @"You idiot! You got captured",
              @"actionButtonName": @"Swim away!",
              @"actionButtonType": @"healthEffect",
              @"actionButtonTypeName": [NSNull null],
              @"actionButtonTypeAmount": @"-20"
          },
          @{
              @"backgroundImageName": @"PirateShipBattle.jpeg",
              @"story": @"Take down the other ship!",
              @"actionButtonName": @"Fire cannons!",
              @"actionButtonType": @"healthEffect",
              @"actionButtonTypeName": [NSNull null],
              @"actionButtonTypeAmount": @"-10"
          },
          @{
              @"backgroundImageName": @"PirateTreasure.jpeg",
              @"story": @"Ca$h Money! We can afford health care!",
              @"actionButtonName": @"Take gold and get some meds",
              @"actionButtonType": @"healthEffect",
              @"actionButtonTypeName": [NSNull null],
              @"actionButtonTypeAmount": @"10"
          },
          @{
              @"backgroundImageName": @"PirateTreasurer2.jpeg",
              @"story": @"You found armor!",
              @"actionButtonName": @"Take armor",
              @"actionButtonType": @"armor",
              @"actionButtonTypeName": @"Some Sweet Armor",
              @"actionButtonTypeAmount": @"20"
          },
          @{
              @"backgroundImageName": @"PirateWeapons.jpeg",
              @"story": @"Found some sweet guns!",
              @"actionButtonName": @"Take rifle",
              @"actionButtonType": @"weapon",
              @"actionButtonTypeName": @"A Sweet Rifle",
              @"actionButtonTypeAmount": @"30"
          },
          @{
              @"backgroundImageName": @"PirateBoss.jpeg",
              @"story": @"description",
              @"actionButtonName": @"Fight!",
              @"actionButtonType": @"healthEffect",
              @"actionButtonTypeName": [NSNull null],
              @"actionButtonTypeAmount": @"-15"
          },
        ];
        
        int tileIndex = 0;
    
        // Create array of columns

        for (int w = 0; w < width; w++) {
            NSMutableArray *column = [[NSMutableArray alloc] init];

            // Create tiles within columns
            for (int h = 0; h < height; h++) {
                PGTile *tile = [[PGTile alloc] initWithPropertiesDictionary:[tileProperties objectAtIndex:tileIndex]];
                [column addObject:tile];
                
                tileIndex += 1;
            }
            
            [self.layout addObject:column];
        }
    }
    
    return self;
}

-(id)init
{
    return ([self initLayoutWithWidth:4 andHeight:3]);
}

@end
