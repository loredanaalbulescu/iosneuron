//
//  BackPropagation.h
//  Neuron1
//
//  Created by user on 11.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LearningRule.h"
#import "Sigmoid.h"
@class NeuralNetwork;
@class Neuron;

@interface BackPropagation : LearningRule 
{
}
-(void) adjustOutputNeurons: (NSMutableArray*) patternError;
-(void) adjustHiddenLayers;
-(void) updateNeuronWeights: (Neuron*) aNeuron;
-(double) calculateDelta: (Neuron*) aNeuron;
@end
