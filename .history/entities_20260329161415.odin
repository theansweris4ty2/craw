package main
import k2 "vendor:karl2d"

Player :: struct {
	texture:         k2.Texture,
	x, y, dx, dy:    f64,
	animation_frame: int,
}
