import wollok.game.*
import susana.*
import configuraciones.*
import personajes.*
import elementos.*
import interacciones.*

class Puerta {
	var position = game.origin()
	var interaccion = null
	
	var property sonido = "audio/puerta-cerrada.ogg"

	method image() = "tile.png"
	method position() = position
	
	method agregar() {
        game.addVisual(self)
    }
    
    method interactuar() {
        interaccion.interactuar()
        game.sound(sonido).play()
    }
}

class Escenario {
	var puerta = null
	
	var salida = game.origin()
	var puertaSalida = new Puerta(position = salida, interaccion = accederVecindad )
	
    var image = ""    
    var elemento = null
    var propietario = null
    
    const zonasHabilitadas = [new Zona(xIni = 0, xFin = 29, yIni = 0, yFin = 19)]
    const zonasProhibidas = [new Zona(xIni = 0, xFin = 0, yIni = 0, yFin = 0)]

	// Posicion que toma Susana al momento de volver a la vecindad
	method posInicialSusana() = puerta.position().down(1)

	method position() = game.origin()
	method image() = image
	
	method agregarNoPisables() {}
	
    method puerta() = puerta

    method sePuedeAcceder(pos) = zonasHabilitadas.any({ zona => zona.quedaEnZona(pos) }) && zonasProhibidas.all({ zona => !zona.quedaEnZona(pos) })

	//Evaluar si necesitamos realmente este método
    method eliminarPropietario(){
        game.removeVisual(propietario)
    }
    
    method generar() {
        game.addVisual(self)
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
    const zonasHabilitadas = [new Zona(xIni = 0, xFin = 29, yIni = 0, yFin = 19)]
    const zonasProhibidas = [new Zona(xIni = 6, xFin = 7, yIni = 12, yFin = 13), 
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
                        	
    const partesNoPisables = new Visual(image = "escenarios/vecindad-no-pisable.png")
	
	const puertasDisponibles = [puertaMessi, puertaCarcel, puertaTaylor, puertaFort, puertaPimpinela]
    const personajes = [mirtha, escudero, betular, mbappe, marley]
    
    method personajes() = personajes
    
	method posInicialSusana() = game.at(19,3)
    
    method sePuedeAcceder(pos) = zonasHabilitadas.any({ zona => zona.quedaEnZona(pos) }) && zonasProhibidas.all({ zona => !zona.quedaEnZona(pos) })
    
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


const casaMessi = new Escenario(puerta = puertaMessi, salida = game.at(16,4), image = "escenarios/casa-messi-map.png", propietario = messi, elemento = botines, zonasHabilitadas = [ new Zona(xIni = 8, xFin = 11, yIni = 14, yFin = 15), 
                                                                                                                                                                new Zona(xIni = 8, xFin = 10, yIni = 7, yFin = 13), 
                                                                                                                                                                new Zona(xIni = 7, xFin = 7, yIni = 9, yFin = 11), 
                                                                                                                                                                new Zona(xIni = 11, xFin = 18, yIni = 7, yFin = 10), 
                                                                                                                                                                new Zona(xIni = 10, xFin = 20, yIni = 6, yFin = 6), 
                                                                                                                                                                new Zona(xIni = 18, xFin = 22, yIni = 11, yFin = 13), 
                                                                                                                                                                new Zona(xIni = 19, xFin = 22, yIni = 8, yFin = 9), 
                                                                                                                                                                new Zona(xIni = 16, xFin = 16, yIni = 4, yFin = 5), 
                                                                                                                                                                new Zona(xIni = 23, xFin = 23, yIni = 8, yFin = 13)
                                                                                                                                                            ])

const carcelMoria = new Escenario(puerta = puertaCarcel, salida = game.at(16,10), image = "escenarios/carcel-map.png", propietario = moria, elemento = martinFierro, zonasHabilitadas = [ new Zona(xIni = 0, xFin = 12, yIni = 2, yFin = 3), 
                                                                                                                                                                new Zona(xIni = 11, xFin = 12, yIni = 4, yFin = 9),
                                                                                                                                                                new Zona(xIni = 13, xFin = 18, yIni = 8, yFin = 9),
                                                                                                                                                                new Zona(xIni = 19, xFin = 20, yIni = 2, yFin = 9),
                                                                                                                                                                new Zona(xIni = 20, xFin = 29, yIni = 2, yFin = 3), 
                                                                                                                                                                new Zona(xIni = 20, xFin = 29, yIni = 2, yFin = 3), 
                                                                                                                                                                new Zona(xIni = 20, xFin = 29, yIni = 2, yFin = 3),
                                                                                                                                                                new Zona(xIni = 5 , xFin = 5, yIni = 4, yFin = 5),
                                                                                                                                                                new Zona(xIni = 16 , xFin = 16, yIni = 10, yFin = 10),
                                                                                                                                                                new Zona(xIni = 26, xFin = 26, yIni = 4, yFin = 5)
                                                                                                                                                            ])

// puertas de entrada                                                                                                                                                                                                                                                                                                                                                         
const puertaMessi = new Puerta(position = game.at(19,7), interaccion = accederCasaMessi, sonido = "audio/abrir-puerta.ogg" )
const puertaCarcel = new Puerta(position = game.at(26,18), interaccion = accederCarcel)
const puertaTaylor = new Puerta(position = game.at(8,2), interaccion = mensajeTaylor, sonido = "audio/Taylor.mp3")
const puertaFort = new Puerta(position = game.at(25,3), interaccion = mensajeFort, sonido = "audio/Fort.mp3")
const puertaPimpinela = new Puerta(position = game.at(6,11), interaccion = hablarConPimpinela, sonido = "audio/Pimpinela.mp3")