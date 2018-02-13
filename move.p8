pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
function _init()
  log={}
  make_player()
end

function _update()
  move_player()
  friction()
end

function _draw()
  cls()
  print("x: "..p.x)
  print("y: "..p.y)
  draw_player()
end

function add_to_log(msg)
  local inlog = false
  for m in log do
   if m==msg then inlog=true
   end
  end
end

function printlog()
  for m in log do
    print(m)
  end
end

function friction()
  if(not(btn(⬅️) and not(btn(➡️))))then
   --if(p.dx>0) p.dx-=0.5
  end
end
-->8
-- player
function make_player()
  p={}
  p.x=64
  p.y=64
  p.dx=2
  p.dy=2
end

function move_player()
  if(btn(⬅️))p.x=move("x",⬅️)
  if(btn(➡️))p.x=move("x",➡️)
  if(btn(⬆️))p.y=move("y",⬅️)
  if(btn(⬇️))p.y=move("y",➡️)
end

-- c: x,y
-- d: ⬅️,➡️
function move(c,d)
  local mod
  if(d==⬅️)then
    if (c=="x")then 
      mod=-p.dx
    elseif (c=="y")then  
      mod=-p.dy
    end
  else
    if (c=="x" and p.dx>0)then 
      mod=p.dx/10
    elseif (c=="y" and p.dy>0)then  
      mod=p.dy/10
    end
  end
  if(d==➡️)then
    if(c=="x")then
     mod=p.dx
    elseif(c=="y")then
     mod=p.dy
    end
  end
  local new=p[c]+mod
  if(d==⬅️)then
    if(p[c]<=0) new=127
  end
  if(d==➡️)then
    if(p[c]>=127) new=0
  end
  return new
end

function draw_player()
  spr(1, p.x, p.y)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000990000009900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000009999000099990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700999999999999999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000090000900900009000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000009000000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
