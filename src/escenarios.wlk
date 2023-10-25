import wollok.game.*
import susana.*
import configuraciones.*
import personajes.*
import elementos.*

class Puerta {
	var position = game.origin()
	var interaccion = null
	var interactuaCon = self
	var image = "tile.png"

	method image() = image
	method position() = position
	
	method agregar() {
    	game.addVisual(self)
    }
    
    method interactuar() {
    	interaccion.interactuar(interactuaCon)
    }
}

class Escenario {
	var puerta = null
	var puertaSalida = new Puerta(position = game.at(27,2), image = "puerta.png", interaccion = irA, interactuaCon = vecindad )
	
    var mapa = ""    
    var elemento = null
    var propietario = null
    
    var zonasHabilitadas = [new Zona(xIni = 0, xFin = 29, yIni = 0, yFin = 19)]
    var zonasProhibidas = [new Zona(xIni = 0, xFin = 0, yIni = 0, yFin = 0)]

	method zonasHabilitadas() = zonasHabilitadas
    method zonasProhibidas() = zonasProhibidas

	method agregarNoPisables() {}
	
    method puerta() = puerta

    method generar() {
        game.addVisual(mapa)
        game.addVisual(propietario)
        game.addVisual(puertaSalida)
        self.evaluarCondiciones(elemento)
    }

    method evaluarCondiciones(objeto) {
        if (objeto != null) objeto.mostrar()
    }
}

class Visual {
    var image = ""
    var position = game.origin()

    method image() = image
    method position() = position
}


object vecindad {
	var mapa = "vecindad/vecindad-map.png"
    var zonasHabilitadas = [new Zona(xIni = 0, xFin = 29, yIni = 0, yFin = 19)]
    var zonasProhibidas = [ new Zona(xIni = 6, xFin = 7, yIni = 12, yFin = 13), 
	                        new Zona(xIni = 7, xFin = 7, yIni = 2, yFin = 3), 
                            new Zona(xIni = 8, xFin = 11, yIni = 3, yFin = 4),
                            new Zona(xIni = 8, xFin = 11, yIni = 18, yFin = 19),
                            new Zona(xIni = 12, xFin = 12, yIni = 19, yFin = 19), 
                            new Zona(xIni = 15, xFin = 16, yIni = 18, yFin = 18), 
                            new Zona(xIni = 14, xFin = 15, yIni = 13, yFin = 13),
                            new Zona(xIni = 14, xFin = 15, yIni = 9, yFin = 9),
                            new Zona(xIni = 14, xFin = 16, yIni = 1, yFin = 1),
                            new Zona(xIni = 15, xFin = 16, yIni = 2, yFin = 2),
                            new Zona(xIni = 17, xFin = 17, yIni = 7, yFin = 7),
                            new Zona(xIni = 18, xFin = 20, yIni = 8, yFin = 9),
                            new Zona(xIni = 18, xFin = 19, yIni = 0, yFin = 0),
                            new Zona(xIni = 25, xFin = 26, yIni = 4, yFin = 5),
                            new Zona(xIni = 24, xFin = 29, yIni = 19, yFin = 19),
                            new Zona(xIni = 28, xFin = 29, yIni = 2, yFin = 8)
                        	]
                        	
    const partesNoPisables = new Visual(image = "vecindad/vecindad-no-pisable.png")
                        	
    const casaMessi = new Escenario(puerta = puertaMessi, mapa = new Visual(image = "vecindad/casa-map.png"), propietario = messi, elemento = botines)
	const carcelMoria = new Escenario(puerta = puertaCarcel, mapa = new Visual(image = "vecindad/casa-map.png"), propietario = moria, elemento = martinFierro)                    	           	
	
	const puertaMessi = new Puerta(position = game.at(19,7), interaccion = irA, interactuaCon = casaMessi )
	const puertaCarcel = new Puerta(position = game.at(26,18), interaccion = accederCarcel, interactuaCon = carcelMoria )
	const puertaTaylor = new Puerta(position = game.at(8,2), interaccion = new Dialogo(mensaje = "Shake it off, Shake it off"))
	const puertaFort = new Puerta(position = game.at(25,3), interaccion = new Dialogo(mensaje = "MAIAMEEE"))
//	const puertaEscudero = new Puerta(position = game.at(15,17), interaccion = new Dialogo(mensaje = "Casa de Silvina Escudero"))
	const puertaPimpinela = new Puerta(position = game.at(6,11), interaccion = new Dialogo(mensaje = "quien ES?"))
	
	// Saqué la puerta de Escudero, chequear si es realmente necesaria
	const puertasDisponibles = [puertaMessi, puertaCarcel, puertaTaylor, puertaFort, puertaPimpinela]
    const personajes = [mirtha]

	method zonasHabilitadas() = zonasHabilitadas
    method zonasProhibidas() = zonasProhibidas
    
    method agregarNoPisables() {
        game.addVisual(partesNoPisables)
    }
    
    method agregar(listaDeVisuales) {
        listaDeVisuales.forEach({ visual => visual.agregar() })
    }

    method generar() {
        self.agregar(puertasDisponibles)
        self.agregar(personajes)
    }
}



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
