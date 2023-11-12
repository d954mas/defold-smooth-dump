-- https://stackoverflow.com/questions/61372498/how-does-mathf-smoothdamp-work-what-is-it-algorithm

local function clamp(x, min, max)
	return x < min and min or (x > max and max or x)
end

local SmoothDamp = {}
SmoothDamp.__index = SmoothDamp

function SmoothDamp.new()
	return setmetatable({
		smoothTime = 1,
		maxSpeed = math.huge,
		currentVelocity = 0,
		maxDelta = 0.001
	}, SmoothDamp)
end

function SmoothDamp:update(current, target, dt)
	-- Based on Game Programming Gems 4 Chapter 1.10
	local smoothTime = math.max(0.0001, self.smoothTime)
	local omega = 2 / smoothTime

	local x = omega * dt;
	local exp = 1 / (1 + x + 0.48 * x * x + 0.235 * x * x * x);
	local change = current - target;
	local originalTo = target;

	-- Clamp maximum speed
	local maxChange = self.maxSpeed * smoothTime;
	change = clamp(change, -maxChange, maxChange);
	target = current - change;

	local temp = (self.currentVelocity + omega * change) * dt;
	self.currentVelocity = (self.currentVelocity - omega * temp) * exp;
	local output = target + (change + temp) * exp;

	-- Prevent overshooting
	if ((originalTo - current > 0.0) == (output > originalTo)) then
		output = originalTo;
		self.currentVelocity = (output - originalTo) / dt;
	end
	if (math.abs(target - output) < self.maxDelta) then
		self.currentVelocity = 0
		return target
	end
	return output;
end

return SmoothDamp
