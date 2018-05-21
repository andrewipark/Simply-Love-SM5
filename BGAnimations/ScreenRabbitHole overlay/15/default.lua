-- Connection: Chapter 2

local scenes = {}
local duration = { 10, 15, 26, 22, 49 }

local scene2 = { date="May 25, 2008", body="\"Hey! Will you take our picture?\"\n\nWith tripod and camera in hand, I spun around to see three teens approaching me. They were apparently on their way out of the carnival that I, too, had just left.\n\n\"Why?\" I asked, somewhat stupefied by their request.\n\n\"Why not?\" one of the girls responded with a giggle and a bubbly smile.\n\nI paused to consider this, but rapidly concluded that any contemplation of the matter was inane.\n\n\"Absolutely. I'll take your picture.\"\n\n\"Now you can remember us forever!\" They let out a collective giggle before disappearing into the night." }
local scene3 = { song="15/dreams.ogg", date="August 3, 2008", body="I had another dream about her last night.\n\nWhen I first entered, she smiled and gave me a hug.  I could see the corners of her lips curling upward in a sign of affection and feel her arms pressing into my back, holding me close to her body for the embrace.  I could sense the warmth from her torso diffusing into mine.  I could smell the fragrance from her shampoo in her hair.  When she kissed me, I could taste the flavor of her lip gloss and feel the warmth of her lips pressed against my own.  And when she whispered I love you into my ear, I not only heard it, but felt the words tickling the inner recesses of my ear.\n\nBeing there with her, in that moment, I believed it." }

local scene4 = {
	{ author="Ben", startTyping=0.4, send=9.4, words="You said, once, to me that you live for the next good thing." },
	{ author="Ben", startTyping=10, send=12.8, words="What if nothing good were to come?" },
	{ author="Zoe", delay=16, words="We'll see." },
	{ author="Zoe", delay=18.8, words="The track record favors it, though." },
}
local scene5 = {
	delay=0.095,
	width=420,
	song="14/monarchButterflies.ogg",
	header="FROM: Zoe\nTO: Ben\nDATE: Jan-05-2006\nSUBJECT: get to know you\n---------------------------------------------------------",
	body="Ben,\nIt's me, Zoe.  I IMed you the other day about your blog.\n\nI'm interested in learning about you, Ben.\nAbout why you write,\nabout your depression,\nabout your time in a psych ward.\n\nThen we can move to more general topics, like books or movies.\nI like to start friendships backwards, you know?\n\nI won't ask you questions, just tell me whatever you want\nand maybe later I'll discreetly prod you to further\nexplain certain areas.\n\nYou should come online more often.\n-Zoe"
}


local af = LoadActor(THEME:GetPathB("ScreenRabbitHole", "overlay/_shared/Connection/Stage.lua"), {duration=duration, scenes=scenes})

af[#af+1] = LoadActor(THEME:GetPathB("ScreenRabbitHole", "overlay/14/title.lua"), 2)..{
	InitCommand=function(self) scenes[1] = self end,
	OnCommand=function(self) self:queuecommand("StartScene") end
}


-- scene 2: Will you take our picture?
af[#af+1] = LoadActor("./blog.lua", scene2)..{
	InitCommand=function(self)
		scenes[2] = self
		self:visible(false)
	end,
}

-- scene 3: I had another dream about her last night
af[#af+1] = LoadActor("./blog.lua", scene3)..{
	InitCommand=function(self)
		scenes[3] = self
		self:visible(false)
	end,
}

-- scene 4: what if nothing good were to come?
af[#af+1] = LoadActor( THEME:GetPathB("ScreenRabbitHole", "overlay/14/im-window.lua"), scene4 )..{
	InitCommand=function(self)
		scenes[4] = self
		self:visible(false)
	end,
}

-- scene 5: I'm interested in learning about you
af[#af+1] = LoadActor(THEME:GetPathB("ScreenRabbitHole", "overlay/14/email.lua"), scene5 )..{
	InitCommand=function(self)
		scenes[5] = self
		self:visible(false)
	end,
}

af[#af+1] = LoadActor(THEME:GetPathB("ScreenRabbitHole", "overlay/_shared/Connection/Proceed.lua"))

return af