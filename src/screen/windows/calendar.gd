extends Window

var date = {}
var weekdays = ["Sunday", "Monday", "Tuesday",
"Wednesday", "Thursday", "Friday", "Saturday"]
var months = ["JANUARY", "FEBRUARY", "MARCH",
"APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER",
"OCTOBER", "NOVEMBER", "DECEMBER"]

func _ready() -> void:
	date = OS.get_date()
	refresh()

func refresh() -> void:
	randomize()
	if rand_range(1, 20) < 19:
		$Calendar/Weekday.text = weekdays[date["weekday"]]
		$Calendar/Month.text = months[date["month"]-1]
		$Calendar/Date.text = str(date["day"])
	else:
		$Calendar/Weekday.text = "Stop checking the calendar"
		$Calendar/Month.text = "AND GET BACK TO"
		$Calendar/Date.text = "WORK"
		yield(get_tree().create_timer(0.2), "timeout")
		$Calendar/Weekday.text = weekdays[date["weekday"]]
		$Calendar/Month.text = months[date["month"]-1]
		$Calendar/Date.text = str(date["day"])
