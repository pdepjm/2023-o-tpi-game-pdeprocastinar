import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*
import elementos.*
import personajes.*

// Diálogos e interacciones
object hablarConMessi {
	method interactuar() {
		if(susana.tiene(balonDeOro)) {
			susana.entregar(balonDeOro)
			game.say(messi, "Gracias Su! Tomá la copa :D")
			susana.inventario().add(copa)
			game.schedule(3000, {game.addVisual(pantallaFinal)})
			
// 	method entregarSiTiene para hacer un or en el if y darle si se cumple alguna
		} else if (susana.tiene(botines)) {
			susana.entregar(botines)
			game.say(messi, "Traeme mi balón de oro")
			game.say(messi, "Creo que lo tiene Moria")
			
		} else if (susana.tuvo(botines)) { 
			game.say(messi, "Traeme mi balón de oro")
			game.say(messi, "Creo que lo tiene Moria")
			
		} else {
			game.say(messi, "Hola Su! Ayudame con algo")
			game.say(messi, "pero antes buscame mis botines")
		}
	}
}

object hablarConMoria {
	method interactuar() {
		if(susana.tiene(llaveEscudero)) {
			susana.entregar(llaveEscudero)
			
			game.say(moria, "Te mentí! Yo no tengo el balón de oro")
			game.say(moria, "Andá con la tortuga")
			game.say(moria, "va a saber donde está")
			
			game.schedule(8000, { game.removeVisual(moria) })
			moria.image("moria_llave.png")
			moria.position(game.at(16,16))
			
		} else if (susana.tuvo(llaveEscudero)) {
			game.say(moria, "¿Todavía no encontraste a la tortuga?")
		
		} else if (susana.tiene(collar)) {
			susana.entregar(collar)
			game.say(moria, "Consegui la llave ")
			game.say(moria, "de Silvina Escupidero")
			game.say(moria, "Y yo te voy a dar el balón de oro")
			
			if(!susana.tuvo(veneno) && !susana.tiene(veneno)){
				game.say(moria, "Marley te puede ayudar")
			}		
				
		} else if (susana.tuvo(collar) && !susana.tiene(llaveEscudero) && !susana.tuvo(llaveEscudero)) {
			game.say(moria, "Conseguime la llave de la casa")
			game.say(moria, "de Silvina Escupidero")
			game.say(moria, "Y yo te voy a dar el balón de oro")
			
			if(!susana.tuvo(veneno) && !susana.tiene(veneno)){
				game.say(moria, "Marley te puede ayudar")
			}
			
		} else {
			game.say(moria, "Conseguime el collar de Mirtha")
			game.say(moria, "A ella le gustan los Martin Fierro")
		}	
	}
}

object hablarConMirtha {
	method interactuar(){
		if(susana.tiene(martinFierro)){
			susana.entregar(martinFierro)
			game.say(mirtha,"Otro Martin Fierro para mi!")
			game.say(mirtha,"A cambio te doy mi collar")
			susana.inventario().add(collar)
			
		} else {
			game.say(mirtha,"Como te ven te tratan")
		}
	}
}

object hablarConEscudero {
	method interactuar() {
		if(susana.tiene(torta) && susana.tiene(veneno)) {
			susana.entregar(torta)
			susana.entregar(veneno)
			susana.inventario().add(llaveEscudero)
			game.schedule(4000, { game.say(escudero,"Que rico Su! Muchas gracias") })
			game.schedule(6000, { 
				escudero.image("escudero-dead.png")
				escudero.position(escudero.position().right(1))
			})
			game.schedule(7000, { game.say(susana,"JA, ya tengo sus llaves para Moria") })
	
		} else if(susana.tuvo(collar)){
			game.say(escudero,"Que ganas de comer una rica torta")
			
		} else {
			game.say(escudero,"Amo a mi hermana")
			game.say(escudero,"Amo bailar")
		}
	}
}

object hablarConBetular {
	method interactuar() {
		if(susana.tuvo(collar) && betular.image() == "betular-arbol.png") {
			betular.image("betular.png")
			betular.position(betular.position().right(1))
			
			game.say(betular,"Hola Su! Acá está la torta")
			susana.inventario().add(torta)
					
		} else if(susana.tuvo(collar)){
			game.say(betular,"Espero que te haya gustado la torta")
			
		} else {
			game.say(betular,"SHH! Estoy escondido")
		}
	}
}

object hablarConPimpinela {
	method interactuar() {
		if(susana.tuvo(collar)) {
			game.say(susana,"Chicos, se que estan fumigando")
			game.say(susana,"¿Me prestan veneno para mi casa?")
			game.say(puertaPimpinela,"Toma el veneno Su")
			susana.inventario().add(veneno)
		} else {
			game.say(puertaPimpinela,"Quién es?")
			//game.say(susana,"Soy yo!")
		}
	}
}	

object hablarConTortuga {
	method interactuar() {
		if(susana.tuvo(llaveEscudero) && !susana.tiene(balonDeOro)) {
			game.say(susana,"¿Dónde está el balón de oro?")
			
			mbappe.image("mbappe.png")
			mbappe.position(mbappe.position().left(1))
			
			game.schedule(4000, { game.say(mbappe,"Me descubriste!") })
			game.schedule(4000, { game.say(mbappe,"Toma el balon") })
			susana.inventario().add(balonDeOro)	
		}
	}
}

object hablarConMarley {
	method interactuar() {
		if(susana.tuvo(veneno) && susana.tuvo(torta)) {
			game.say(marley,"Que reyna sos Su! Moria te va")
		game.say(marley,"a indicar como seguir")
		
	} 
	else if(susana.tiene(veneno) && !susana.tiene(torta)){
		game.say(marley,"Betular hace tortas riquisimas, pero")
		game.say(marley,"por algun motivo siempre anda escondido")		
	}
	else if(susana.tiene(torta) && !susana.tiene(veneno)){
		game.say(marley,"Me entere que andan fumigando ")
		game.say(marley," en lo de los pimpinela")
		game.say(marley,"ellos deben tener ")
		game.say(marley," veneno de sobra ")

	}
	else if(susana.tuvo(collar)){
		game.say(marley,"Hora de hacer la gran Yiya Murano:")
		game.say(marley,"torta y veneno! ")
		game.say(marley,"Dales ambos a Silvina ")
		game.say(marley,"y la casa es tuya")
	}
	else if(susana.tiene(collar)){
		game.say(marley,"Ame ese collar, daselo a Moria")
		game.say(marley,"antes de que trate de robartelo...")
	}
	
	else if(susana.tieneOTuvo(botines)){
		game.say(marley,"Que flaquita estas Su! ")
		game.say(marley," Moria esta en la carcel")
		game.say(marley," puede ayudarte con tu objetivo")

	}
	else {
		game.say(marley,"Bienvenida Su! Busca a Messi para ")
		game.say(marley,"saber por donde arrancar")
		game.say(marley, "acercate si necesites ayuda")
		}
	}
}

object mensajeTaylor {
	const mensaje = "Shake it off, Shake it off"
	
	method interactuar() {
		game.say(puertaTaylor, mensaje)
	}
}

object mensajeFort {
	const mensaje = "MAIAMEEE"
	
	method interactuar() {
		game.say(puertaFort, mensaje)
	}
}

// Acceso a escenarios
object accederVecindad {
	method interactuar() {
		susana.irALaPuerta()
		nivel.cargarMapa(vecindad)
		susana.mapaActual(vecindad)
	}
}

object accederCasaMessi {
    method interactuar() {
    	susana.irALaPuerta()
        nivel.cargarMapa(casaMessi)
		susana.mapaActual(casaMessi)
    }
}

object accederCarcel {
    method interactuar() {
        if(susana.tuvo(botines)) {
        	susana.irALaPuerta()
            nivel.cargarMapa(carcelMoria)
            susana.mapaActual(carcelMoria)
            
        } else {
            game.say(susana, "Primero debo hablar con Messi")
        }
    }
}

// -------------------------
object noHacerNada {
	method interactuar() {}
}