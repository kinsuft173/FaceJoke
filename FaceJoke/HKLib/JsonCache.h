//
//  JsonCache.h
//  CTJsonDiskCache
//
//  Created by kinsuft on 8/11/14.
//  Copyright (c) 2014 CT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonCache : NSObject

+ (BOOL)writeJsonToFile:(NSMutableArray*)array WithName:(NSString*)name;
+ (NSMutableArray*)readJsonFromFile:(NSString*)name;

+ (BOOL)writeImgToFile:(NSData*)data WithName:(NSString*)name;
+ (NSData*)readImgFromFile:(NSString*)name;

@end
