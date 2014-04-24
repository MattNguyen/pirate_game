//
//  PGBoard.h
//  Pirate Game
//
//  Created by Matthew Nguyen on 3/21/14.
//  Copyright (c) 2014 Matthew Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGTile.h"

@interface PGBoard : NSObject
@property (nonatomic, strong) NSMutableArray *layout;
@property (nonatomic) int width;
@property (nonatomic) int height;

-(id)initLayoutWithWidth:(int)width andHeight:(int)height;
@end
