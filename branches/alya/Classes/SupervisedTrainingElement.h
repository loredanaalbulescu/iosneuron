//
//  SupervisedTrainigElement.h
//  Neuron1
//
//  Created by user on 12.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import	"TrainingElement.h"

@interface SupervisedTrainingElement : TrainingElement 
{
	NSMutableArray *desiredOutput;
}
-(SupervisedTrainingElement*) initWithInput:(NSMutableArray *)anInput andDesiredOutput: (NSMutableArray *)anOutput;
-(NSMutableArray*) desiredOutput;
@end
