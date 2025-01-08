@tool
extends Node2D

@export var sprite_2d: Sprite2D

const MAID_WALK_SPRITE_SHEET_RESOURCE = preload("res://example/sprite/maid_walk.spritesheet")

func _enter_tree() -> void:
	sprite_2d.texture = MAID_WALK_SPRITE_SHEET_RESOURCE.get_texture_at(0,1)
