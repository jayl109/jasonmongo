//
//  SecondViewController.swift
//  map
//
//  Created by Jason Lum on 7/18/16.
//  Copyright © 2016 Jason Lum. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var pokemonname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func submitPokemon(sender: AnyObject) {
        print ("Your pokemon is:")
        if let name = pokemonname.text
        {
        print (name)
        }
        else{
            print ("no pokemon entered")
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }

}
