//
//  InteractiveNewsComponent.m
//  FaceJoke
//
//  Created by 胡昆1 on 11/23/15.
//  Copyright © 2015 cn.kinsuft. All rights reserved.
//

#import "InteractiveNewsComponent.h"
#import <ComponentKit/CKComponentSubclass.h>
#import <ComponentKit/ComponentKit.h>

@implementation InteractiveNewsComponent

+ (instancetype)newWithNotify:(News *)news context:(NSObject *)context {
  CKComponentScope scope(self);

  InteractiveNewsComponent *c =
      [super newWithComponent:[CKStackLayoutComponent newWithView:{

               [UIView class], {
                 CKComponentTapGestureAttribute(@selector(didTap))
               }

             } size:{} style:{} children:{
                 
                 {[CKLabelComponent
                            newWithLabelAttributes:{
                                .string = @"ejejej",
                                .font = [UIFont fontWithName:@"Baskerville" size:30]
                            }
                            viewAttributes:{
                                {@selector(setBackgroundColor:), [UIColor clearColor]},
                                {@selector(setUserInteractionEnabled:), @NO},
                            }]},
                 
             }]];

  return c;
}

@end
