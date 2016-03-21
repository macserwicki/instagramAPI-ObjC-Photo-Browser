//
//  PhotosVC.m
//  instagramAPI-ObjC-Photo-Browser
//
//  Created by Maciej Serwicki on 3/16/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "PhotosVC.h"
#import "PhotoCell.h"
#import "SimpleAuth.h"
#import "KeychainWrapper.h"



@interface PhotosVC ()
@property (nonatomic, strong) NSString *accessToken;
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
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"photo"];
    self.title = @"Photo Bombers";

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.accessToken = [userDefaults objectForKey:@"accessToken"];
    
    if (self.accessToken == nil) {
        [SimpleAuth authorize:@"instagram" completion:^(NSDictionary *responseObject, NSError *error) {
           // NSLog(@"response: %@", responseObject);
            
            
            
            NSString *accessToken = responseObject[@"credentials"][@"token"];
            [userDefaults setObject:accessToken forKey:@"accessToken"];
            [userDefaults synchronize];
           // self.accessToken = accessToken;

            
            
        }];
    } else {
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.instagram.com/v1/tags/photobomb/media/recent?access_token=%@", self.accessToken];
        NSURL *url = [[NSURL alloc] initWithString:urlString];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSString *text = [[NSString alloc] initWithContentsOfURL:location encoding:NSUTF8StringEncoding error:nil];
            
            NSLog(@"%@",text);
            
            
        }];

        [task resume];
    
    }
    
    
    
    
//    NSURLSession *session = [NSURLSession sharedSession];
//    //NSURLSessionTask *task = [[NSURLSessionTask alloc] init];
//    NSURL *url = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
//    NSURLRequest *request = [NSURLRequest requestWithURL: url];
// 
//    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSString *text = [[NSString alloc] initWithContentsOfURL:location encoding:NSUTF8StringEncoding error:nil];
//        NSLog(@"Response - %@", text);
//        
//    }];
//    
//    
//    
//    [task resume];
    
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

