import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*




object botines {
    var property position = game.at(7,4)

    method image() = "botin.png"

    method interactuar() {
        susana.agregarA(susana.inventario(), self)
        game.removeVisual(self)
    }
}

object copa {
	
}

object balonDeOro {
	
}

object puerta {
	method image() = "puerta.png"
	
	method interactuar() {
		nivel.cargarMapa(vecindad)
	}
}