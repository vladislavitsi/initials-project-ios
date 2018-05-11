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

- (void)initializeCellWithDescr:(NSString *)descr pattern:(Pattern *)pattern letters:(NSArray<NSString *> *)letters;

@end
