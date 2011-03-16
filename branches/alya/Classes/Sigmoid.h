//
//  Sigmoid.h
//  Neuron1
//
//  Created by user on 14.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Sigmoid : NSObject {
	double slope;
}
+(double) getOutputFrom: (double) net;
+(double) getDerivative: (double) net;
@end
