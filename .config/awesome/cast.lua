---------------------------------------------------------------------------
-- Corner layout.
-- Display master client in a cast of the screen, and slaves in one
-- column and one row around the master.
-- See Pull Request for example : https://github.com/awesomeWM/awesome/pull/251
-- @module awful.layout
-- @author Alexis Brenon &lt;brenon.alexis+awesomewm@gmail.com&gt;
-- @copyright 2015 Alexis Brenon

-- Grab environment we need
local client = require("awful.client")
local ipairs = ipairs
local math = math
local capi = {screen = screen}

do
    local beautiful = require("beautiful")
    local beautiful_init = beautiful.init
    beautiful.init = function(config)
        beautiful_init(config)
        beautiful.layout_castnw = beautiful.layout_cornernw
        beautiful.layout_castne = beautiful.layout_cornerne
        beautiful.layout_castsw = beautiful.layout_cornersw
        beautiful.layout_castse = beautiful.layout_cornerse
    end
end

-- Actually arrange clients of p.clients for cast layout
-- @param p Mandatory table containing required informations for layouts
-- (clients to arrange, workarea geometry, etc.)
-- @param orientation String indicating in which cast is the master window.
-- Available values are : NE, NW, SW, SE
local function do_cast(p, orientation)
    local t = p.tag or capi.screen[p.screen].selected_tag
    local wa = p.workarea
    local cls = p.clients

    if #cls == 0 then return end

    local master = {}
    local column = {}
    local row = {}
    -- Use the nmaster field of the tag in a cheaty way
    local row_privileged = ((cls[#cls].screen.selected_tag.master_count % 2) == 0)

    --local master_factor = cls[1].screen.selected_tag.master_width_factor
    --master.width = master_factor * wa.width
    --master.height = master_factor * wa.height

    master.width = 1920
    master.height = 1080
    --master.width = 1930
    --master.height = 1270

    --cls[#cls].screen.selected_tag.master_width_factor = 0.01
      -- = math.min(math.max(wa.width/master_factor, 0.01), 0.99)
    --client.setwfact(math.min(math.max(0.99,0.01), 0.01), cls[#cls])


    local number_privileged_win = math.ceil((#cls - 1)/2)
    local number_unprivileged_win = (#cls - 1) - number_privileged_win

    -- Define some obvious parameters
    column.width = wa.width - master.width
    column.x_increment = 0
    row.height = wa.height - master.height
    row.y_increment = 0

    -- Place master at the right place and move row and column accordingly
    column.y = wa.y
    row.x = wa.x
    if orientation:match('N.') then
        master.y = wa.y
        row.y = master.y + master.height
    elseif orientation:match('S.') then
        master.y = wa.y + wa.height - master.height
        row.y = wa.y
    end
    if orientation:match('.W') then
        master.x = wa.x
        column.x = master.x + master.width
    elseif orientation:match('.E') then
        master.x = wa.x + wa.width - master.width
        column.x = wa.x
    end
    -- At this point, master is in a cast
    -- but row and column are overlayed in the opposite cast...

    -- Reduce the unprivileged slaves to remove overlay
    -- and define actual width and height
    if row_privileged then
        row.width = wa.width
        row.number_win = number_privileged_win
        column.y = master.y
        column.height = master.height
        column.number_win = number_unprivileged_win
    else
        column.height = wa.height
        column.number_win = number_privileged_win
        row.x = master.x
        row.width = master.width
        row.number_win = number_unprivileged_win
    end

    column.win_height = column.height/column.number_win
    column.win_width = column.width
    column.y_increment = column.win_height
    column.win_idx = 0

    row.win_width = row.width/row.number_win
    row.win_height = row.height
    row.x_increment = row.win_width
    row.win_idx = 0

    -- Extend master if there is only a few windows and "expand" policy is set
    --if #cls < 2 then
    --    if row_privileged then
    --        master.x = wa.x
    --        master.width = wa.width
    --    else
    --        master.y = wa.y
    --        master.height = wa.height
    --    end
    --    if #cls < 2  then
    --        if t.master_fill_policy == "expand" then
    --            master = wa
    --        else
    --            master.x = master.x + (wa.width - master.width)/2
    --            master.y = master.y + (wa.height - master.height)/2
    --        end
    --    end
    --end

    for i, c in ipairs(cls) do
        local g
        -- Handle master window
        if i == #cls then
            g = {
                x = master.x,
                y = master.y,
                width = master.width,
                height = master.height
            }
        -- handle column windows
        elseif i % 2 == 1 then
            g = {
                x = column.x + column.win_idx * column.x_increment,
                y = column.y + column.win_idx * column.y_increment,
                width = column.win_width,
                height = column.win_height
            }
            column.win_idx = column.win_idx + 1
        else
            g = {
                x = row.x + row.win_idx * row.x_increment,
                y = row.y + row.win_idx * row.y_increment,
                width = row.win_width,
                height = row.win_height
            }
            row.win_idx = row.win_idx + 1
        end
        p.geometries[c] = g
    end
end

local cast = {}
cast.row_privileged = false

--- Corner layout.
-- Display master client in a cast of the screen, and slaves in one
-- column and one row around the master.
-- @clientlayout awful.layout.suit.cast.nw
cast.nw = {
        name = "castnw",
        arrange = function (p) return do_cast(p, "NW") end
    }

--- Corner layout.
-- Display master client in a cast of the screen, and slaves in one
-- column and one row around the master.
-- @clientlayout awful.layout.suit.cast.ne
cast.ne = {
        name = "castne",
        arrange = function (p) return do_cast(p, "NE") end
    }

--- Corner layout.
-- Display master client in a cast of the screen, and slaves in one
-- column and one row around the master.
-- @clientlayout awful.layout.suit.cast.sw
cast.sw = {
        name = "castsw",
        arrange = function (p) return do_cast(p, "SW") end
    }

--- Corner layout.
-- Display master client in a cast of the screen, and slaves in one
-- column and one row around the master.
-- @clientlayout awful.layout.suit.cast.se
cast.se = {
        name = "castse",
        arrange = function (p) return do_cast(p, "SE") end
    }

return cast

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
