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
	if rand_range(1, 10) < 9:
		$Calendar/Weekday.text = weekdays[date["weekday"]]
		$Calendar/Month.text = months[date["month"]-1]
		$Calendar/Date.text = str(date["day"])
		$Calendar/Quote.text = quotes[date["weekday"]]
	else:
		$Calendar/Weekday.text = "Stop checking the calendar"
		$Calendar/Month.text = "AND GET BACK TO"
		$Calendar/Date.text = "WORK"
		$Calendar/Quote.text = "DO NOT FORGET: YOU ARE HERE FOREVER"
		yield(get_tree().create_timer(0.2), "timeout")
		$Calendar/Weekday.text = weekdays[date["weekday"]]
		$Calendar/Month.text = months[date["month"]-1]
		$Calendar/Date.text = str(date["day"])
		$Calendar/Quote.text = quotes[date["weekday"]]

var quotes := [
	"Which is the real nightmare? The dream you woke up from, or what awaits you when you awake?",
	"Stupid boss? If your boss were smarter, you wouldn't have a job, would you?",
	"Better a friend of the Working Class than a member.",
	"The reward for your good work is more work.",
	"Moral Integrity is the courage to speak out and be fired first.",
	"You will miss 100% of the shots you take.",
	"Yes, we are out to get you. It makes no difference.",
]
