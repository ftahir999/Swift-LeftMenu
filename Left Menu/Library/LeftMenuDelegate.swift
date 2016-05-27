//
//  LeftMenuDelegate.swift
//  Left Menu
//
//  Created by Farhan Tahir on 5/27/16.
//  Copyright © 2016 ft. All rights reserved.
//

import Foundation
import UIKit
@objc
protocol LeftMenuDelegate
{
    optional func leftMenuHasSelectedRow(row:Int, forLeftMenu:LeftMenuViewController) -> Void
}