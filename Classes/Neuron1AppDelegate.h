//
//  Neuron1AppDelegate.h
//  Neuron1
//
//  Created by user on 07.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Neuron1ViewController;

@interface Neuron1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Neuron1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Neuron1ViewController *viewController;

@end

