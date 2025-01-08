@tool
extends Resource

class_name SpriteSheet

@export var texture:Texture2D

@export var atlas_textures:Array[AtlasTexture]

@export var row_col:Vector2i

@export var atlas_size:Vector2i

func get_texture_at_pos(pos:Vector2i) -> Texture2D:
	var index:int = pos.x + (pos.y * row_col.x)
	assert(index < atlas_textures.size())
	return atlas_textures[index]

func get_texture_at(x:int, y:int) -> Texture2D:
	var index:int = x + (y * row_col.x)
	assert(index < atlas_textures.size())
	return atlas_textures[index]
