module LifeGame
class Field
	attr_reader :width,:height
	def initialize(width,height)
		@width=width
		@height=height
		init
	end
	
	def init
		@field=[]
		@height.times do |h|
			line=[]
			@width.times do |w|
				line.push(false)
			end
			@field.push(line)
		end
	end

	def isalive?(x,y)
		return false if x >= @width
		return false if y >= @height
		return @field[y][x]
	end

	def create(x,y)
		return false if x >= @width
		return false if y >= @height
		@field[y][x]=true
	end

	def kill(x,y)
		return false if x >= @width
		return false if y >= @height
		@field[y][x]=false
	end
	
	def update
		# life game のメインルーチン
		newfield=@field.map{|x| x.clone}
		@height.times do |h|
			@width.times do |w|
				count=getlivecount(h,w)
				if @field[h][w]
					# 8近傍のうち生きているのが2つか3つでないなら死ぬ
					newfield[h][w]=false if count != 2 and count != 3
				else
					# 8近傍のうち生きているのが3つだったら生きる
					newfield[h][w]=true if count == 3
				end
			end
		end
		@field=newfield
	end

	def getlivecount(h,w)
		count=0
		(-1..1).each do |dy|
			(-1..1).each do |dx|
				next if dy==0 and dx==0
				count += 1 if @field[h-dy] != nil and @field[h-dy][w-dx]
			end
		end
		return count
	end
end

end

