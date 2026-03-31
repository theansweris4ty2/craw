package main

import k2 "vendor:karl2d"

load_images :: proc() -> []k2.Texture {
	return

	pImg_walk: k2.Texture = k2.load_texture_from_bytes(#load("./assets/Walk.png"))
	pImg_walk_left: k2.Texture = k2.load_texture_from_bytes(#load("./assets/Walk_left.png"))
	attack: k2.Texture = k2.load_texture_from_bytes(#load("./assets/attack_1.png"))
	attack_left: k2.Texture = k2.load_texture_from_bytes(#load("./assets/attack_1_left.png"))
	jump: k2.Texture = k2.load_texture_from_bytes(#load("./assets/jump.png"))
	jump_left: k2.Texture = k2.load_texture_from_bytes(#load("./assets/jump_left.png"))
	background: k2.Texture = k2.load_texture_from_bytes(#load("./assets/background.png"))
	middleground: k2.Texture = k2.load_texture_from_bytes(#load("./assets/middleground.png"))
}

// player_action :: proc(_: p^) {

// 	if k2.key_is_held(.Right) && p.x < 1250 {
// 		p.x += 1
// 		p.forward = true
// 		p.texture = pImg_walk
// 		if p.animation_frame < 9 {
// 			if timer % 10 == 0 {
// 				p.animation_frame += 1
// 			}
// 		} else {p.animation_frame = 0}
// 	}
// 	if k2.key_is_held(.Left) && p.x > 10 {
// 		p.x -= 1
// 		p.forward = false
// 		p.texture = pImg_walk_left
// 		if p.animation_frame > 0 {
// 			if timer % 10 == 0 {
// 				p.animation_frame -= 1
// 			}
// 		} else {p.animation_frame = 9}
// 	}
// 	if k2.key_is_held(.Up) {
// 		p.y -= 3
// 		if p.forward {
// 			p.texture = jump
// 			if p.animation_frame < 9 {
// 				if timer % 5 == 0 {
// 					p.animation_frame += 1
// 				}
// 			} else {p.animation_frame = 0}
// 		} else {p.texture = jump_left
// 			if p.animation_frame > 0 {
// 				if timer % 5 == 0 {
// 					p.animation_frame -= 1
// 				}
// 			} else {p.animation_frame = 9}

// 		}

// 	}
// 	if k2.key_is_held(.Down) {
// 		p.y += 1
// 	}
// 	if k2.key_is_held(.Space) {
// 		if p.forward {
// 			p.texture = attack
// 			if p.animation_frame < 9 {
// 				if timer % 5 == 0 {
// 					p.animation_frame += 1
// 				}
// 			} else {p.animation_frame = 0}
// 		} else {p.texture = attack_left
// 			if p.animation_frame > 0 {
// 				if timer % 5 == 0 {
// 					p.animation_frame -= 1
// 				}
// 			} else {p.animation_frame = 9}

// 		}

// 	}

// }
