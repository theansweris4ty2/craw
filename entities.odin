package main
import k2 "vendor:karl2d"

Player :: struct {
	texture:         k2.Texture,
	x, y:            f32,
	width, height:   f32,
	srcX, srcY:      f32,
	animation_frame: int,
	forward:         bool,
	onground:        bool,
	action:          string,
}

Object :: struct {
	texture:       k2.Texture,
	x, y:          f32,
	width, height: f32,
	collider:      bool,
}
/* TODO Create game struct

Game :: struct {
layers: []k2.texture,
player: ^Player, 
objects: []Object
}
*/
