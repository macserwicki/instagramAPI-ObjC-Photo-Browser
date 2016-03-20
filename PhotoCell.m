//
//  PhotoCell.m
//  instagramAPI-ObjC-Photo-Browser
//
//  Created by Maciej Serwicki on 3/19/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.image = [UIImage imageNamed:@"Treehouse"];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}


-(void) layoutSubviews {
    [super layoutSubviews];
    
    //fills cell to bounds
    self.imageView.frame = self.contentView.bounds;
    
}

@end
