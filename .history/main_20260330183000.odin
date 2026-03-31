package main

import "core:fmt"
import k2 "vendor:karl2d"

main :: proc() {

	timer := 0
	k2.init(1200, 780, "Crawling Chaos")
	walk, walk_left, attack, attack_left, jump, jump_left, background, middleground := load_images(
		
	)
	player := Player{walk, 0, 524, 1, 1, 0, 0, 0, true, true, "walk"}
	defer k2.shutdown()
	sceneX: f32 = 0
	sceneY: f32 = 0
	gravity: f32 = 0


	for k2.update() {
		player_action(&player, timer)
		player.y += gravity
		if player.y < 524 {
			gravity = 1
			if player.forward {player.texture = jump} else {player.texture = jump_left}
		} else {gravity = 0
			if player.forward {player.texture = walk} else {player.texture = walk_left}
		}

		camera := k2.Camera{{player.x, 0}, {-20, 0}, 0, 1}
		k2.set_camera(camera)
		k2.clear(k2.BLUE)
		k2.draw_texture(background, {sceneX, sceneY})
		k2.draw_texture(middleground, {sceneX, sceneY})
		k2.draw_texture(background, {(sceneX + 1200), 0})
		k2.draw_texture(middleground, {(sceneX + 1200), 0})


		switch (player.action) {
		case "walk":
			player.texture = walk
		case "walk left":
			player.texture = walk_left
		case "jump":
			player.texture = jump
		case "jump left":
			player.texture = jump_left
		case "attack":
			player.texture = attack
		case "attack left":
			player.texture = attack_left
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
	k2.destroy_texture(walk)
	k2.destroy_texture(walk_left)
	k2.destroy_texture(attack)
	k2.destroy_texture(attack_left)
	k2.destroy_texture(jump)
	k2.destroy_texture(jump_left)
	k2.destroy_texture(background)
	k2.destroy_texture(middleground)


}
