extends NinePatchRect

func _ready() -> void:
	update_display()

func update_display() -> void:
	$items/gaslight.visible = PlayerData.has_gaslight
	$items/cans.visible = PlayerData.has_drink
	$items/casserole.visible = PlayerData.has_casserole
	$items/key.visible = PlayerData.has_key
	$items/finger.visible = PlayerData.has_finger
	$items/feather.visible = PlayerData.has_feather
