//
//  OOOPresonList.m
//  NSUndoManager
//
//  Created by 大森 智史 on 2012/09/23.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOPresonList.h"

@implementation OOOPresonList
//増加
-(void)addATruck {
	i += 1;
	[[undoManager prepareWithInvocationTarget:self] removeATruck];
	[undoManager setActionName:@"Add A Truck"];
	//[self updateTitle];
    
    NSLog(@"%d",i);
}

//減少
-(void)removeATruck {
	i -= 1;
	[[undoManager prepareWithInvocationTarget:self] addATruck];
    NSLog(@"%d",i);
	//[self updateTitle];
}

- (void)addPersons:(NSArray*)persons
{
    [self addATruck];
}
- (void)removePersons:(NSArray*)persons
{
    [self removeATruck];
}

- (void)initialize {
	undoManager = [[NSUndoManager alloc] init];
}

@end
