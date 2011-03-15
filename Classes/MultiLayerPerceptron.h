//
//  MultiLayerPerceptron.h
//  Neuron1
//
//  Created by user on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NeuralNetwork.h"

@interface MultiLayerPerceptron : NeuralNetwork {

}
-(MultiLayerPerceptron*) initWithNeuronsInLayers: (NSMutableArray*) neuronsInLayers;
-(void) createNetwork: (NSMutableArray*) neuronsInLayers; //andNeuronProperties

@end
