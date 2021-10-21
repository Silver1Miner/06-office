extends NinePatchRect

func _ready() -> void:
	update_display()

func update_display() -> void:
	$items/gaslight.visible = PlayerData.has_gaslight
