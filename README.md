# SmoothDump

Add 2 SmoothDump functions:
1)Float
2)Vector3

## Installation
__1)__ Add defold-smooth-dump in your own project as a Defold library dependency. Open your game.project file and in the dependencies field under project add:
https://github.com/d954mas/defold-smooth-dump/archive/refs/tags/1.0.0.zip

## SmoothDump float
```lua
local SmoothDump = require "smooth_dump.smooth_dump"
...
----- https://stackoverflow.com/questions/61372498/how-does-mathf-smoothdamp-work-what-is-it-algorithm
self.smooth_dump = SmoothDump.new()
--default values
self.smooth_dump.smoothTime = 1
self.smooth_dump.maxSpeed = math.huge
self.smooth_dump.currentVelocity = 0
self.smooth_dump.maxDelta = 0.001

local current_value = 10
local target_value = 100

current_value = self.smooth_dump:update(current_value,target_value, dt)
...
```

## SmoothDump vector3
```lua
local SmoothDumpV3 = require "smooth_dump.smooth_dump_v3"
...
---https://github.com/Sleitnick/AeroGameFramework/blob/master/src/StarterPlayer/StarterPlayerScripts/Aero/Modules/Smooth/SmoothDamp.lua

self.smooth_dump_v3 = SmoothDumpV3.new()
--default values
self.smooth_dump_v3.velocity = vmath.vector3()
self.smooth_dump_v3.smoothTime = 0.25
self.smooth_dump_v3.maxSpeed = math.huge
self.smooth_dump_v3.maxDistance = math.huge

local current_value = vmath.vector3(0,0,0)
local target_value =  vmath.vector3(0,0,-1)

--result saved in current_value vector
self.smooth_dump_v3:update(current_value,target_value, dt)
...
```

## Example

This repository based on https://github.com/indiesoftby/defold-scene3d (12.11.2023)
Changed camera 3d script for smooth dump

https://github.com/d954mas/defold-smooth-dump/blob/e7a66feb75663a8629b030133941d9763a7f369d/scene3d/camera/camera3d.script#L72
`
