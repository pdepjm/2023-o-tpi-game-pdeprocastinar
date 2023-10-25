import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*
import elementos.*

class Personaje {
	var position = game.at(0,0)
	
	var image = ""
	var interaccion = null
	var interactuaCon = self
	
	method position() = position
	method image() = image
	
	method interactuar() {
		interaccion.interactuar(interactuaCon)
    }
    
    method agregar() {
    	game.addVisual(self)
    }
}

const messi = new Personaje(position = game.at(5,8), image = "messi.png", interaccion = hablarConMessi)
const moria = new Personaje(position = game.at(5,8), image = "moria.png", interaccion = hablarConMoria)

const marley = new Personaje(position = game.at(20,3), image = "marley.png", interaccion = hablarConMessi)
const escudero = new Personaje(position = game.at(5,8), image = "escudero.png", interaccion = hablarConMessi)
const mirtha = new Personaje(position = game.at(8,8), image = "mirtha.png", interaccion = hablarConMirtha)
const betular = new Personaje(position = game.at(5,8), image = "betular.png", interaccion = hablarConMessi)

const posicionesBetular = [game.at(0,0), game.at(0,0), game.at(0,0)]
const mbappe = new Personaje(position = game.at(5,8), image = "mbappe.png", interaccion = hablarConMessi)

/* const taylor = new Personaje(position = game.at(5,8), image = "messi.png", interaccion = hablarConMessi)
const rickyFort = new Personaje(position = game.at(5,8), image = "messi.png", interaccion = hablarConMessi)
const pimpinela = new Personaje(position = game.at(5,8), image = "messi.png", interaccion = hablarConMessi)
 */


object hablarConMessi {
	method interactuar(personaje) {
		if(susana.tuvo(botines)) {
			game.say(personaje, "Conseguime el balón de oro, creo que lo tiene Moria")
// method entregarSiTiene para hacer un or en el if y darle si se cumple alguna
		} else if (susana.tiene(botines)) {
			susana.entregar(botines)
			game.say(personaje, "Conseguime el balón de oro, creo que lo tiene Moria")
			
		} else if (susana.tiene(balonDeOro)) {
			susana.entregar(balonDeOro)
			game.say(personaje, "Gracias Su! Tomá la copa :D")
			susana.agregarA(susana.inventario(), copa)
			
		} else {
			game.say(personaje, "Hola Su! Tengo que pedirte un favor, pero primero buscame mis botines")
		}
	}
}

object hablarConMoria {
	method interactuar(personaje) {
		if(susana.tiene(llaveEscudero)) {
			susana.entregar(llaveEscudero)
			game.say(personaje, "Habla con la tortuga para saber donde esta el balon")
			
		} else if (susana.tiene(collar)) {
			susana.entregar(collar)
			game.say(personaje, "Conseguime la casa de escudero y te doy el balon")
			
		} else if (susana.tuvo(collar) && !susana.tiene(llaveEscudero)) {
			game.say(personaje, "Conseguime la casa de escudero y te doy el balon")	
			
		} else {
			game.say(personaje, "Conseguime el collar de Mirtha, a ella los gustan los Martin Fierro")
		}	
	}

}

object hablarConMirtha {
	method interactuar(personaje){
		if(susana.tiene(martinFierro)){
			susana.entregar(martinFierro)
			game.say(personaje,"Toma Su, aca esta mi collar")
			susana.agregarA(susana.inventario(), collar)
			
		} else {
			game.say(personaje,"Como te ven te tratan")
		}
	}
}
