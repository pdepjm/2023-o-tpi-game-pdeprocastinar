import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*
import elementos.*
import personajes.*

object hablarConMessi {
	method interactuar(personaje) {
		if(susana.tiene(balonDeOro)) {
			susana.entregar(balonDeOro)
			game.say(personaje, "Gracias Su! Tomá la copa :D")
			susana.agregarA(susana.inventario(), copa)
// method entregarSiTiene para hacer un or en el if y darle si se cumple alguna
		} else if (susana.tiene(botines)) {
			susana.entregar(botines)
			game.say(personaje, "Conseguime mi balón de oro")
			game.say(personaje, "Creo que lo tiene Moria")
			
		} else if (susana.tuvo(botines)) { 
			game.say(personaje, "Conseguime mi balón de oro")
			game.say(personaje, "Creo que lo tiene Moria")
			
		} else {
			game.say(personaje, "Hola Su! Tengo que pedirte un favor")
			game.say(personaje, "Antes buscame mis botines")
		}
	}
}

object hablarConMoria {
	method interactuar(personaje) {
		if(susana.tiene(llaveEscudero)) {
			susana.entregar(llaveEscudero)
			game.say(personaje, "Te mentí! Yo no tengo el balón de oro")
			game.say(personaje, "Andá con la tortuga")
			game.say(personaje, "Ella va a saber donde está")
			
		} else if (susana.tiene(collar)) {
			susana.entregar(collar)
			game.say(personaje, "Conseguime la casa de Silvina Escupidero")
			game.say(personaje, "Y yo te voy a dar el balón de oro")
			
		} else if (susana.tuvo(collar) && !susana.tiene(llaveEscudero)) {
			game.say(personaje, "Conseguime la casa de Silvina Escupidero")
			game.say(personaje, "Y yo te voy a dar el balón de oro")
			
		} else {
			game.say(personaje, "Conseguime el collar de Mirtha")
			game.say(personaje, "A ella le gustan los Martin Fierro")
		}	
	}

}

object hablarConMirtha {
	method interactuar(personaje){
		if(susana.tiene(martinFierro)){
			susana.entregar(martinFierro)
			game.say(personaje,"Otro Martin Fierro para mi!")
			game.say(personaje,"A cambio te doy mi collar")
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
			susana.agregarA(susana.inventario(), llaveEscudero)
			transformarPersonaje.cambiarVisual(personaje, escuderoMuerta)
			game.say(susana,"JA, ya tengo sus llaves para Moria")
		
		} else if(susana.tuvo(collar)){
			game.say(personaje,"Que ganas de comer una rica torta")
		}
		else {
			game.say(personaje,"Amo a mi hermana")
			game.say(personaje,"Amo bailar")
		}
	}
}

object hablarConBetular {
	method interactuar(personaje) {
		if(susana.tuvo(collar) && personaje == betularOculto) {
			transformarPersonaje.cambiarVisual(personaje, betular)
			game.say(betular,"Acá está la torta")
			susana.agregarA(susana.inventario(), torta)
					
		} else if(susana.tuvo(collar)){
			game.say(personaje,"Espero que te haya gustado la torta")
		}
		else {
			game.say(personaje,"SHH! Estoy escondido")
		}
	}
}


object hablarConPimpinela {
	method interactuar(personaje) {
		if(susana.tuvo(collar)) {
			//game.say(susana,"Chicos, se que estan fumigando")
			//game.say(susana,"¿Me prestan veneno para mi casa?")
			game.say(personaje,"Toma el veneno Su")
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

object hablarConTortuga {
	method interactuar(personaje) {
		if(susana.tuvo(llaveEscudero)) {
			game.say(susana,"¿Dónde está el balón de oro?")
			transformarPersonaje.cambiarVisual(personaje, mbappe)
			game.say(mbappe,"Me descubriste! Toma el balon")
			susana.agregarA(susana.inventario(), balonDeOro)	
		}
	}
}

object hablarConMarley {
	method interactuar(personaje) {
		if(susana.tuvo(veneno) && susana.tuvo(torta)) {
			game.say(personaje,"Que reyna sos Su! Moria te va")
			game.say(personaje,"a indicar como seguir"
			
		} else if(susana.tiene(veneno) && !susana.tiene(torta)){
			game.say(personaje,"Betular hace tortas riquisimas, pero")
			game.say(personaje,"por algun motivo siempre anda escondido")		
		}
		else if(susana.tiene(torta) && !susana.tiene(veneno)){
			game.say(personaje,"Me entere que los Pimpinela andan fumigando, ")
			game.say(personaje,"ellos deben tener veneno de sobra")
		}
		else if(susana.tuvo(collar)){
			game.say(personaje,"Hora de hacer la gran Yiya Murano:")
			game.say(personaje,"torta y veneno! Dales ambas a Silvina")
			game.say(personaje,"y la casa es tuya")
		}
		else if(susana.tiene(collar)){
			game.say(personaje,"Ame ese collar, daselo a Moria")
			game.say(personaje,"antes de que trate de robartelo...")
		}
		}
		else if(susana.tuvo(botines)){
			game.say(personaje,"Que flaquita estas Su! Moria esta")
			game.say(personaje,"en la carcel, ella puede ayudarte con tu objetivo")
		}
		else {
			game.say(personaje,"Bienvenida Su! Busca a Messi para ")
			game.say(personaje,"saber por donde arrancar")
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
