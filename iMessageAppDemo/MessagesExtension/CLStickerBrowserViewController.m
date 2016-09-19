//
//  CLStickerBrowserViewController.m
//  iMessageAppDemo
//
//  Created by chocklee on 16/9/19.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import "CLStickerBrowserViewController.h"

@interface CLStickerBrowserViewController ()

@property (nonatomic, strong) NSMutableArray *stickersArray;

@end

@implementation CLStickerBrowserViewController

- (NSMutableArray *)stickersArray {
    if (!_stickersArray) {
        _stickersArray = [NSMutableArray array];
    }
    return _stickersArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载数据源
    [self loadStickers];
    self.stickerBrowserView.backgroundColor = [UIColor colorWithRed:0.9490196078 green:0.7568627451 blue:0.8196078431 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadStickers {
    NSArray *stickerNames = @[@"catjump",@"ear",@"eyes",@"glasses",@"grass",@"halo",@"hat",@"moustache",@"necklace",@"nose"];
    for (NSString *name in stickerNames) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:name withExtension:@"png"];
        MSSticker *sticker = [[MSSticker alloc] initWithContentsOfFileURL:url localizedDescription:name error:nil];
        [self.stickersArray addObject:sticker];
    }
}

#pragma mark - MSStickerBrowserViewDataSource
- (NSInteger)numberOfStickersInStickerBrowserView:(MSStickerBrowserView *)stickerBrowserView {
    return _stickersArray.count;
}

- (MSSticker *)stickerBrowserView:(MSStickerBrowserView *)stickerBrowserView stickerAtIndex:(NSInteger)index {
    return _stickersArray[index];
}

@end
