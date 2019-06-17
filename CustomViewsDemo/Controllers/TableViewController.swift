//
//  TableViewController.swift
//  CustomViewsDemo
//
//  Created by trinh.hoang.hai on 6/13/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import UIKit


struct CellConstant {
    let tableViewCellID = "TableViewCell"
    let customHeaderCellID = "CustomHeaderCell"
    let tableViewCellWithImageID = "TableViewCellWithImage"
}

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var editingSection: Int = 10

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
        tableViewReload()
    }

    private func tableViewReload() {
        if (self.tableView.contentOffset.y - self.tableView.contentInset.bottom >= self.tableView.contentSize.height - self.tableView.bounds.size.height) {
            tableView.reloadData()
        }
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
        case editingSection:
            return 0
        default:
            return 3
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        guard let cellWithImage = tableView.dequeueReusableCell(withIdentifier: "TableViewCellWithImage", for: indexPath) as? TableViewCellWithImage else { return UITableViewCell() }
        if indexPath.section == 4 {
            cellWithImage.displayImage.image = Constant.imageArr[indexPath.row]
            return cellWithImage
        } else {
            switch (indexPath.section) {
            case 0:
                cell.label.text = Constant.countriesinEurope[indexPath.row]
            case 1:
                cell.label.text = Constant.countriesinAsia[indexPath.row]
            case 2:
                cell.label.text = Constant.countriesInSouthAmerica[indexPath.row]
            case 3:
                cell.label.text = Constant.testCellSizing[indexPath.row]
            default:
                cell.label.text = "Other"
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "CustomHeaderCell") as! CustomHeaderCell
        headerCell.backgroundColor = .orange
        headerCell.shouldDisplayCells = true
        headerCell.section = section

        headerCell.reloadSections = { [weak self] (section: Int) in
            headerCell.shouldDisplayCells?.toggle()
            guard let shouldDisplay = headerCell.shouldDisplayCells else { return }
            if !shouldDisplay {
                self?.tableView?.beginUpdates()
                self?.tableView?.reloadSections([section], with: .fade)
                self?.tableView?.endUpdates()
            }
        }

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

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let lastElement = dataSource.count - 1
//        if !loadingData && indexPath.row == lastElement {
//            indicator.startAnimating()
//            loadingData = true
//            loadMoreData()
//        }
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
