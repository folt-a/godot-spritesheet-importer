@tool
extends EditorPlugin

var import_plugin

func get_name():
	return "Spritesheet Importer"

func _enter_tree():
	import_plugin = preload("res://addons/godot-spritesheet-importer/importer.gd").new()
	add_import_plugin(import_plugin)

func _exit_tree():
	remove_import_plugin(import_plugin)
	import_plugin = null
