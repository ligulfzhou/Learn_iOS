//
//  PlayersViewController.swift
//  rw1_storyboard
//
//  Created by zhou ligang on 30/07/2017.
//  Copyright © 2017 zhouligang. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    
    var players: [Player] = playersData
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    private func imageForRating(rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelToPlayersViewController(segue: UIStoryboardSegue) {
        print("cancel")
    }
    
    @IBAction func savePlayerDetail(segue: UIStoryboardSegue) {
        print("save")
        if let playerDetailViewController = segue.source as? PlayerDetailsViewController{
            print("save")

            print(playerDetailViewController.player)
            if let player = playerDetailViewController.player {
                print("save")

                players.append(player)
                let indexPath = NSIndexPath(row: players.count-1, section: 0)
                tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
//        
//        let player = players[indexPath.row]
//        
//        if let nameLabel = cell.viewWithTag(100) as? UILabel {
//            nameLabel.text = player.name
//        }
//        
//        if let gameLabel = cell.viewWithTag(101) as? UILabel {
//            gameLabel.text = player.game
//        }
//        
//        if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
//            ratingImageView.image = imageForRating(rating: player.rating)
//        }
//        
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        let player = players[indexPath.row]
        cell.player = player
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
