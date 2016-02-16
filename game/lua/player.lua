player = {}

function player.load()
	selector = love.graphics.newImage("images/selector.png");
	selector_x, selector_y = 0, 0

	moveplayer = true
	whale_cell_x, whale_cell_y = 3, 2
	whale_x, whale_y = 320/2+320*whale_cell_x, 240/2+240*whale_cell_y

	player_x, player_y = 0, 0
end

function player.draw()

end

function player.math(dt)
	if moveplayer == false then
		local x_or_y = math.random(0,1)
		local move_whale = true

		if x_or_y == 0 then
			if whale_cell_x == 0 then
				whale_cell_x = whale_cell_x + 1
				move_whale = false
			end
			if whale_cell_x == 3 then
				whale_cell_x = whale_cell_x - 1
				move_whale = false
			end
			if whale_cell_x ~= 0 and whale_cell_x ~=3 and move_whale == true then
				local left_or_right = math.random(0,1)

				if left_or_right == 0 then
					whale_cell_x = whale_cell_x - 1
				else 
					whale_cell_x = whale_cell_x + 1
				end
			end
		else
			if whale_cell_y == 0 then
				whale_cell_y = whale_cell_y + 1
				move_whale = false
			end
			if whale_cell_y == 2 then
				whale_cell_y = whale_cell_y - 1
				move_whale = false
			end
			if whale_cell_y ~= 0 and whale_cell_y ~=3 and move_whale == true then
				local up_or_down = math.random(0,1)

				if up_or_down == 0 then
					whale_cell_y = whale_cell_y - 1
				else 
					whale_cell_y = whale_cell_y + 1
				end
			end
		end

		whale_x, whale_y = 320/2+320*whale_cell_x, 240/2+240*whale_cell_y
		moveplayer = true
	end

	if level == 1 then
		if player_x == whale_cell_x and player_y == whale_cell_y then
			player_x, player_y = 0, 0
			selector_x, selector_y = 0, 0
			whale_cell_x, whale_cell_y = 3, 2
			whale_x, whale_y = 320/2+320*whale_cell_x, 240/2+240*whale_cell_y
			level = 2
		end
	end
end

function UPDATE_PLAYER(dt, key)
	player.math(dt)
	--player.move(key)
end

function DRAW_PLAYER()
	player.draw()
end
