import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*

object botines {
    var property position = game.at(7,4)

    method image() = "botin.png"

    method interactuar() {
        susana.agregarAInventario(self)
        game.removeVisual(self)
        susana.checkpoint(+1)
    }
}

object puerta {
	method image() = "puerta.png"
	
	method interactuar() {
		nivel.cargarMapa(vecindad)
	}
}