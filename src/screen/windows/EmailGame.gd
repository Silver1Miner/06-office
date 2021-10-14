extends HBoxContainer

onready var mail_headings = $mail_headings
onready var mail_heading = $mail_content/Label
onready var mail_text = $mail_content/Content

func _ready() -> void:
	populate_email_list()
	populate_email_content(0)

func populate_email_list() -> void:
	for item in len(emails):
		mail_headings.add_item(emails[item]["title"], null, true)
	mail_headings.select(0, true)

func populate_email_content(index: int) -> void:
	mail_heading.text = emails[index]["title"]
	mail_text.text = emails[index]["text"]
	mail_text.scroll_to_line(0)

var emails := [
	{"title": "ANNOUNCEMENTS TO ALL EMPLOYEES",
"text": """1. From now on, Employees are required to wear their Augumented Reality (AR) glasses at all times. Failure to wear your AR will lead to disciplinary action up to termination of employment.
	
2. Following the massive success of the removal of the 'New Message' option from email clients for employees ranked level 16 and below, we have implementation a new AI control system on Email reply and forward privileges. Starting today, if the AI judges that you do not need to reply to or forward a message, clicking on the reply and forward buttons will have no result.

3. We are proud to announce that our research scientists have declared that they have found 'no significant evidence' of company provided energy drinks causing hallucinations, delirium, paranoia, or nightmares.
"""},
	{"title": "NEW QUOTA",
"text": """Your image tagging daily quota is now: 10

Some employees have recently submitted reports raising concerns that they are being asked to repeatedly tag the same images and questioned if the number of pictures in the pool are limited, and if repeated pictures count toward the quota.

There is no cause for concern. If employees receive the same image, they are to continue tagging as normal. All images, without regard to whether they are duplicate or not, are to be tagged and count toward the quota.

Even if employees received the exact same image every time, they would be required to tag as usual, even if it mean tagging the exact same image fifty times in a single day. The quota is the only thing that employees need concern themselves with.
"""},
	{"title":"CHANGES TO EMPLOYMENT AGREEMENT",
"text": """The 'At Will' employment policy now only applies from the employer perspective. Employees are no longer permitted to initiate termination of employment.
		
Employees who wish to terminate their employment must first submit a petition to their manager and request a X-7 form to complete and give to their manager.
"""},
]

func _on_mail_headings_item_selected(index: int) -> void:
	populate_email_content(index)
