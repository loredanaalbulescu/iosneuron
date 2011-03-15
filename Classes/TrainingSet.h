//
//  TrainingSet.h
//  Neuron1
//
//  Created by user on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrainingElement.h"
#import "SupervisedTrainingElement.h"

@interface TrainingSet : NSObject
{
	//a vector of trainingElements
	NSMutableArray *elements;
	//string label
	//int inputVectorSize
	//int outputVectorSize
	//string filePath
}

-(TrainingSet*) initWithLabel: (NSString*) l;
//init with inputVectorSize
//init with outputVectorSize
-(void) addElement: (TrainingElement*) anElement; //vectorSizeMismatchException
-(void) removeElementAt: (int) index;
//enumeration?
-(NSEnumerator*) enumerator; 
-(NSMutableArray*) trainingElements;
-(TrainingElement*) elementAt: (int) index;
//clear
//isEmpty
//size
//getLabel
//setLabel
//getFilePath
//setFilePath
//save the training set to the filepath
//load

@end
