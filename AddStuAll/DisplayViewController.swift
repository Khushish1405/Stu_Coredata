//
//  DisplayViewController.swift
//  AddStuAll
//
//  Created by Jaimin Solanki on 11/11/22.
//

import UIKit
import CoreData

class DisplayViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return appdel.Stuarray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell1", for: indexPath) as! myCell1
        
        let SingleRow = appdel.Stuarray[indexPath.row]
        
        cell1.lblnm.text = (SingleRow.value(forKey: "name") as! String)
        cell1.lblroll.text = (SingleRow.value(forKey: "roll") as! String)
        cell1.lblgend.text = (SingleRow.value(forKey: "gender") as! String)
        cell1.lblmrks.text = (SingleRow.value(forKey: "marks") as! String)
        
        return cell1
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return appdel.Stuarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myCell
        
        let SingleRow = appdel.Stuarray[indexPath.row]
        
        cell.lblname.text = (SingleRow.value(forKey: "name") as! String)
        cell.lblroll.text = (SingleRow.value(forKey: "roll") as! String)
        cell.lblGender.text = (SingleRow.value(forKey: "gender") as! String)
        cell.lblMarks.text = (SingleRow.value(forKey: "marks") as! String)
        
        return cell
    }
    
    
    var appdel = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var Segment: UISegmentedControl!
    @IBOutlet weak var Uiview: UIView!
    @IBOutlet weak var Tableview: UITableView!
    @IBOutlet weak var UIview1: UIView!
    @IBOutlet weak var CollecView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = appdel.selectedClr
        
        if Segment.selectedSegmentIndex == 0 {
            
            Uiview.isHidden = false
            UIview1.isHidden = true
        }
        else{
            
            Uiview.isHidden = true
            UIview1.isHidden = false
        }

        let managedContext = appdel.persistentContainer.viewContext
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Student")
        
        do {
            try appdel.Stuarray = managedContext.fetch(fetchReq)
            print(appdel.Stuarray.count)
        } catch let err as NSError {
            print(err)
        }
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func SegAct(_ sender: Any) {
        
        if Segment.selectedSegmentIndex == 0 {
            
            Uiview.isHidden = false
            UIview1.isHidden = true
        }
        else{
            
            Uiview.isHidden = true
            UIview1.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let context = appdel.persistentContainer.viewContext
        
        context.delete(appdel.Stuarray[indexPath.row])
        
        do {
            try context.save()
        } catch let err as NSError {
            print(err)
        }
        
        appdel.Stuarray.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appdel.selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        appdel.selectedCollIndex = indexPath.row
        self.performSegue(withIdentifier: "toDeailColl", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        Tableview.reloadData()
        CollecView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
