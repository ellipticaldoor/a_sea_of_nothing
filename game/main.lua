require "/lua/background"
require "/lua/front"
require "/lua/player"

math.randomseed( os.time() )

function love.load()
	-- Cambiar resolución
	love.window.setMode(1280, 720)
	--love.window.setMode(1440, 900, {vsync = true, fullscreen = "true"})
	width = 1280
	height = 720

	level = 0
	
	f = love.graphics.newFont( "fonts/Red_Alert_INET.ttf", 48 )
	love.graphics.setFont(f)

	--Loading classes
	love.mouse.setVisible(false)

	bg.load()
	player.load()
	front.load()
end

function love.update(dt)
	UPDATE_BG(dt)
	UPDATE_PLAYER(dt)
	UPDATE_FRONT(dt)
	local fps=love.timer.getFPS
	love.window.setTitle("A Sea of Nothing - LD29 "..fps().." FPS")
end

function love.draw()
	DRAW_BG()
	DRAW_PLAYER()
	DRAW_FRONT()
end

function love.keypressed(key)
	if key == 'escape' then love.event.quit() end

	if key == 'return' or key == ' ' then
		if level == 0 then level = 1 end
		if level == 2 then level = 0 end
	end

	if moveplayer == true and level == 1 then
		if key == 'd' or key == 'right' and selector_x < 960 then
			selector_x = selector_x + 320
			player_x = player_x + 1
			moveplayer = false
		end
		if key == 'a' or key == 'left' and selector_x > 0 then
			selector_x = selector_x - 320
			player_x = player_x - 1
			moveplayer = false
		end
		if key == 'w' or key == 'up' and selector_y > 0 then
			selector_y = selector_y - 240
			player_y = player_y - 1
			moveplayer = false
		end
		if key == 's' or key == 'down' and selector_y < 480 then
			selector_y = selector_y + 240
			player_y = player_y + 1
			moveplayer = false
		end
	end
end
