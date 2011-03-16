//
//  TrainingElement.m
//  Neuron1
//
//  Created by user on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TrainingElement.h"


@implementation TrainingElement
-(TrainingElement*) init
{
	self = [super init];
	if (self)
	{
		input = [[NSMutableArray alloc] init];
	}
	return self;
}

-(TrainingElement*) initWithInput: (NSMutableArray*) anInput
{
	self = [self init];
	if (self)
	{
		input=anInput;
	}
	return self;
}

-(NSMutableArray*) input
{
	return input;
}

-(void) dealloc
{
	[input release];
	[super dealloc];
}
@end
