import wollok.game.*
import susana.*
import elementos.*

class Personaje {
	method position()= game.at(0,0)

	method image() = ""

	method interactuar() {}
}

object messi inherits Personaje {
	override method position() = game.at(5,8)

	override method image() = "messi.png"
	
	override method interactuar() {
		if(susana.tuvo(botines)) {
			game.say(self, "Conseguime el balón de oro, creo que lo tiene Moria")
			
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

object moria inherits Personaje {
	override method position() = game.at(5,8)

	override method image() = "moria.png"

	override method interactuar() {
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
