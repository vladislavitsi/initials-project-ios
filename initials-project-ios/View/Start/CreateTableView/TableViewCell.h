//
//  TableViewCell.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pattern.h"

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *preview;
@property (weak, nonatomic) IBOutlet UILabel *descr;

//sdlfjlskdfjlsdflsdfjlsdkfjdssdssdflskdfjlsdflsdfjlsdkfjdssdssdflskdfjlsdflsdfjlsdkfjdssdssdflskdfjlsdflsdfjlsdkfjdssdssdflskdfjlsdflsdfjlsdkfjdssdssdf
@property (nonatomic, copy) NSMutableArray *constraints;

@end
