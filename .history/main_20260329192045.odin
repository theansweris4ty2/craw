package main

// import "core:fmt"
import k2 "vendor:karl2d"

main :: proc() {

	timer := 0
	k2.init(1200, 780, "Crawling Chaos")
	pImg_walk: k2.Texture = k2.load_texture_from_bytes(#load("./assets/Walk.png"))
	pImg_walk_left: k2.Texture = k2.load_texture_from_bytes(#load("./assets/Walk_left.png"))
	attack: k2.Texture = k2.load_texture_from_bytes(#load("./assets/attack_1.png"))
	attack_left: k2.Texture = k2.load_texture_from_bytes(#load("./assets/attack_1_left.png"))
	background: k2.Texture = k2.load_texture_from_bytes(#load("./assets/background.png"))
	middleground: k2.Texture = k2.load_texture_from_bytes(#load("./assets/middleground.png"))

	player := Player{pImg_walk, 0, 524, 1, 1, 0, 0, 0, true}
	defer k2.shutdown()


	for k2.update() {
		camera := k2.Camera{{player.x, 0}, {0, 0}, 0, 1}
		k2.set_camera(camera)
		k2.clear(k2.BLUE)
		k2.draw_texture(background, {0, 0})
		k2.draw_texture(middleground, {0, 0})
		k2.draw_texture(background, {1200, 0})
		k2.draw_texture(middleground, {1200, 0})

		if k2.key_is_held(.Right) {
			player.x += 1
			player.forward = true
			player.texture = pImg_walk
			if player.animation_frame < 9 {
				if timer % 10 == 0 {
					player.animation_frame += 1
				}
			} else {player.animation_frame = 0}
		}
		if k2.key_is_held(.Left) {
			player.x -= 1
			player.forward = false
			player.texture = pImg_walk_left
			if player.animation_frame > 0 {
				if timer % 10 == 0 {
					player.animation_frame -= 1
				}
			} else {player.animation_frame = 9}
		}
		if k2.key_is_held(.Up) {
			player.y -= 1
		}
		if k2.key_is_held(.Down) {
			player.y += 1
		}
		if k2.key_is_held(.Space) {
			if player.forward {
				player.texture = attack
				if player.animation_frame < 9 {
					if timer % 5 == 0 {
						player.animation_frame += 1
					}
				} else {player.animation_frame = 0}
			} else {player.texture = attack_left
				if player.animation_frame > 0 {
					if timer % 5 == 0 {
						player.animation_frame -= 1
					}
				} else {player.animation_frame = 9}

			}

		}
		k2.draw_texture_rect(
			player.texture,
			{f32(player.animation_frame * 256), 0, 256, 256},
			{player.x, player.y},
			k2.WHITE,
		)
		k2.present()
		timer += 1


	}

}
