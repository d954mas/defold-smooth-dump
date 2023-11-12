--https://github.com/Sleitnick/AeroGameFramework/blob/master/src/StarterPlayer/StarterPlayerScripts/Aero/Modules/Smooth/SmoothDamp.lua

local SmoothDamp = {}
SmoothDamp.__index = SmoothDamp

function SmoothDamp.new()
	return setmetatable({
		velocity = vmath.vector3(),
		smoothTime = 0.25,
		maxSpeed = math.huge,
		maxDistance = math.huge,
	}, SmoothDamp)
end

function SmoothDamp:update(current, target, dt)
	smooth_dump.smooth_dump_v3(current,target,self.velocity,self.smoothTime, self.maxSpeed, self.maxDistance, dt)
end

return SmoothDamp
