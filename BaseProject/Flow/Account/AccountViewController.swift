//
//  AccountViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-11-07.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let originalImage = info[.originalImage] as! UIImage
        self.pictureImageView.image = originalImage

        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func updatePicture(_ sender: Any)
    {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let secondViewController = segue.destination as! EditAccountViewController

        if segue.identifier == "nameSegue"
        {
            segueHelper(nameOfField: "What's your name?", labelToUpdate: nameLabel, editAccountViewController: secondViewController)
        }

        if segue.identifier == "phoneSegue"
        {
            segueHelper(nameOfField: "What's your phone number?", labelToUpdate: phoneLabel, editAccountViewController: secondViewController)
        }

        if segue.identifier == "emailSegue"
        {
            segueHelper(nameOfField: "What's your email?", labelToUpdate: emailLabel, editAccountViewController: secondViewController)
        }

        if segue.identifier == "bioSegue"
        {
            segueHelper(nameOfField: "What type of passenger are you?", labelToUpdate: bioLabel, editAccountViewController: secondViewController)
        }
    }

    private func segueHelper(nameOfField: String, labelToUpdate: UILabel, editAccountViewController: EditAccountViewController)
    {
        editAccountViewController.fieldName = nameOfField
        editAccountViewController.myText = labelToUpdate.text!
        editAccountViewController.myTextFieldUpdated = { newText in
            labelToUpdate.text = newText
        }
    }

    @IBAction func goToSecondViewController(_ sender: Any)
    {
        let secondViewController = UIStoryboard(name: "AccountViewController.storyboard", bundle: nil).instantiateViewController(withIdentifier: "EditAccountViewController") as! EditAccountViewController

        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
