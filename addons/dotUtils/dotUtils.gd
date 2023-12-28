@tool
extends EditorPlugin

#region DEFINITIONS
const dotButtonScript = "res://addons/dotUtils/scripts/dotButton.gd"
const dotButtonIcon = "res://addons/dotUtils/assets/dotButton.svg"

const dotScrollContainerScript = "res://addons/dotUtils/scripts/dotScrollContainer.gd"
const dotScrollContainerIcon = "res://addons/dotUtils/assets/dotScrollContainer.svg"
#endregion

func _enter_tree():
	add_custom_type("dotButton", "Button", preload(dotButtonScript), preload(dotButtonIcon))
	add_custom_type("dotScrollContainer", "ScrollContainer", preload(dotScrollContainerScript), preload(dotScrollContainerIcon))


func _exit_tree():
	remove_custom_type("dotButton")
	remove_custom_type("dotScrollContainer")
