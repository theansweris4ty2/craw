package main

// import "core:fmt"
import k2 "vendor:karl2d"

main :: proc() {

	// player: k2.Texture = k2.load_texture_from_bytes(#load("./assets/Walk.jpg"))

	k2.init(1200, 780, "Crawling Chaos")
	player: k2.Texture = k2.load_texture_from_bytes(#load("./assets/Walk.jpg"))

	defer k2.shutdown()

	for k2.update() {
		k2.clear(k2.BLUE)
		k2.draw_text("Hello World", {100, 100}, 30)
		// k2.draw_texture(player, {100, 100}, k2.WHITE)
		k2.present()
	}

}
