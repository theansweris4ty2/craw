package main
import k2 "vendor:karl2d"

Player :: struct {
	texture:         k2.Texture,
	x, y, dx, dy:    f32,
	srcX, srcY:      f32,
	animation_frame: int,
	forward:         bool,
	onground:        bool,
	action:          string,
}
