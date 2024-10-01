import niveles.*
import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"
}



object silvestre {

	method image() = "silvestre.png"

	method position() = game.at(self.restriccion(), 0)

	method restriccion()=pepita.position().x().max(3)
	}