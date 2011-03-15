//
//  Layer.h
//  Neuron1
//
//  Created by user on 26.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Neuron.h"
@class NeuralNetwork;

@interface Layer : NSObject {
	NeuralNetwork *parentNetwork;
	NSMutableArray *neurons;
}
-(id)initWithLayerNeuronCount:(int) neuronsInLayers;
-(void) addNeuron: (Neuron*) neuron;
-(NSMutableArray*) neurons;
-(void) setParentalNetwork: (NeuralNetwork*) aNetwork;
-(void) calculate;
@end
