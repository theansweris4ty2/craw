package main

import "core:fmt"
import k2 "vendor:karl2d"

main :: proc() {

	timer := 0
	k2.init(1230, 500, "Crawling Chaos")
	walk, walk_left, attack, attack_left, jump, jump_left, run, run_left, background, middleground, house_a, house_b, crate_stack, house_c, wagon, church :=
		load_images()
	player := Player{walk, 0, 300, 128, 128, 0, 0, 0, true, true, "walk"}
	defer k2.shutdown()
	sceneX: f32 = 0
	sceneY: f32 = 0
	gravity: f32 = 0


	for k2.update() {
		player_action(&player, timer)
		player.y += gravity
		if player.y < 300 {
			gravity = 1
			player.onground = false
			if player.forward {player.texture = jump} else {player.texture = jump_left}
		} else {gravity = 0;player.onground = true
			if player.forward {player.texture = walk} else {player.texture = walk_left}
		}

		camera := k2.Camera{{}, {0, 0}, 0, 1.15}
		camera.target = {clamp(player.x - 300, -450, 1595), clamp(player.y, 0, 0)}
		k2.set_camera(camera)
		k2.clear(k2.LIGHT_BROWN)
		k2.draw_texture(background, {sceneX - 500, sceneY})
		k2.draw_texture(middleground, {sceneX - 500, sceneY})
		k2.draw_texture(background, {sceneX, sceneY})
		k2.draw_texture(middleground, {sceneX, sceneY})
		k2.draw_texture(background, {(sceneX + 533), 0})
		k2.draw_texture(middleground, {(sceneX + 533), 0})
		k2.draw_texture(background, {(sceneX + 1066), 0})
		k2.draw_texture(middleground, {(sceneX + 1066), 0})
		k2.draw_texture(background, {(sceneX + 1599), 0})
		k2.draw_texture(middleground, {(sceneX + 1599), 0})
		k2.draw_texture(background, {(sceneX + 2132), 0})
		k2.draw_texture(middleground, {(sceneX + 2132), 0})
		k2.draw_texture(crate_stack, {400, 690})
		k2.draw_texture(house_c, {300, 225})
		k2.draw_texture(house_b, {800, 165})
		k2.draw_texture(house_a, {1200, 140})
		k2.draw_texture(wagon, {590, 350})
		k2.draw_texture(church, {2000, 0})


		switch (player.action) {
		case "walk":
			player.texture = walk
		case "walk left":
			player.texture = walk_left
		case "jump":
			player.texture = jump
		case "jump left":
			player.texture = jump_left
		case "run":
			player.texture = run
		case "run left":
			player.texture = run_left
		case "attack":
			player.texture = attack
		case "attack left":
			player.texture = attack_left
		}
		k2.draw_texture_rect(
			player.texture,
			{f32(player.animation_frame * 128), 0, 128, 128},
			{player.x, player.y},
			k2.WHITE,
		)
		k2.present()
		timer += 1


	}
	// TODO Write function that loops through all textures and destroys them
	k2.destroy_texture(walk)
	k2.destroy_texture(walk_left)
	k2.destroy_texture(attack)
	k2.destroy_texture(attack_left)
	k2.destroy_texture(jump)
	k2.destroy_texture(jump_left)
	k2.destroy_texture(background)
	k2.destroy_texture(middleground)
	k2.destroy_texture(house_b)
	k2.destroy_texture(crate_stack)
	k2.destroy_texture(house_a)
	k2.destroy_texture(house_c)
	k2.destroy_texture(wagon)
	k2.destroy_texture(church)


}
