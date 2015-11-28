//
//  ViewController.m
//  Task1
//
//  Created by Elena on 28.11.15.
//  Copyright © 2015 Elena. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController() <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *images;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewLayout;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.images = [NSMutableArray arrayWithArray:@[
                    [UIImage imageNamed: @"img1"],
                    [UIImage imageNamed: @"img2"],
                    [UIImage imageNamed: @"img3"],
                    [UIImage imageNamed: @"img4"],
                    [UIImage imageNamed: @"img5"],
                    [UIImage imageNamed: @"img6"],
                    [UIImage imageNamed: @"img7"],
                    [UIImage imageNamed: @"img8"]
                    ]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.collectionViewLayout.itemSize = CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    self.pageControl.numberOfPages = self.images.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = (CollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.imageView.image = [self.images objectAtIndex:indexPath.row];
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    self.pageControl.currentPage = indexPath.row;
}


@end
