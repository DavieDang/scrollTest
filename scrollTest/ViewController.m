//
//  ViewController.m
//  scrollTest
//
//  Created by dangMac on 17/1/13.
//  Copyright © 2017年 dangMac. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YYAdd.h"


#define kwidth [UIScreen mainScreen].bounds.size.width
#define kheight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *myScrollView;
@property (nonatomic,strong) UIView *redView;
@property (nonatomic,strong) UIView *blueView;
@property(nonatomic,assign) BOOL isShow;

@end

@implementation ViewController

- (UIView *)redView{
    if (!_redView) {
        _redView = [[UIView alloc] init];
        _redView.top = 0;
        _redView.width = kwidth;
        _redView.height = kwidth/2;
        _redView.backgroundColor = [UIColor redColor];
        [_myScrollView addSubview:self.redView];
    }
    return _redView;
}

- (UIView *)blueView{
    if (!_blueView) {
        _blueView = [[UIView alloc] init];
        _blueView.backgroundColor = [UIColor blueColor];
        _blueView.top = kwidth/2;
        _blueView.width = kwidth;
        _blueView.height =kheight - kwidth/2;

        [_myScrollView addSubview:self.blueView];
    }
    return _blueView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _myScrollView.backgroundColor = [UIColor greenColor];
    _myScrollView.delegate = self;
    
    _myScrollView.alwaysBounceVertical = YES;
    
    [self.view addSubview:_myScrollView];
  
    
    self.redView.hidden = NO;
    self.blueView.hidden = NO;

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    NSLog(@"向上-------");
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
     NSLog(@"开始拖走");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"结束拖拽");
    
    CGFloat scroll_y = scrollView.contentOffset.y;
    
    NSLog(@"------%f",scroll_y);
    
//    if (self.isShow) {
//        
//        [UIView animateWithDuration:0.25 animations:^{
//           self.blueView.top = kwidth/2;
//            [self.view layoutIfNeeded];
//        }];
//        
//        
//    }else{
//        
//        
//        [UIView animateWithDuration:0.25 animations:^{
//             self.blueView.top = 0;
//            [self.view layoutIfNeeded];
//        }];
//       
//    }
    
    
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
        if (self.isShow) {
    
            [UIView animateWithDuration:0.25 animations:^{
               self.redView.top = -kwidth/2;
                self.blueView.top = self.redView.bottom;
                [self.view layoutIfNeeded];
            }];
    
    
        }else{
    
    
            [UIView animateWithDuration:0.25 animations:^{
                 self.redView.top = 0;
                self.blueView.top = self.redView.bottom;
                [self.view layoutIfNeeded];
            }];
           
        }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat scroll_y = scrollView.contentOffset.y;
//    self.redView.top = -scroll_y;
//    self.blueView.top = self.redView.bottom;
    
    if (scroll_y > kwidth/4) {
       
         self.isShow = YES;
       
    }
    if (scroll_y < 0) {
        self.isShow = NO;
    }
    
}


@end
