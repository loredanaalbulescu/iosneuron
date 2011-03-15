//
//  SupervisedTrainigElement.m
//  Neuron1
//
//  Created by user on 12.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SupervisedTrainingElement.h"


@implementation SupervisedTrainingElement

//???i do not like how it is here now with init of SupervisedTrainigElement
//-(SupervisedTrainigElement*) init
//{
//	self = [super init];
//	if (self)
//	{
//		desiredOutput = [[NSMutableArray alloc] init];
//	}
//	return self;
//}

-(SupervisedTrainingElement*) initWithInput:(NSMutableArray *)anInput andDesiredOutput: (NSMutableArray *)anOutput
{
	self = (SupervisedTrainingElement*)[super initWithInput:anInput];
	if (self)
	{
		desiredOutput = [[NSMutableArray alloc] init];
		desiredOutput = anOutput;
	}
	return self;
}

-(NSMutableArray*) desiredOutput
{
	return desiredOutput;
}

-(void) dealloc
{
	[desiredOutput release];
	[super dealloc];
}
@end
