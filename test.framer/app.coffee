# States are the different appearance options of a layer. 
# In this example, we set up a card and a TextLayer, then add a 360° rotation onClick.
# Another common use is the “on” and “off” states of a toggle.
# Learn more here: framer.com/getstarted/guide/#states

# Set up background
Screen.backgroundColor = "#EEE"

	

# Switch states on click
# Variables
pageCount = 8
gutter = 60

# Create PageComponent
pageScroller = new PageComponent
	point: Align.center
	width: Screen.width / 2
	height: Screen.height / 2
	scrollVertical: false
	clip: false

# Loop to create pages
for index in [0...pageCount]
	page = new Layer
		size: pageScroller.size
		x: (pageScroller.width + gutter) * index
		backgroundColor: "#00AAFF"
		hueRotate: index * 20
		parent: pageScroller.content

	page.onClick ->
		pageScroller.snapToPage(this)
		page.animate
			rotation: page.rotation + 90
			options:
				curve: Spring(damping: 0.5)

