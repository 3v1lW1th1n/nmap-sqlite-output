description = [[
]]


---
-- @usage
--
-- Version 0.1

author = "Michael Clemens"
license = "Same as Nmap--See http://nmap.org/book/man-legal.html"
categories = {"discovery", "safe"}

local nmap = require "nmap"
local shortport = require "shortport"
local stdnse = require "stdnse"

portrule = function () return true end
prerule = function () return true end
postrule = function () return true end

function preaction ()
        stdnse.print_debug( "preaction" )
end

function portaction (host, port)
        stdnse.print_debug( "portaction" )
end

function postaction (socket)
        stdnse.print_debug( "postaction" )
end

local ActionsTable = {
  prerule = preaction,
  portrule = portaction,
  postrule = postaction
}

-- execute the action function corresponding to the current rule
action = function(...) return ActionsTable[SCRIPT_TYPE](...) end
