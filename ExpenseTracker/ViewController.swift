//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by Peter Alt on 4/4/18.
//  Copyright © 2018 Peter Alt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var shopTableView: UITableView!
    
    var receiptStore: Store!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        receiptStore = Store()
        receiptStore.update(completion: {_ in
            DispatchQueue.main.async {
                self.shopTableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptStore.shops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as! ShopCellTableViewCell
        cell.format(shop: receiptStore.shops[indexPath.row])
        return cell
    }
    
}
