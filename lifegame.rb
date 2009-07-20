#!/usr/bin/env ruby
require "lifegamefield.rb"
require "lifegameview.rb"

print "[幅x高さ]を入力してください: "
widthheight=gets.split(/x/)
width=widthheight[0].to_i
height=widthheight[1].to_i

lgf = LifeGame::Field.new(width,height)
view = LifeGame::ConsoleView.new(lgf)

g=0
loop do
	print "=== generation #{g+1} ===\n"
	view.visualize
	cmd=""
	loop do
		print "状態を変更する場合はその座標をカンマ区切りで入力[x,y]:"
		break if (cmd=gets) == "\n"
		# 座標指定があれば
		if cmd =~ /(\d+),(\d+)/
			x=$1.to_i
			y=$2.to_i
			if lgf.isalive?(x,y)
				lgf.kill(x,y)
			else
				lgf.create(x,y)
			end
		end
		view.visualize
	end
	break if cmd=="exit"
	lgf.update
	g+=1
end

