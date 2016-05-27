//
//  LeftMenuDataSource.swift
//  Left Menu
//
//  Created by Farhan Tahir on 5/27/16.
//  Copyright © 2016 ft. All rights reserved.
//

import Foundation
import UIKit
@objc
protocol LeftMenuDataSource
{
    func totalNumberOfRowsForLeftMenu(menu:LeftMenuViewController) -> Int
    optional func getTitleForRow(row:Int, forLeftMenu:LeftMenuViewController) -> NSString
    optional func getTitleColorForRow(row:Int, forLeftMenu:LeftMenuViewController)->UIColor
    optional func registerCellNibForRow(row:Int, forLeftMenu:LeftMenuViewController)->NSString
    optional func getTableViewCellForRow(row:Int, forLeftMenu:LeftMenuViewController)->UITableViewCell
    optional func getTableViewCellHeightForRow(row:Int, forLeftMenu:LeftMenuViewController)->CGFloat
}