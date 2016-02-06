//
//  UITableView+Whawhawhat.m
//  whawhawhatLib
//
//  Created by Tianwei on 14/11/5.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import "UITableView+Whawhawhat.h"

@implementation UITableView (Whawhawhat)

-(void)clearSelection{
    [self deselectRowAtIndexPath:[self indexPathForSelectedRow] animated:YES];
}
@end
