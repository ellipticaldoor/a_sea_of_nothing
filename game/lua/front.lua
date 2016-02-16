front = {}

function front.load()
	whale = love.graphics.newImage("images/whale.png");

	system = love.graphics.newParticleSystem(whale, 10000)

	system:setEmissionRate(100)
	system:setSpeed(1,2)
	-- starting size to ending size
	system:setSizes(1)
	-- location of the emitter (x,y)
	system:setPosition(love.mouse.getX(), love.mouse.getY())
	-- how long the emitter lasts, -1 is infinite
	system:setEmitterLifetime(-1)
	-- how long the particles last min, max in seconds
	system:setParticleLifetime(2,3.5)
	-- sets the direction in radians
	system:setDirection(.90)
	-- maximum distance from emitter (distributon, x, y)
	system:setAreaSpread("normal",15,15)
	-- colors for the particles, can have many
	system:setColors(251,43,105,200 
					,255,91,55,175
					,255,204,0,163
					,82,237,199,150
					,90,200,251,125
					,198,68,252,113
					,88,88,214,100
					)
	system:start()
end

function front.draw()
	if level == 1 then
		love.graphics.setBackgroundColor(255,255,255)
		love.graphics.draw(system)

		-- Mar
		love.graphics.setColor(255, 255, 255, 255/1.05)
		love.graphics.draw(sea_bg, 0, 0)
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.draw(selector, selector_x, selector_y)
	end

	if level == 2 then
		love.graphics.setBackgroundColor(255,255,255)
		love.graphics.draw(system)
		love.graphics.draw(win, 0, 0)
	end
end

function front.math(dt)
	if level == 2 then
		system:setPosition(410, 390)
	else
		system:setPosition(whale_x, whale_y)
	end
	system:update(dt)
end

function UPDATE_FRONT(dt)
	front.math(dt)
end

function DRAW_FRONT()
	front.draw()
end
