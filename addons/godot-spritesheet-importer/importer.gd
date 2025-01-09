@tool
extends EditorImportPlugin

const image_extensions:Array[String] = [".png"]

func _get_visible_name() -> String:
	return "SpriteSheet"

func _get_importer_name():
	return "imagename.spritesheet"

func _get_recognized_extensions() -> PackedStringArray:
	return ["spritesheet"]

func _get_save_extension():
	return "res"

func _get_resource_type():
	return "Resource"

func _get_import_order() -> int:
	return 0

func _get_priority():
	return 1.0

func _get_preset_name(preset_index: int) -> String:
	match preset_index:
		0: return "Default"
		1: return "16x16"
		2: return "32x32"
		3: return "48x48"
		4: return "64x64"
		5: return "96x96"
		6: return "128x128"
		7: return "144x144"
		8: return "256x256"
		9: return "512x512"
	return ""

func _get_preset_count():
	return 10

func _get_option_visibility(path: String, option_name: StringName, options: Dictionary) -> bool:
	return true

func _get_import_options(path, preset_index):
	match preset_index:
		0:
			return [{
					   "name": "grid_size",
					   "default_value": Vector2i(64, 64)
					}]
		1:
			return [{
					   "name": "grid_size",
					   "default_value": Vector2i(16, 16)
					}]
		2:
			return [{
					   "name": "grid_size",
					   "default_value": Vector2i(32, 32)
					}]
		3:
			return [{
					   "name": "grid_size",
					   "default_value": Vector2i(48, 48)
					}]
		4:
			return [{
					   "name": "grid_size",
					   "default_value": Vector2i(64, 64)
					}]
		5:
			return [{
					   "name": "grid_size",
					   "default_value": Vector2i(96, 96)
					}]
		6:
			return [{
					   "name": "grid_size",
					   "default_value": Vector2i(128, 128)
					}]
		7:
			return [{
					   "name": "grid_size",
					   "default_value": Vector2i(144, 144)
					}]
		8:
			return [{
					   "name": "grid_size",
					   "default_value": Vector2i(256, 256)
					}]
		9:
			return [{
					   "name": "grid_size",
					   "default_value": Vector2i(512, 512)
					}]
		_:
			return []

func _import(
		source_file: String, 
		save_path: String, 
		options: Dictionary, 
		platform_variants: Array[String], 
		gen_files: Array[String]
	) -> Error:
	var sheet:= SpriteSheet.new()
	var texture:Texture2D = null
	for ext in image_extensions:
		var image_path:String = source_file.replace(".spritesheet", ext)
		if ResourceLoader.exists(image_path):
			texture = load(image_path)
	if texture == null:
		printerr("missing Texture Image File.")
		return ERR_DOES_NOT_EXIST
	
	var size:Vector2i = options["grid_size"]
	
	var atlases:Array[AtlasTexture] = []
	var image:Image = texture.get_image()
	var image_size:Vector2i = image.get_size()
	
	for y in range(0, image_size.y, size.y):
		for x in range(0, image_size.x, size.x):
			var rect:Rect2 = Rect2(x, y, size.x, size.y)
			var region:AtlasTexture = AtlasTexture.new()
			region.atlas = texture
			region.region = rect
			atlases.append(region)
	
	sheet.texture = texture
	sheet.atlas_textures = atlases
	sheet.row_col = Vector2i(image_size.x / size.x, image_size.y / size.y)
	sheet.atlas_size = size
	
	return ResourceSaver.save(sheet, "%s.%s" % [save_path, _get_save_extension()])
