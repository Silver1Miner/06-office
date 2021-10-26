extends HBoxContainer

onready var mail_headings = $mail_headings
onready var mail_heading = $mail_content/label/Label
onready var mail_text = $mail_content/content/Content
onready var from_text = $mail_content/NinePatchRect/HBoxContainer/VBoxContainer/from

func _ready() -> void:
	populate_email_list()
	populate_email_content(0)

func populate_email_list() -> void:
	mail_headings.clear()
	#for item in PlayerData.current_emails:
	for item in len(emails):
		var title = emails[item]["title"]
		if len(title) > 19:
			title = title.substr(0, 19) + "..."
		mail_headings.add_item(title, null, true)
		mail_headings.set_item_tooltip_enabled(item, false)
	mail_headings.select(0, true)

func populate_email_content(index: int) -> void:
	mail_heading.text = emails[index]["title"]
	mail_text.text = emails[index]["text"]
	from_text.text = emails[index]["from"]
	mail_text.scroll_to_line(0)

func _on_mail_headings_item_selected(index: int) -> void:
	populate_email_content(index)

var emails := [
{"title": "EVERYTHING IS FINE",
"from": "Me",
"text": """Everything is absolutely fine. There is absolutely nothing wrong. This job is great.
"""},
{"title": "ANNOUNCEMENTS TO ALL EMPLOYEES",
"from": "Human Resources",
"text": """1. From now on, Employees are required to wear their Augumented Reality (AR) glasses at all times. Failure to wear your AR will lead to disciplinary action up to termination.

2. Following the massive success of the removal of the 'New Message' option from email clients for employees ranked level 16 and below, we have implementated a new AI control system on Email reply and forward privileges. Starting today, if the AI judges that you do not need to reply to or forward a message, clicking on the reply and forward buttons will have no result.

3. We are proud to announce that our research scientists have declared that they have found 'no significant evidence' of the company provided energy drinks causing hallucinations, delirium, paranoia, or nightmares.
"""},
{"title": "NEW QUOTA",
"from": "Director of Engineering",
"text": """Your image tagging daily quota is now: 6

Do NOT exceed your daily quota.

Some employees have recently submitted reports raising concerns that they are being asked to repeatedly tag the same images and questioned if the number of pictures in the pool are limited, and if repeated pictures count toward the quota.

There is no cause for concern. If employees receive the same image, they are to continue tagging as normal. All images, without regard to whether they are duplicate or not, are to be tagged and count toward the quota.

Even if employees received the exact same image every time, they would be required to tag as usual, even if it mean tagging the exact same image fifty times in a single day. The quota is the only thing that employees need concern themselves with.
"""},
{"title":"CHANGES TO EMPLOYMENT AGREEMENT",
"from": "Human Resources",
"text": """The 'At Will' employment policy now only applies from the employer perspective. Employees are no longer permitted to initiate termination of employment.

Employees who wish to terminate their employment must first submit a petition to their manager and request a X-7 form to complete and give to their manager.
"""},
{"title":"FW: EXCERPT FROM THE PSYCHOLOGY OF TIME",
"from": "Milton",
"text": """Hey whiz kid, you like science, right? I thought you'd appreciate this article.

EXCERPT FROM PART IV: TIME LOOPS

One appeal of time loops is, perhaps obviously, the idea of being able to fix past mistakes by reliving them. However, upon thinking further about the deeper implications, most would probably find the concept of time loops rather horrifying.

Human psychology is very dependent on narratives, particularly linear narratives. We take comfort in causality, in understanding a linear flow from cause to effect in an understandable way. Time loops completely break this comforting paradigm.

Time loops trigger the natural phobia of being trapped. People already fear being trapped in a single space. Imagine how much more horrific it would be trapped in a single time.

Perhaps Hell is not a place, but a time, the same time looped over and over and overall again."""},
{"title":"RE: SHIP DATE WHEN?",
"from": "Michael",
"text": """Am I going crazy, or have we been working on 'training' this exact same AI for months now? Years? Is this thing ever going to actually be used for anything? When is this thing going to ship?

And what's with all the repeating image tag assignments we get? It's getting really, really obvious that there's a limited pool of possible image assignments, and what's worse that pool is SHRINKING. I swear last week I saw only 12 unique images overall. And there's talk of setting the quota at 6 a day?

Something feels really off about this whole project."""},
{"title":"FROM THE DESK OF THE COO",
"from": "Office of the COO",
"text": """Dearest Employees,

As your Chief Operations Officer, I am proud to announce that we have beaten our latest quarterly earnings goal by 17.3%

We are all very pleased by this result and thank you for your service. In celebration, we are raising our next quarter's earnings goal by 17.3%
"""},
{"title":"RE: HELL",
"from": "Samuel",
"text": """How would you know if you were in hell? Think about it. The doubt of not knowing for sure would add to the torment, wouldn't it?
"""},
]
