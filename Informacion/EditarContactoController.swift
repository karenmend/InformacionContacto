//
//  EditarContactoController.swift
//  Informacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class EditarContactoController : UIViewController {
    
    var contacto : Contacto?
    
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBAction func doTapGuardae(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        txtNombre.text = contacto!.nombre
        txtTelefono.text = contacto!.telefono
        
    }
}
