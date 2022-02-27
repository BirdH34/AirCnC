//
//  ExplorerViewController.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 6. 8..
//  Copyright © 2018년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ExplorerViewController: UITableViewController {
    var items = [
        Item(name: "T800", thumbnail: "T800",
                 detailImage: ["T800", "T800_1", "T800_2", "T800_3", "T800_4"],
                 price: 700000, size: Size(w: 670, d: 575, h: 1320),
                 user: User.sehyeon),
        Item(name: "T550", thumbnail: "T550",
                 detailImage: ["T550", "T550_1", "T550_2", "T550_3", "T550_4"],
                 price: 469000, size: Size(w: 645, d: 675, h: 1260),
                 user: User.jeongyeon),
        Item(name: "T50Air", thumbnail: "T50Air",
                 detailImage: ["T50Air", "T50Air_1", "T50Air_2", "T50Air_3", "T50Air_4"],
                 price: 486000, size: Size(w: 670, d: 625, h: 1220),
                 user: User.donghyeon),
        Item(name: "T50", thumbnail: "T50",
                 detailImage: ["T50", "T50_1", "T50_2", "T50_3", "T50_4"],
                 price: 427000, size: Size(w: 670, d: 645, h: 1220),
                 user: User.sujin),
    ]

    // 테이블 뷰 데이터소스
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.user.name
        cell.imageView?.image = UIImage(named: item.thumbnail)

        return cell
    }
    
    // 상세씬 전환
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue",
            let detailVC = segue.destination as? ViewController,
            let cell = sender as? UITableViewCell,
            let index = self.tableView.indexPath(for: cell) {
            let item = items[index.row]
            detailVC.item = item
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
