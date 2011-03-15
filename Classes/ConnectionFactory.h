//
//  ConnectionFactory.h
//  Neuron1
//
//  Created by user on 01.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Connection.h"
#import "Layer.h"

@interface ConnectionFactory : NSObject {
	
}
+(void) createConnectionFromNeuron: (Neuron*) neuronFrom toNeuron: (Neuron*) neuronTo;
+(void) fullConnectPrevLayer: (Layer*) fromlayer andThisLayer: (Layer*) toLayer;
@end
