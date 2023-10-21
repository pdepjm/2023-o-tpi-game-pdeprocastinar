import wollok.game.*
import susana.*
import elementos.*

class Personaje {
	var position = game.at(0,0)
	var image = ""
	var interaccion = 0
	
	// Podríamos hacer un metodo hablarCon(alguien) y asignarselo a interaccion para usar polimorfismo

	const messi = new Personaje(position = game.at(5,8), image = "messi.png", interaccion = hablarConMessi)
	const moria = new Personaje(position = game.at(5,8), image = "moria.png", interaccion = hablarConMoria)

	/*
	const marley
	const escudero
	const mirtha
	const betular
	const pimpinela
	const mbappe
	*/

	method acceder(personaje) = personaje
}

object hablarConMessi {
	
	method interactuar() {
		if(susana.tuvo(botines)) {
			game.say(self, "Conseguime el balón de oro, creo que lo tiene Moria")
// method entregarSiTiene para hacer un or en el if y darle si se cumple alguna
		} else if (susana.tiene(botines)) {
			susana.entregar(botines)
			game.say(self, "Conseguime el balón de oro, creo que lo tiene Moria")
			
		} else if (susana.tiene(balonDeOro)) {
			susana.entregar(balonDeOro)
			game.say(self, "Gracias Su! Tomá la copa :D")
			susana.agregarA(susana.inventario(), copa)
			
		} else {
			game.say(self, "Hola Su! Tengo que pedirte un favor, pero primero buscame mis botines")
		}
	}
}


object hablarConMoria {

	method interactuar() {
		if(susana.tiene(llaveEscudero)) {
			susana.entregar(llaveEscudero)
			game.say(self, "Habla con la tortuga para saber donde esta el balon")
			
		} else if (susana.tiene(collar)) {
			susana.entregar(collar)
			game.say(self, "Conseguime la casa de escudero y te doy el balon")
			
		} else if (susana.tuvo(collar) && !susana.tiene(llaveEscudero)) {
			game.say(self, "Conseguime la casa de escudero y te doy el balon")	
		}
		else {
			game.say(self, "Conseguime el collar de Mirtha, a ella los gustan los Martin Fierro")
		}	
	}

}
