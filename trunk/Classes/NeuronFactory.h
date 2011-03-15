//
//  NeuronFactory.h
//  Neuron1
//
//  Created by user on 28.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Neuron.h"
#import "NeuronProperties.h"

@interface NeuronFactory : NSObject {

}
-(Neuron*) createNeuron: (NeuronProperties*) properties;
@end
