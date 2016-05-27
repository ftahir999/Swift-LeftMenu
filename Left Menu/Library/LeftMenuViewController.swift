//
//  LeftMenuViewController.swift
//  Left Menu
//
//  Created by Farhan Tahir on 5/27/16.
//  Copyright © 2016 ft. All rights reserved.
//

import UIKit
class LeftMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    weak var dataSource:LeftMenuDataSource?
    weak var delegate:LeftMenuDelegate?
    internal var totalNumberOfRows:Int = 0
    internal var rowsTitleArray:NSMutableArray = NSMutableArray()
    internal var rowTitleColorArray:NSMutableArray = NSMutableArray()
    internal var cellNibsNameArray:NSMutableArray = NSMutableArray()
    internal let CellDefaultNibName:String = "LeftMenuTableViewCell"
    internal let CellHeight:CGFloat = 55.0
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.totalNumberOfRows = self.dataSource!.totalNumberOfRowsForLeftMenu(self)
        
        for i in 0...self.totalNumberOfRows-1
        {
            self.rowsTitleArray[i] = self.dataSource!.getTitleForRow!(i, forLeftMenu: self)
            
            self.rowTitleColorArray[i] = self.dataSource!.getTitleColorForRow?(i, forLeftMenu: self) ?? [UIColor .whiteColor()]
            
            self.cellNibsNameArray[i] = self.dataSource!.registerCellNibForRow?(i, forLeftMenu: self) ?? "LeftMenuTableViewCell"
            self.tableView .registerNib(UINib.init(nibName: self.cellNibsNameArray[i] as! String, bundle: nil), forCellReuseIdentifier: self.cellNibsNameArray[i] as! String)
        }
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.totalNumberOfRows
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellNibsNameArray[indexPath.row] as! String)
        if cell != nil && cell is LeftMenuTableViewCell
        {
            cell = tableView.dequeueReusableCellWithIdentifier(CellDefaultNibName, forIndexPath: indexPath) as! LeftMenuTableViewCell
            let menuCell:LeftMenuTableViewCell = cell as! LeftMenuTableViewCell
            menuCell.menuTitleLabel.text = self.rowsTitleArray[indexPath.row] as! NSString as String
            menuCell.menuTitleLabel.textColor = self.rowTitleColorArray[indexPath.row] as! UIColor
        }
        else
        {
            cell = self.dataSource!.getTableViewCellForRow?(indexPath.row, forLeftMenu: self)
        }
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let height:CGFloat = self.dataSource!.getTableViewCellHeightForRow?(indexPath.row, forLeftMenu: self) ?? CellHeight
        return height
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.delegate!.leftMenuHasSelectedRow?(indexPath.row, forLeftMenu: self)
    }
    
    func setBackgroundImage(image:UIImage)
    {
        self.backgroundImageView.hidden = false
        self.backgroundImageView.image = image
    }
    func setBackgroundColor(color:UIColor)
    {
        self.backgroundImageView.hidden = true
        self.view.backgroundColor = color
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
   
}

