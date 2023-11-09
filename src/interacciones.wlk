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
			game.say(messi, "¡Gracias Su!")
			game.say(messi, "La copa del mundo es tuya")
			susana.recibir(copa)
			game.schedule(3000, {
				game.addVisual(pantallaFinal)
				musica.cambiarMusica(musica.fondo(), musica.final())
			})
			
		} else if(susana.tuvo(botines)) { 
			game.say(messi, "Recuperame mi balón de oro,")
			game.say(messi, "creo que lo tiene Moria")

		} else if(susana.tiene(botines)) {
			susana.entregar(botines)
			game.say(messi, "Recuperame mi balón de oro,")
			game.say(messi, "creo que lo tiene Moria")
			
		} else {
			game.say(messi, "¡Hola Su! Necesito ayuda")
			game.say(messi, "con algo, pero antes,")
			game.say(messi, "¿me traes mis botines?")
		}
	}
}

object hablarConMoria {
	method interactuar() {
		if(susana.tuvo(llaveEscudero)) {
			game.say(moria, "¿Todavía no encontraste a la tortuga?")
			
		} else if(susana.tiene(llaveEscudero)) {
			susana.entregar(llaveEscudero)
			
			game.say(moria, "¡Te mentí! Yo no tengo")
			game.say(moria, "el balón de oro")
			game.say(moria, "Andá con la tortuga")
			game.say(moria, "y te vas a sorprender")
			
			game.schedule(7000, { game.removeVisual(moria) })
			game.schedule(7100, { moria.image("personajes/moria_llave.png") })
			game.schedule(7100, { moria.position(game.at(16,16)) })
			vecindad.personajes().add(moria)
			
		} else if(susana.tuvo(collar) && !susana.tieneOTuvo(llaveEscudero)) {
			game.say(moria, "Gracias mi amor! Pero antes")
			game.say(moria, "de poder darte el balón")
			game.say(moria, "necesito una casa para vivir")
			game.say(moria, "Quiero la de Silvina Escupidero")
			
			if(!susana.tieneOTuvo(veneno)){
				game.say(moria, "Marley te puede ayudar")
			}
		
		} else if(susana.tiene(collar)) {
			susana.entregar(collar)
			game.say(moria, "¡Gracias mi amor! Pero antes")
			game.say(moria, "de poder darte el balón")
			game.say(moria, "necesito una casa para vivir")
			game.say(moria, "Quiero la de Silvina Escupidero")
			
			if(!susana.tieneOTuvo(veneno)){
				game.say(moria, "Marley te puede ayudar")
			}		
			
		} else if(susana.tuvo(botines)) {
			game.say(moria, "¿Así que querés")
			game.say(moria, "el balón de oro?")
			game.say(moria, "Hagamos algo, conseguime")
			game.say(moria, "un collar para reemplazar")
			game.say(moria, "el que me robé y es tuyo.")
			game.say(moria, "Conozco a alguien que te")
			game.say(moria, "puede dar uno:")
			game.say(moria, "Aunque ya tenga muchos")
			game.say(moria, "Martin Fierro,")
			game.say(moria, "ella siempre quiere más")
			
		} else {
			game.say(moria, "El decorado se calla")
		}
	}
}

object hablarConMirtha {
	method interactuar() {
		if(susana.tiene(martinFierro)) {
			susana.entregar(martinFierro)
			game.say(mirtha,"¡Muchas gracias querida!")
			game.say(mirtha,"Mi Martin Fierro número mil,")
			susana.recibir(collar)
			game.say(mirtha,"tomá mi collar")
			game.say(mirtha,"en agradecimiento")
			
		} else {
			game.say(mirtha,"Como te ven te tratan")
			game.say(mirtha,"Si te ven mal, te maltratan")
			game.say(mirtha,"y si te ven bien, te contratan")
		}
	}
}

object hablarConEscudero {
	method interactuar() {
		if(susana.tiene(torta) && susana.tiene(veneno)) {
			susana.entregar(torta)
			susana.entregar(veneno)
			susana.recibir(llaveEscudero)
			game.schedule(2000, { game.say(escudero,"¡Que rico! Muchas gracias") })
			game.schedule(3000, { 
				escudero.image("personajes/escudero-dead.png")
				escudero.position(escudero.position().right(1))
			})
			game.schedule(4000, { game.say(susana,"¡Por fin tengo las llaves!") })
	
		} else if(susana.tuvo(collar) && escudero.image() != "personajes/escudero-dead.png") {
			game.say(escudero,"Que ganas de comer una rica torta")	
			
		} else if(escudero.image() == "personajes/escudero.png") {
			game.say(escudero,"Amo a mi hermana")
			game.say(escudero,"Amo bailar")
		}
	}
}

object hablarConBetular {
	method interactuar() {
		if(susana.tuvo(collar) && betular.image() == "personajes/betular-arbol.png") {
			betular.image("personajes/betular.png")
			betular.position(betular.position().right(1))
			game.say(betular,"¡Hola Su! Acá está la torta")
			susana.recibir(torta)		
			
		} else if(susana.tuvo(collar)) {
			game.say(betular,"Espero que te haya gustado la torta")
			
		} else {
			game.say(betular,"¡SHH! Estoy escondido")
		}
	}
}

object hablarConPimpinela {
	method interactuar() {
		game.say(puertaPimpinela,"¿Quién es?")

		if(susana.tuvo(collar) && !susana.tieneOTuvo(veneno)) {
			game.schedule(1000, { game.say(susana,"Chicos, se que estan fumigando") })
			game.schedule(1000, { game.say(susana,"¿Me prestan veneno para mi casa?") })
			game.schedule(4000, { game.say(puertaPimpinela,"Tomá el veneno Su") })
			game.schedule(4000, { susana.recibir(veneno) })
		}
	}
}	

object hablarConTortuga {
	method interactuar() {
		if(susana.tuvo(llaveEscudero) && !susana.tiene(balonDeOro)) {
			game.say(susana,"¿Dónde está el balón de oro?")
			mbappe.image("personajes/mbappe.png")
			
			game.schedule(2000, { game.say(mbappe,"¡Me descubriste!") })
			game.schedule(2000, { game.say(mbappe,"Tomá el balon") })
			game.schedule(2500, { susana.recibir(balonDeOro) })
		}
	}
}

object hablarConMarley {
	method interactuar() {
		if(susana.tiene(balonDeOro)) {
			game.say(marley,"¡Qué genia Su!")
			game.say(marley,"Dáselo a Messi")
			game.say(marley,"así conseguís la copa")
			
		} else if(susana.tuvo(llaveEscudero)) {
			game.say(marley,"Vos hacé lo que te diga")
			game.say(marley,"la ONE")

		} else if(susana.tiene(llaveEscudero)) {
			game.say(marley,"¿Conseguiste la llave?")
			game.say(marley,"No te tenía tan hábil")
			game.say(marley,"Llevasela a Moria")
		
		} else if(susana.tiene(veneno) && !susana.tiene(torta)) {
			game.say(marley,"Betular hace tortas riquisimas, pero")
			game.say(marley,"por algun motivo siempre anda escondido")		
		
		} else if(susana.tiene(torta) && !susana.tiene(veneno)) {
			game.say(marley,"Me entere que andan fumigando")
			game.say(marley,"en lo de Pimpinela,")
			game.say(marley,"ellos deben tener")
			game.say(marley,"veneno de sobra")
		
		} else if(susana.tuvo(collar)) {
			game.say(marley,"¿Así que necesitás la")
			game.say(marley,"casa de Silvina?")
			game.say(marley,"Hora de hacer la gran Yiya Murano:")
			game.say(marley,"¡torta y veneno!")
			game.say(marley,"Dale ambos a Silvina")
			game.say(marley,"y la casa es tuya")
		
		} else if(susana.tiene(collar)) {
			game.say(marley,"Dale el collar a Moria")
			game.say(marley,"capaz la sacan de la cárcel")
		
		} else if(susana.tiene(martinFierro)) {
			game.say(marley,"Ya sabés a quien")
			game.say(marley,"darle el Martin Fierro")
		
		} else if(susana.tuvo(botines)) {
			game.say(marley,"¿No te acordás? Moria está")
			game.say(marley,"en la carcel. ¡Se robó")
			game.say(marley,"un collar en Paraguay!")
		
		} else if(susana.tiene(botines)) {
			game.say(marley,"¡Dale los botines a Messi!")
		
		} else {
			game.say(marley,"¡Bienvenida Su! Me dijeron que")
			game.say(marley,"tenés que conseguir la copa")
			game.say(marley,"del mundo para tu programa.")
			game.say(marley,"¡Buscalo a Messi!")
			game.say(marley,"Preguntame si necesitás ayuda")
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
		susana.position(game.at(16,6))
        nivel.cargarMapa(casaMessi)
		susana.mapaActual(casaMessi)
    }
}

object accederCarcel {
    method interactuar() {
        if(susana.tuvo(botines)) {
			puertaCarcel.sonido("audio/abrir-puerta.ogg")
			susana.position(game.at(16,9))
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
