package main

// import "core:fmt"
import k2 "vendor:karl2d"

main :: proc() {


	k2.init(1200, 780, "Crawling Chaos")
	pImg: k2.Texture = k2.load_texture_from_bytes(#load("./assets/Walk.jpg"))

	player := make(Player{pImg, 0, 0, 1, 1, 0})
	defer k2.shutdown()
	defer free(Player)

	for k2.update() {
		k2.clear(k2.BLUE)
		k2.draw_texture_rect(
			player.image,
			{player.animation_frame, player.y, 0, 128, 128},
			{100, 100},
			k2.WHITE,
		)
		k2.present()
	}

}
