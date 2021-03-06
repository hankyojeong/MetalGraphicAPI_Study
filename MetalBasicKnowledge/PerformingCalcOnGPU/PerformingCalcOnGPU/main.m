//
//  main.m
//  PerformingCalcOnGPU
//
//  Created by HanGyo Jeong on 2020/02/15.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Metal/Metal.h>
#import "MetalAdder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        id<MTLDevice> device = MTLCreateSystemDefaultDevice();
        
        // Create the custom object used to encapsulate the Metal code
        // Initializes objects to communicate with the GPU
        MetalAdder* addr = [[MetalAdder alloc] initWithDevice:device];
        
        // Create buffers to hold data
        [addr prepareData];
        
        // Send a command to the GPU to perform the calculation
        [addr sendComputeCommand];
        
        NSLog(@"Execution finished");
    }
    return 0;
}
