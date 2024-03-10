live_auto_call

if(state == states.dead || state == states.dresser || other.state == 1)
	exit

x = other.x
y = other.y
xscale = other.image_xscale
state = states.normal
other.plr = self
if(movespeed >= other.minspeed)
	movespeed += other.force
else
	movespeed = other.minspeed
other.state = 1