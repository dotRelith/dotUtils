extends ScrollContainer

var initial_mouse_pos

func _ready() -> void:
	self.gui_input.connect(_on_gui_input)
	self.get_child(0).top_level = false #just so i don't have to turn it on/off every single time
	await get_tree().process_frame
	var expected_position = self.get_child(0).size/2 - self.size/2
	self.scroll_horizontal = expected_position.x
	self.scroll_vertical = expected_position.y

func _process(_delta) -> void:
	if initial_mouse_pos != null:
		var current_mouse_pos := get_viewport().get_mouse_position()
		var difference_since_start = initial_mouse_pos - current_mouse_pos
		self.scroll_horizontal += difference_since_start.x
		self.scroll_vertical += difference_since_start.y
		initial_mouse_pos = current_mouse_pos

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		initial_mouse_pos = get_viewport().get_mouse_position()
	if event is InputEventMouseButton and event.is_released() and event.button_index == 1:
		initial_mouse_pos = null
