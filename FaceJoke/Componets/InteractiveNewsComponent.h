//
//  InteractiveNewsComponent.h
//  FaceJoke
//
//  Created by 胡昆1 on 11/23/15.
//  Copyright © 2015 cn.kinsuft. All rights reserved.
//

#import "CKCompositeComponent.h"
#import "News.h"

@interface InteractiveNewsComponent : CKCompositeComponent

+ (instancetype)newWithNotify:(News *)news context:(NSObject *)context;


@end
