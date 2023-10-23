import wollok.game.*
import susana.*
import configuraciones.*
import personajes.*
import elementos.*

class CasaNoJugable {
    var puerta = game.origin()
    var dialogos = {}
    
    method puerta() = puerta
    
    method interactuar() = dialogos
}

    const casaEscudero = new CasaNoJugable(puerta = game.at(15,17), dialogos = {})
	const casaFort = new CasaNoJugable(puerta = game.at(25,3), dialogos = {})
	const casaPimpinela = new CasaNoJugable(puerta = game.at(5,11), dialogos = {})
	const casaTaylor = new CasaNoJugable(puerta = game.at(8,2), dialogos = {})

class Escenario inherits CasaNoJugable {
    var mapa = ""
    var elemento = null
    var propietario = null
    
    // Probar unificar interaccion con dialogos (CasaNoJugable)
    var interaccion = { irA.interactuar(self) }
    
    var zonasHabilitadas = [new Zona(xIni = 0, xFin = 29, yIni = 0, yFin = 19)]
    var zonasProhibidas = [new Zona(xIni = 0, xFin = 0, yIni = 0, yFin = 0)]

	method zonasHabilitadas() = zonasHabilitadas
    method zonasProhibidas() = zonasProhibidas
    
	override method interactuar() = interaccion

    method generar() {
        game.boardGround(mapa)
        game.addVisual(propietario)
        self.evaluarCondiciones(elemento)
    }

    method evaluarCondiciones(objeto) {
        if (objeto != null) objeto.mostrar()
    }
}

// Verificar como hacemos para instanciarlo dentro de la clase y accederlo desde otro objeto
const casaMessi = new Escenario(puerta = game.at(19,7), mapa = "vecindad/casa-map.png", propietario = messi, elemento = botines)
const carcelMoria = new Escenario(puerta = game.at(24,17), mapa = "vecindad/casa-map.png", propietario = moria, elemento = martinFierro)


object vecindad {
	var mapa = "vecindad/vecindad-map.png"
    var zonasHabilitadas = [new Zona(xIni = 0, xFin = 29, yIni = 0, yFin = 19)]
    var zonasProhibidas = [ new Zona(xIni = 5, xFin = 6, yIni = 12, yFin = 13), 
	                        new Zona(xIni = 7, xFin = 7, yIni = 2, yFin = 3), 
	                        new Zona(xIni = 8, xFin = 9, yIni = 3, yFin = 4), 
	                        new Zona(xIni = 10, xFin = 11, yIni = 3, yFin = 4),
	                        new Zona(xIni = 9, xFin = 12, yIni = 18, yFin = 19),
	                        new Zona(xIni = 12, xFin = 12, yIni = 19, yFin = 19), 
	                        new Zona(xIni = 15, xFin = 16, yIni = 18, yFin = 18), 
	                        new Zona(xIni = 14, xFin = 15, yIni = 13, yFin = 13),
	                        new Zona(xIni = 15, xFin = 16, yIni = 9, yFin = 9),
	                        new Zona(xIni = 14, xFin = 16, yIni = 1, yFin = 1),
	                        new Zona(xIni = 15, xFin = 16, yIni = 2, yFin = 2),
	                        new Zona(xIni = 17, xFin = 17, yIni = 7, yFin = 7),
	                        new Zona(xIni = 18, xFin = 20, yIni = 8, yFin = 9),
	                        new Zona(xIni = 18, xFin = 19, yIni = 0, yFin = 0),
	                        new Zona(xIni = 25, xFin = 26, yIni = 4, yFin = 5),
	                        new Zona(xIni = 24, xFin = 29, yIni = 19, yFin = 19),
	                        new Zona(xIni = 28, xFin = 29, yIni = 2, yFin = 8)
                        	]
	
	const puertasDisponibles = [casaMessi, carcelMoria, casaEscudero, casaFort, casaPimpinela, casaTaylor]

	method zonasHabilitadas() = zonasHabilitadas
    method zonasProhibidas() = zonasProhibidas
    
    method agregarPuertas() {
    	puertasDisponibles.forEach({ casa => baldosaCollide.colision(casa.puerta()) })
    }

    method generar() {
        game.boardGround(mapa)
        self.agregarPuertas()
    }
}

//const vecindad = new Escenario(mapa = "vecindad/vecindad-map.png",
//                                zonasProhibidas = [ new Zona(xIni = 5, xFin = 6, yIni = 12, yFin = 13), 
//                                new Zona(xIni = 7, xFin = 7, yIni = 2, yFin = 3), 
//                                new Zona(xIni = 10, xFin = 11, yIni = 4, yFin = 5),
//                                new Zona(xIni = 9, xFin = 12, yIni = 18, yFin = 19),
//                                new Zona(xIni = 12, xFin = 12, yIni = 19, yFin = 19), 
//                                new Zona(xIni = 15, xFin = 16, yIni = 18, yFin = 18), 
//                                new Zona(xIni = 14, xFin = 15, yIni = 13, yFin = 13),
//                                new Zona(xIni = 15, xFin = 16, yIni = 9, yFin = 9),
//                                new Zona(xIni = 14, xFin = 16, yIni = 1, yFin = 1),
//                                new Zona(xIni = 15, xFin = 16, yIni = 2, yFin = 2),
//                                new Zona(xIni = 17, xFin = 17, yIni = 7, yFin = 7),
//                                new Zona(xIni = 18, xFin = 20, yIni = 8, yFin = 9),
//                                new Zona(xIni = 18, xFin = 19, yIni = 0, yFin = 0),
//                                new Zona(xIni = 25, xFin = 26, yIni = 4, yFin = 5),
//                                new Zona(xIni = 24, xFin = 29, yIni = 19, yFin = 19),
//                                new Zona(xIni = 28, xFin = 29, yIni = 2, yFin = 8)     
//                                ]
//                            )

object irA {
	method interactuar(lugar) {
		nivel.cargarMapa(lugar)
	}
}

object accederCarcel {
    method interactuar() {
        if(susana.tuvo(botines)) {
            nivel.cargarMapa(carcelMoria)
        } else {
            game.say(susana, "Primero debo hablar con Messi")
        }
    }
}

object dialogos {
	method casaMessi() {game.say(casaMessi, "Casa de Messi")}
	method carcelMoria() {game.say(carcelMoria, "Carcel")}
//	method casaEscudero() {game.say(casaEscudero, "Casa de Silvina Escudero")}
//	method casaFort() {game.say(casaFort, "Casa de Ricky Fort")}
//	method casaPimpinela() {game.say(casaPimpinela, "Casa de Pimpinela")}
//	method casaTaylor() {game.say(casaTaylor, "Casa de Taylor Swift")}
}
