//
//  JsonCache.m
//  CTJsonDiskCache
//
//  Created by kinsuft on 8/11/14.
//  Copyright (c) 2014 CT. All rights reserved.
//

#import "JsonCache.h"

@implementation JsonCache

/*
+ (JsonCache*)shareMgr
{
    static JsonCache* instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[JsonCache alloc] init];
    });
    
    return instance;
}
*/

+ (BOOL)writeJsonToFile:(NSMutableArray*)array WithName:(NSString*)name
{
    
    NSString *doc = [JsonCache documentsDirectory];
    NSString *path = [doc stringByAppendingPathComponent:name];
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:array];
    BOOL success = [archivedData writeToFile:path atomically:YES];
    return success;

}

+ (BOOL)writeImgToFile:(NSData*)data WithName:(NSString*)name
{
    
    NSString *doc = [JsonCache documentsDirectory];
    NSString *path = [doc stringByAppendingPathComponent:name];
//    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:array];
    BOOL success = [data writeToFile:path atomically:YES];
    return success;
    
}

+ (NSData*)readImgFromFile:(NSString*)name
{
    NSString *doc = [JsonCache documentsDirectory];
    NSString *path = [doc stringByAppendingPathComponent:name];
    NSData *data = [NSData dataWithContentsOfFile:path];
//    NSMutableArray*dic = nil;
//    if (data != nil) {
//        dic = [NSKeyedUnarchiver unarchiveObjectWithData:data];
//    }
    return data;
    
}


+ (NSMutableArray*)readJsonFromFile:(NSString*)name
{
    NSString *doc = [JsonCache documentsDirectory];
    NSString *path = [doc stringByAppendingPathComponent:name];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSMutableArray*dic = nil;
    if (data != nil) {
        dic = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    return dic;

}

+ (NSString*)documentsDirectory
{
    NSString *documentsDirectory = nil;
    
    //documentDirectory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    
    if (docDir != nil) {
        documentsDirectory = [[NSString alloc] initWithFormat:@"%@", [docDir stringByAppendingPathComponent:@"JSON"]];
        
        NSFileManager *fm = [NSFileManager defaultManager];
        [fm createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return  documentsDirectory;
}



@end
