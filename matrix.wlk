//pasajeros de la nave

/*
ELEGIDO:
empieza con 100 de energia (cambia)
                       ->salta->pierde la mitad de energia
su vitalidad es La decima parte de su energia
*/
object neo {
    var energia = 100
    const elegido = true

  method saltar(){energia = energia / 2}
  method vitalidad(){return energia / 10}
}
/*
NO ES EL ELEGIDO:
vitalidad inicial 8 (cambia)
     ->siempre que salta su vitalizad disminuye en 1
empieza descansado y al saltar se cansa
  ->si salta estando cansado vuelve a quedar descansado 
*/
object morfeo {
    var vitalidad = 8
    var estaDescansado = true
    const elegido = false

  method saltar(){
    vitalidad= vitalidad - 1 
    estaDescansado = not estaDescansado
  }
 /*
  otra forma= 
  if (estaDescansado) {
            estaDescansado = false
        } else {
            estaDescansado = true
        }
    }
  */
  method vitalidad(){return vitalidad}
}
/*
NO ES LA ELEGIDA
sabe decir su vitalidad SIEMPRE 0
saltar no le afecta
*/
object trinity {
    const elegido = false

    method vitalidad(){return 0}
    method saltar(){}
}

object nave {
  const pasajeros = [neo, morfeo , trinity]

  method cantidadDePasajeros(){
    return pasajeros.size()
  }
  method pasajeroConMayorVitalidad(){return pasajeros.max({p => p.vitalidad()})}
  method estaEquilibradaEnVitalidad(){return pasajeros.all({p => p.vitalidad() })}
  method elegidoEsta(){}

  // hechos que le suceden a la nave
  method chocar(){
    pasajeros.saltar()
  }
  method acelerar(){
    
  }

}