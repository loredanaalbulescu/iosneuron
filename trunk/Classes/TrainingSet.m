//
//  TrainingSet.m
//  Neuron1
//
//  Created by user on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TrainingSet.h"


@implementation TrainingSet
-(TrainingSet*) init
{
	self = [super init];
	if (self)
	{
		elements = [[NSMutableArray alloc] init];
	}
	return self;
}

-(void) addElement: (TrainingElement*) anElement
{
	//trow different exceptions (if size is not equal)
	[elements addObject:anElement];
}

-(NSEnumerator*) enumerator
{
	return [elements objectEnumerator];
}

-(void) dealloc
{
	[elements release];
	[super dealloc];
}
@end
