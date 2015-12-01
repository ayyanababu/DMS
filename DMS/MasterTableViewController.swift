//
//  MasterTableViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 10/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit



class MasterTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    var categoryLines = [CategoryLine]()
    var filteredCategoryLines = [CategoryLine]()
    
    var searchActive : Bool = false
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var logOutButton: UIButton!
    
    
    
    func constructCategoryLines(){
        
        let categoryResults = DataPersistence.getDataFromTableAsList("Category")
        
        if let results = categoryResults as? [Category]{
            
            for eachCategory in results{
                
                let documents = DataPersistence.getDataFromTableWithFilter("ProductionDocuments", coloumnName: "categoryname", filterParameters: [eachCategory.categoryname!]) as? [ProductionDocuments]
                
                let categoryLine = CategoryLine(category: eachCategory, documents: documents!)
                
                categoryLines.append(categoryLine)
                
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Categories"
        //tableView.tableFooterView = UIView(frame:CGRectZero)
        self.constructCategoryLines()
        
        self.tableView.backgroundColor = UIColor.whiteColor()
        self.logOutButton.backgroundColor = UIColor(colorLiteralRed: 251/255, green: 73/255, blue: 71/255, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categoryLines.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let productLine = categoryLines[section]
        return productLine.documents!.count
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showdetail", sender: nil)
        
    }
    
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    //searchBarResultsListButtonClicked
    
    func searchBarResultsListButtonClicked(searchBar: UISearchBar) {
        
        
        
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
  
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mastercell", forIndexPath: indexPath)
        let productLine = categoryLines[indexPath.section]
        let document = productLine.documents![indexPath.row]
        
        cell.textLabel?.text = document.docname
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.blackColor()
        cell.textLabel?.font = UIFont(name: "Avenir-Light", size: 17.0)
        
        
        return cell
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showdetail"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let detailView = (segue.destinationViewController as! UINavigationController).topViewController as! DetailTableViewController
                detailView.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                detailView.navigationItem.leftItemsSupplementBackButton = true
                
                let productLine = categoryLines[indexPath.section]
                let document = productLine.documents![indexPath.row]
                detailView.masterdoc = document
            }
            
        }
    }
    
    
    //MARK: - SectionHeader
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let productLine = categoryLines[section]
        return productLine.category?.categoryname
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 32/255, green: 173/255, blue: 82/255, alpha: 1.0).colorWithAlphaComponent(0.5)
        
    }
    
    
    //MARK: LogoutButton
    
    @IBAction func logOutAction(sender: UIButton) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.loggedIn = false
    }
    
    @IBOutlet var searchcollection: [UISearchBar]!
    
    
}
