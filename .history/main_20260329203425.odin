package main

import "core:fmt"
import k2 "vendor:karl2d"

main :: proc() {

	timer := 0
	k2.init(1200, 780, "Crawling Chaos")

	textures, background, middleground := load_images()
	player := Player{textures, 0, 524, 1, 1, 0, 0, 0, true, true}
	defer k2.shutdown()
	sceneX: f32 = 0
	sceneY: f32 = 0
	gravity: f32 = 0


	for k2.update() {
		player_texture: int
		player_action(&player)
		player.y += gravity
		if player.y < 524 {
			gravity = 1
			if player.forward {player_texture = 0} else {player_texture = 1}
		} else {gravity = 0
			if player.forward {player.texture = pImg_walk} else {player.texture = pImg_walk_left}
		}

		camera := k2.Camera{{player.x, 0}, {-20, 0}, 0, 1}
		k2.set_camera(camera)
		k2.clear(k2.BLUE)
		k2.draw_texture(background, {sceneX, sceneY})
		k2.draw_texture(middleground, {sceneX, sceneY})
		k2.draw_texture(background, {(sceneX + 1200), 0})
		k2.draw_texture(middleground, {(sceneX + 1200), 0})


		if k2.key_is_held(.Right) && player.x < 1250 {
			player.x += 1
			player.forward = true
			player_texture = 0
			if player.animation_frame < 9 {
				if timer % 10 == 0 {
					player.animation_frame += 1
				}
			} else {player.animation_frame = 0}
		}
		if k2.key_is_held(.Left) && player.x > 10 {
			player.x -= 1
			player.forward = false
			player_texture = 1
			if player.animation_frame > 0 {
				if timer % 10 == 0 {
					player.animation_frame -= 1
				}
			} else {player.animation_frame = 9}
		}
		if k2.key_is_held(.Up) {
			player.y -= 3
			if player.forward {
				player_texture = 2
				if player.animation_frame < 9 {
					if timer % 5 == 0 {
						player.animation_frame += 1
					}
				} else {player.animation_frame = 0}
			} else {player_texture = 3
				if player.animation_frame > 0 {
					if timer % 5 == 0 {
						player.animation_frame -= 1
					}
				} else {player.animation_frame = 9}

			}

		}
		// if k2.key_is_held(.Down) {
		// 	player.y += 1
		// }
		if k2.key_is_held(.Space) {
			if player.forward {
				player_texture = 3
				if player.animation_frame < 9 {
					if timer % 5 == 0 {
						player.animation_frame += 1
					}
				} else {player.animation_frame = 0}
			} else {player_texture = 4
				if player.animation_frame > 0 {
					if timer % 5 == 0 {
						player.animation_frame -= 1
					}
				} else {player.animation_frame = 9}

			}

		}
		k2.draw_texture_rect(
			player.textures[player_texture],
			{f32(player.animation_frame * 256), 0, 256, 256},
			{player.x, player.y},
			k2.WHITE,
		)
		k2.present()
		timer += 1


	}

}
