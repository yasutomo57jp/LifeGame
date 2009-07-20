module LifeGame
	class ConsoleView
		def initialize(field)
			@field=field
		end

		def visualize
			@field.height.times do |h|
				@field.width.times do |w|
					state=@field.isalive?(w,h)
					print "□" if state
					print "■" unless state
				end
				print "\n"
			end
		end
	end
end
