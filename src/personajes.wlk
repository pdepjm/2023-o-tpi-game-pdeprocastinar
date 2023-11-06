import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*
import elementos.*
import interacciones.*

class Personaje {
	var property position = game.at(0,0)
	var property image = ""
	
	var property interaccion = noHacerNada
	
	method interactuar() {
		interaccion.interactuar()
    }
    
    method agregar() {
		game.addVisual(self)
    }
}

const messi = new Personaje(position = game.center(), image = "personajes/messi.png", interaccion = hablarConMessi)
const moria = new Personaje(position = game.at(5,5), image = "personajes/moria.png", interaccion = hablarConMoria)
const marley = new Personaje(position = game.at(20,3), image = "personajes/marley.png", interaccion = hablarConMarley)
const escudero = new Personaje(position = game.at(5,8), image = "personajes/escudero.png", interaccion = hablarConEscudero)
const mirtha = new Personaje(position = game.at(8,8), image = "personajes/mirtha.png", interaccion = hablarConMirtha)
const mbappe = new Personaje(position = game.at(28,9), image = "personajes/tortuga.png", interaccion = hablarConTortuga)

// revisar como hacer para que se ejecute el anyOne cada vez que se sale de una casa
const posicionesBetular = [game.at(3,17), game.at(0,9), game.at(1,3)]
const posicionBetu = posicionesBetular.anyOne()
const betular = new Personaje(position = posicionBetu, image = "personajes/betular-arbol.png", interaccion = hablarConBetular)