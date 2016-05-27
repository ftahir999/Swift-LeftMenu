//
//  LeftMenuManager.swift
//  Left Menu
//
//  Created by Farhan Tahir on 5/27/16.
//  Copyright © 2016 ft. All rights reserved.
//

import UIKit

class LeftMenuManager: NSObject, LeftMenuDataSource, LeftMenuDelegate
{
    internal var rowTitles:NSMutableArray
    override init() {
        self.rowTitles = NSMutableArray.init(array:["First", "Second", "Third", "Forth", "Fift"])
    }
    
    func totalNumberOfRowsForLeftMenu(menu: LeftMenuViewController) -> Int
    {
        return self.rowTitles.count
    }
    func getTitleForRow(row: Int, forLeftMenu: LeftMenuViewController) -> NSString
    {
        return self.rowTitles[row] as! NSString
    }
    func getTitleColorForRow(row: Int, forLeftMenu: LeftMenuViewController) -> UIColor {
        return UIColor.whiteColor()
    }
    func leftMenuHasSelectedRow(row: Int, forLeftMenu: LeftMenuViewController)
    {
        
    }
    
}
