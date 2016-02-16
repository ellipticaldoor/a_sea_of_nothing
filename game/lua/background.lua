bg = {}

function bg.load()
	-- Mar
	sea_bg = love.graphics.newImage("/images/sea.png")
	intro = love.graphics.newImage("/images/intro.png")
	win = love.graphics.newImage("/images/win.png")

	-- Celdas del mar
	sea = {}
	sea.red = {}
	sea.green = {}
	sea.blue = {}

	for i = 1, 4 do
		sea.red[i] = {}
		sea.green[i] = {}
		sea.blue[i] = {}
		for j = 1, 3 do
			sea.red[i][j] = math.random(0,255)
			sea.green[i][j] = math.random(0,255)
			sea.blue[i][j] = math.random(0,255)
		end
	end
end

function bg.draw()
	if level == 0 then
		love.graphics.setColor(255, 255, 255)
		love.graphics.draw(intro, 0, 0)
	end

	if level == 1 then
		-- Fondo
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle("fill", 0, 0, width, height)

		-- Mar
		for i = 1, 4 do
			for j = 1, 3 do
				love.graphics.setColor(sea.red[i][j], sea.green[i][j], sea.blue[i][j])
				love.graphics.rectangle("fill", 320 * i - 320, 240 * j - 240, 320, 240) 
			end
		end
	end


end

function bg.math(dt)
	for i = 1, 4 do
		for j = 1, 3 do
			sea.red[i][j] = sea.red[i][j] + dt * 49
			sea.green[i][j] = sea.green[i][j] + dt * 50
			sea.blue[i][j] = sea.blue[i][j] + dt * 51
		end
	end
end

function UPDATE_BG(dt)
	bg.math(dt)
end

function DRAW_BG()
	bg.draw()
end
