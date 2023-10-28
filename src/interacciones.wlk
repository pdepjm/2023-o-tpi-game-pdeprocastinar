import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*
import elementos.*
import personajes.*

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


object hablarConEscudero {
	method interactuar(personaje) {
		if(susana.tiene(torta) && susana.tiene(veneno)) {
			susana.entregar(torta)
			susana.entregar(veneno)
			game.say(personaje,"Que rico Su! Muchas gracias")
			transformarPersonaje.cambiarVisual(personaje, escuderoMuerta)
		
		} else if(susana.tuvo(collar)){
			game.say(personaje,"Que ganas de comer una rica torta")
		}
		else {
			game.say(personaje,"Con mi abuela muerta no te metas")
		}
	}
}

object hablarConBetular {
	method interactuar(personaje) {
		if(susana.tuvo(collar) && personaje == betularOculto) {
			transformarPersonaje.cambiarVisual(personaje, betular)
			game.say(betular,"Toma la torta")
			susana.agregarA(susana.inventario(), torta)
					
		} else if(susana.tuvo(collar)){
			game.say(personaje,"Espero que te haya gustado la torta")
		}
		else {
			game.say(personaje,"SHH!")
		}
	}
}


object hablarConPimpinela{
	method interactuar(personaje) {
		if(susana.tuvo(collar)) {
			//game.say(susana,"Chicos, se que estan fumigando")
			//game.say(susana,"¿Me prestan veneno para mi casa?")
			game.say(personaje,"Toma el veneno susy")
			susana.agregarA(susana.inventario(), veneno)
		} else if(susana.tuvo(veneno) || susana.tiene(veneno)){
			game.say(personaje,"Quién es?")
			//game.say(susana,"Soy yo!")		
		}
		else {
			game.say(personaje,"Quién es?")
			//game.say(susana,"Soy yo!")
		}
	}
}	

object transformarPersonaje {
	method cambiarVisual(personaje, nuevoVisual) {
		vecindad.personajes().add(nuevoVisual)
		vecindad.personajes().remove(personaje)
		game.removeVisual(personaje)
		game.addVisual(nuevoVisual)
	}
}

object noHacerNada {
	method interactuar(_) {}
}

// --------------

object irA {
	method interactuar(lugar) {
		nivel.cargarMapa(lugar)
	}
}

object accederCarcel {
    method interactuar(mapa) {
        if(susana.tuvo(botines)) {
            nivel.cargarMapa(mapa)
        } else {
            game.say(susana, "Primero debo hablar con Messi")
        }
    }
}

class Dialogo {
	var mensaje = ""
	
	method interactuar(puerta) {game.say(puerta, mensaje)}

}
