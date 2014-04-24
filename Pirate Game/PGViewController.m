//
//  PGViewController.m
//  Pirate Game
//
//  Created by Matthew Nguyen on 3/21/14.
//  Copyright (c) 2014 Matthew Nguyen. All rights reserved.
//

#import "PGViewController.h"
#import "PGBoard.h"
#import "PGCharacter.h"
#import "PGWeapon.h"
#import "PGArmor.h"

@interface PGViewController ()

@end

@implementation PGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _board = [[PGBoard alloc] init];
    _currentPoint = CGPointMake(0, 0);
    _currentTile = [self tileAtPoint:self.currentPoint];
    _character = [[PGCharacter alloc] init];
    _boss = [[PGBoss alloc] init];
    
    [self updateViewWithTileAttributes:self.currentTile];
}

- (void)updateViewWithTileAttributes:(PGTile *)tile
{
    // Update character stats
    self.healthAmount.text = [NSString stringWithFormat:@"%i", [self.character healthAmount]];
    self.damageAmount.text = [NSString stringWithFormat:@"%i", [self.character damageAmount]];
    self.weaponName.text = [NSString stringWithFormat:@"%@", [[self.character weapon] name]];
    self.armorName.text = [NSString stringWithFormat:@"%@", [[self.character armor] name]];
    
    // Set background image
    [self.backgroundImage setImage:[UIImage imageNamed:self.currentTile.backgroundImageName]];
    
    // Set story description
    self.storyDescription.text = self.currentTile.story;
    
    // Set button text
    [self.actionButton setTitle:self.currentTile.actionButtonName forState:UIControlStateNormal];
    
    // Hide buttons
    NSArray *keys = [[self dictionaryOfAdjacentPoints] allKeys];
    for (NSString *key in keys) {
        UIButton *button = [self valueForKey:key];

        if ([[self dictionaryOfAdjacentPoints] objectForKey:key] == [NSNull null]) {
            button.hidden = YES;
        } else {
            // Associate active buttons with tile   coordinates
            // we have the key which is the name of the button. create method that uses the key as part of the name and call that in a selector. changeViewToNorthButtonCoordinate
            button.hidden = NO;
            
            NSString *methodName = [[NSString alloc] initWithFormat:@"changeViewTo%@Coordinate", [NSString stringWithFormat:@"%@%@", [[key substringToIndex:1] uppercaseString], [key substringFromIndex:1]]];
            
            if ([self respondsToSelector:NSSelectorFromString(methodName)]) {
                [button addTarget:self action:NSSelectorFromString(methodName) forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
}

- (void)changeViewToCoordinate:(CGPoint)coordinate
{
    self.currentPoint = coordinate;
    self.currentTile = [self tileAtPoint:self.currentPoint];
    PGTile *tile = [self tileAtPoint:self.currentPoint];

    [self updateViewWithTileAttributes:tile];
}

- (void)changeViewToNorthButtonCoordinate
{
    [self changeViewToCoordinate:[self northCoordinate]];
}

- (void)changeViewToEastButtonCoordinate
{
    [self changeViewToCoordinate:[self eastCoordinate]];
}

- (void)changeViewToSouthButtonCoordinate
{
    [self changeViewToCoordinate:[self southCoordinate]];
}

- (void)changeViewToWestButtonCoordinate
{
    [self changeViewToCoordinate:[self westCoordinate]];
}

-(CGPoint)northCoordinate
{
    return CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
}

-(CGPoint)southCoordinate
{
    return CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
}

-(CGPoint)eastCoordinate
{
    return CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
}

-(CGPoint)westCoordinate
{
    return CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
}

- (NSMutableDictionary *)dictionaryOfAdjacentPoints
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];

    // North
    if ([self isCGPointValid:[self northCoordinate]]) {
        [result setValue:[NSValue valueWithCGPoint:[self northCoordinate]] forKey:@"northButton"];
    } else {
        [result setValue:[NSNull null] forKey:@"northButton"];
    }
    
    // East
    if ([self isCGPointValid:[self eastCoordinate]]) {
        [result setValue:[NSValue valueWithCGPoint:[self eastCoordinate]] forKey:@"eastButton"];
    } else {
        [result setValue:[NSNull null] forKey:@"eastButton"];
    }
    
    // South
    if ([self isCGPointValid:[self southCoordinate]]) {
        [result setValue:[NSValue valueWithCGPoint:[self southCoordinate]] forKey:@"southButton"];
    } else {
        [result setValue:[NSNull null] forKey:@"southButton"];
    }
    
    // West
    if ([self isCGPointValid:[self westCoordinate]]) {
        [result setValue:[NSValue valueWithCGPoint:[self westCoordinate]] forKey:@"westButton"];
    } else {
        [result setValue:[NSNull null] forKey:@"westButton"];
    }
    
    return result;
}

- (BOOL)isCGPointValid:(CGPoint)point
{
    if (point.x < 0) {
        return NO;
    } else if (point.x > self.board.width - 1) {
        return NO;
    } else if (point.y < 0) {
        return NO;
    } else if (point.y > self.board.height - 1) {
        return NO;
    } else {
        return YES;
    }
}

- (PGTile *)tileAtPoint:(CGPoint)point
{
    NSMutableArray *column = [self.board.layout objectAtIndex:point.x];
    PGTile *tile = [column objectAtIndex:point.y];
    return tile;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    [self.character updateFromTile:self.currentTile];
    [self updateViewWithTileAttributes:self.currentTile];
    if (self.character.healthAmount <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died restart the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        [self reset];
    }
}

- (void)reset
{
    _currentPoint = CGPointMake(0, 0);
    _currentTile = [self tileAtPoint:self.currentPoint];
    _character = [[PGCharacter alloc] init];
    _boss = [[PGBoss alloc] init];
    
    [self updateViewWithTileAttributes:self.currentTile];
}
@end