//
//  FJFirstViewController.m
//  FaceJoke
//
//  Created by 胡昆1 on 10/30/15.
//  Copyright © 2015 cn.kinsuft. All rights reserved.
//

#import "FJFirstViewController.h"
#import <ComponentKit.h>
#import "News.h"
#import "InteractiveNewsComponent.h"

@interface FJFirstViewController ()

@end

@implementation FJFirstViewController
{
    CKCollectionViewDataSource *_dataSource;
    CKComponentFlexibleSizeRangeProvider *_sizeRangeProvider;


}

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithCollectionViewLayout:layout]) {
        _sizeRangeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight];
        //        _quoteModelController = [[QuoteModelController alloc] init];
        self.title = @"News";
        
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.collectionView.backgroundColor = [UIColor yellowColor];
    self.collectionView.delegate = self;
    
    _dataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:self.collectionView
                                                 supplementaryViewDataSource:nil
                                                           componentProvider:[self class]
                                                                     context:nil
                                                   cellConfigurationFunction:nil];
    
    CKArrayControllerSections sections;
    sections.insert(0);
    [_dataSource enqueueChangeset:{sections, {}} constrainedSize:{}];
    
    CKArrayControllerInputItems items;
    items.insert([NSIndexPath indexPathForRow:0 inSection:0], @"hehe");
    items.insert([NSIndexPath indexPathForRow:1 inSection:0], @"hehe");
    items.insert([NSIndexPath indexPathForRow:2 inSection:0], @"hehe");
    items.insert([NSIndexPath indexPathForRow:3 inSection:0], @"hehe");
    [_dataSource enqueueChangeset:{{}, items}
                  constrainedSize:[_sizeRangeProvider sizeRangeForBoundingSize:self.collectionView.bounds.size]];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [_dataSource sizeForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_dataSource announceWillAppearForItemInCell:cell];
}

- (void)collectionView:(UICollectionView *)collectionView
  didEndDisplayingCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_dataSource announceDidDisappearForItemInCell:cell];
}
#pragma mark - CKComponentProvider

+ (CKComponent *)componentForModel:(News*)news context:(NSObject *)context
{
    return [InteractiveNewsComponent
            newWithNotify:news context:context];
    
//       return  [CKLabelComponent
//         newWithLabelAttributes:{
//             .string = @"ejejej",
//             .font = [UIFont fontWithName:@"Baskerville" size:30]
//         }
//         viewAttributes:{
//             {@selector(setBackgroundColor:), [UIColor clearColor]},
//             {@selector(setUserInteractionEnabled:), @NO},
//         }];
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
