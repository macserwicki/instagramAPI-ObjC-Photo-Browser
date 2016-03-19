//
//  PhotosVC.m
//  instagramAPI-ObjC-Photo-Browser
//
//  Created by Maciej Serwicki on 3/16/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "PhotosVC.h"

@interface PhotosVC ()

@end

@implementation PhotosVC

-(instancetype) init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(106.0, 106.0);
    layout.minimumInteritemSpacing = 1.0;
    layout.minimumLineSpacing = 1.0;
    
    return (self = [super initWithCollectionViewLayout:layout]);
}

-(void) viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor greenColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"photo"];
}

//cell for item
//number of items

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photo" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}





@end



