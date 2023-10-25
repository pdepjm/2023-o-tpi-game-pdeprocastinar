import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*
import elementos.*
import interacciones.*

class Personaje {
	var position = game.at(0,0)
	
	var image = ""
	var interaccion = noHacerNada
	var interactuaCon = self
	
	method position() = position
	method image() = image
	
	method interactuar() {
		interaccion.interactuar(interactuaCon)
    }
    
    method agregar() {
		game.addVisual(self)
    }
}

const messi = new Personaje(position = game.at(5,8), image = "messi.png", interaccion = hablarConMessi)
const moria = new Personaje(position = game.at(5,8), image = "moria.png", interaccion = hablarConMoria)

const marley = new Personaje(position = game.at(20,3), image = "marley.png", interaccion = hablarConMessi)
const escudero = new Personaje(position = game.at(5,8), image = "escudero.png", interaccion = hablarConEscudero)
const escuderoMuerta = new Personaje(position = game.at(5,8), image = "escudero-dead.png")
const mirtha = new Personaje(position = game.at(8,8), image = "mirtha.png", interaccion = hablarConMirtha)

const betular = new Personaje(position = posicionBetu.right(1), image = "betular.png", interaccion = hablarConBetular)
const betularOculto = new Personaje(position = posicionBetu, image = "betular-arbol.png", interaccion = hablarConBetular)

const posicionesBetular = [game.at(3,17), game.at(0,9), game.at(1,3)]
// revisar como hacer para que se ejecute el anyOne cada vez que se sale de una casa
const posicionBetu = posicionesBetular.anyOne()

const mbappe = new Personaje(position = game.at(5,8), image = "mbappe.png", interaccion = hablarConMessi)