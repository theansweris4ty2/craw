package main

import "core:fmt"
import k2 "vendor:karl2d"

load_images :: proc(
) -> (
	k2.Texture,
	k2.Texture,
	k2.Texture,
	k2.Texture,
	k2.Texture,
	k2.Texture,
	k2.Texture,
	k2.Texture,
	k2.Texture,
	k2.Texture,
) {

	walk: k2.Texture = k2.load_texture_from_bytes(#load("./assets/Walk.png"))
	walk_left: k2.Texture = k2.load_texture_from_bytes(#load("./assets/Walk_left.png"))
	attack: k2.Texture = k2.load_texture_from_bytes(#load("./assets/attack_1.png"))
	attack_left: k2.Texture = k2.load_texture_from_bytes(#load("./assets/attack_1_left.png"))
	jump: k2.Texture = k2.load_texture_from_bytes(#load("./assets/jump.png"))
	jump_left: k2.Texture = k2.load_texture_from_bytes(#load("./assets/jump_left.png"))
	run: k2.Texture = k2.load_texture_from_bytes(#load("./assets/run.png"))
	run_left: k2.Texture = k2.load_texture_from_bytes(#load("./assets/run_left.png"))
	background: k2.Texture = k2.load_texture_from_bytes(#load("./assets/background.png"))
	middleground: k2.Texture = k2.load_texture_from_bytes(#load("./assets/middleground.png"))


	return walk,
		walk_left,
		attack,
		attack_left,
		jump,
		jump_left,
		run,
		run_left,
		background,
		middleground
}

player_action :: proc(p: ^Player, timer: int) {

	if k2.key_is_held(.Right) && p.x < 1250 {

		if k2.key_is_held(.R) {
			p.x -= 3
			p.action = "run"
		} else {p.x += 1;p.action = "walk"}
		p.forward = true
		if p.animation_frame < 9 {
			if timer % 10 == 0 {
				p.animation_frame += 1
			}
		} else {p.animation_frame = 0}
	}
	if k2.key_is_held(.Left) && p.x > 10 {
		if k2.key_is_held(.R) {
			p.x -= 3
			p.action = run_left
		} else {p.x -= 1;p.action = "walk left"}

		p.forward = false

		if p.animation_frame > 0 {
			if timer % 10 == 0 {
				p.animation_frame -= 1
			}
		} else {p.animation_frame = 9}
	}
	if k2.key_is_held(.Up) {
		p.y -= 3
		if p.forward {
			p.action = "jump"
			if p.animation_frame < 9 {
				if timer % 5 == 0 {
					p.animation_frame += 1
				}
			} else {p.animation_frame = 0}
		} else {p.action = "jump left"
			if p.animation_frame > 0 {
				if timer % 5 == 0 {
					p.animation_frame -= 1
				}
			} else {p.animation_frame = 9}

		}

	}
	if k2.key_is_held(.Down) {
		p.y += 1
	}
	if k2.key_is_held(.Space) {
		if p.forward {
			p.action = "attack"
			if p.animation_frame < 9 {
				if timer % 5 == 0 {
					p.animation_frame += 1
				}
			} else {p.animation_frame = 0}
		} else {p.action = "attack left"
			if p.animation_frame > 0 {
				if timer % 5 == 0 {
					p.animation_frame -= 1
				}
			} else {p.animation_frame = 9}

		}

	}


}
