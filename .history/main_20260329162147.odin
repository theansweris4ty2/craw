package main

// import "core:fmt"
import k2 "vendor:karl2d"

main :: proc() {


	k2.init(1200, 780, "Crawling Chaos")
	pImg: k2.Texture = k2.load_texture_from_bytes(#load("./assets/Walk.jpg"))

	player := Player{pImg, 0, 0, 1, 1, 0}
	defer k2.shutdown()


	for k2.update() {
		k2.clear(k2.BLUE)
		if k2.key_is_held(k2.key.RIGHT) {
			player.x += 1
		}
		k2.draw_texture_rect(
			player.image,
			{player.animation_frame * (128), 0, 0, (player.x + 128), (player.y + 128)},
			{100, 100},
			k2.WHITE,
		)
		k2.present()
	}

}
