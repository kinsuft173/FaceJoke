//
//  HKJsonCacheTest.m
//  FaceJoke
//
//  Created by 胡昆1 on 11/10/15.
//  Copyright © 2015 cn.kinsuft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JsonCache.h"

@interface HKJsonCacheTest : XCTestCase

@end

@implementation HKJsonCacheTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    // Use XCTAssert and related functions to verify your tests produce the correct results.
//}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

- (void)testJsonCache{
    
    [JsonCache readJsonFromFile:@"KSTest"];
    [JsonCache writeJsonToFile:[NSMutableArray arrayWithObjects:@"1",@"2", nil] WithName:@"KSTest"];
    [JsonCache readJsonFromFile:@"KSTest"];
    [JsonCache writeJsonToFile:[NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil] WithName:@"KSTest"];
    [JsonCache readJsonFromFile:@"KSTest"];
    [JsonCache writeImgToFile:[[NSData alloc] initWithBase64EncodedString:@"112" options:NSDataBase64DecodingIgnoreUnknownCharacters] WithName:@"KSTestData"];
    
    
}


@end
