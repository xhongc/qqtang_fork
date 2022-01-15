extends Sprite
const my_part := "hair"
export var role_code := "10101"
var role_action
export var action_x: = "3"
export var action_y: = "0"
var playerJson
var direction_map = {
	"right":"0",
	"left":"2",
	"up":"1",
	"down":"3"
}
func _ready():
	var file = File.new()
	file.open("res://assets/character/hair/hair.json", file.READ)
	# Parse the json and store it
	playerJson = parse_json(file.get_as_text())
	role_action = "stand"
	var png_key = "{my_part}{role_code}_{role_action}_3_0".format({"my_part":my_part,"role_code":role_code,"role_action":role_action})
	var rect_info = playerJson["frames"][png_key]["frame"]
	region_rect= Rect2(rect_info["x"],rect_info["y"],rect_info["w"],rect_info["h"])

func change_hair(direction:String, now_y:String):
	if direction == "idle":
		role_action = "stand"
		now_y = direction_map[now_y]
		var png_key = "{my_part}{role_code}_{role_action}_{now_x}_{now_y}".format({
			"my_part":my_part,
			"role_code":role_code,
			"role_action":role_action,
			"now_x":now_y,
			"now_y":"0"})
		var rect_info = playerJson["frames"][png_key]["frame"]
		region_rect= Rect2(rect_info["x"],rect_info["y"],rect_info["w"],rect_info["h"])
	
	else:
		role_action = "walk"
		var now_x = direction_map[direction]
		var png_key = "{my_part}{role_code}_{role_action}_{now_x}_{now_y}".format({
			"my_part":my_part,
			"role_code":role_code,
			"role_action":role_action,
			"now_x":now_x,
			"now_y":now_y})
		var rect_info = playerJson["frames"][png_key]["frame"]
		region_rect= Rect2(rect_info["x"],rect_info["y"],rect_info["w"],rect_info["h"])
	
