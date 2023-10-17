import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*


class Elemento {
    var property position = game.at(0,0)

    method image() = ""

    method interactuar() {
        susana.agregarA(susana.inventario(), self)
        game.removeVisual(self)
    }
}


object botines inherits Elemento {
    override method position() = game.at(7,4)

    override method image() = "botin.png"

}

object copa inherits Elemento {
	
}

object balonDeOro inherits Elemento {
	
}

object collar inherits Elemento {
	
}

object llaveEscudero inherits Elemento {
	
}

object puerta inherits Elemento {
	override method image() = "puerta.png"
	
	override method interactuar() {
		nivel.cargarMapa(vecindad)
	}
}

object martinFierro inherits Elemento {
    override method position() = game.at(7,4)

    override method image() = "martinFierro.png"
	
}