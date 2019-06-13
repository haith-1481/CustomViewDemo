//
//  TableViewController.swift
//  CustomViewsDemo
//
//  Created by trinh.hoang.hai on 6/13/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var countriesinEurope = ["France","Spain","Germany"]
    var countriesinAsia = ["Japan","China","India"]
    var countriesInSouthAmerica = ["Argentia","Brasil","Chile"]
    var testCellSizing = ["Imagine that you have a movie-crazy client who wants an app to show off a number of favorite film directors and some of their most prominent work. Not just any directors, actually, just their favorite auteurs.", "“Auteurs?” you ask, “That sounds French.”", "Oui, it is. The auteur theory of film making arose in France in the 1940s and it basically means that the director is the driving creative force behind a film. Not every director is an auteur — only the ones who stamp each film with their individual styles. Think Tarantino or Scorsese. And not everyone agrees with this theory — don’t get your screenwriter friend started. But, the client is always right, so you’re ready to start rolling.", "There’s one problem: “We started making the app, but we’re stumped at how to display the content in a table view,” your client admits. “Our table view cells have to resize (gulp!) dynamically! Can you make it work?”"]
    var imageArr: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        // self.clearsSelectionOnViewWillAppear = false

        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        let headerNib = UINib(nibName: "CustomHeaderCell", bundle: nil)
        tableView.register(headerNib, forCellReuseIdentifier: "CustomHeaderCell")
        let imageNib = UINib(nibName: "TableViewCellWithImage", bundle: nil)
        tableView.register(imageNib, forCellReuseIdentifier: "TableViewCellWithImage")
        let image = UIImage(imageLiteralResourceName: "doge_meme")
        let image1 = UIImage(imageLiteralResourceName: "Snowy_Owl")
        let image2 = UIImage(imageLiteralResourceName: "momo")
        let image3 = UIImage(imageLiteralResourceName: "tower")
        imageArr.append(image)
        imageArr.append(image1)
        imageArr.append(image2)
        imageArr.append(image3)

    }

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 3, 4:
            return 4
        default:
            return 3
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        guard let cellWithImage = tableView.dequeueReusableCell(withIdentifier: "TableViewCellWithImage", for: indexPath) as? TableViewCellWithImage else { return UITableViewCell() }
        if indexPath.section == 4 {
            cellWithImage.displayImage.image = imageArr[indexPath.row]
            return cellWithImage
        } else {
            switch (indexPath.section) {
            case 0:
                cell.label.text = countriesinEurope[indexPath.row]
            case 1:
                cell.label.text = countriesinAsia[indexPath.row]
            case 2:
                cell.label.text = countriesInSouthAmerica[indexPath.row]
            case 3:
                cell.label.text = testCellSizing[indexPath.row]
            default:
                cell.label.text = "Other"
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "CustomHeaderCell") as! CustomHeaderCell
        headerCell.backgroundColor = .orange

        switch (section) {
        case 0:
            headerCell.label.text = "Europe";
        //return sectionHeaderView
        case 1:
            headerCell.label.text = "Asia";
        //return sectionHeaderView
        case 2:
            headerCell.label.text = "South America";
        //return sectionHeaderView
        default:
            headerCell.label.text = "Other";
        }

        return headerCell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch (section) {
        case 0:
            return 20
        case 1:
            return 35
        case 2:
            return 50
        default:
            return 35
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        footerView.backgroundColor = .lightGray
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */

    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */

    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

     }
     */

    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
