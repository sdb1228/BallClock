require 'json'
class BallClock
	def self.clock(balls, minutes)
		if balls < 27 or balls > 127
			print "The queue can't be less than 27 or greater than 127"
		end
		if minutes < 0
			print "Minutes must be positive"
		end
		queue = Array.new(balls){ |i| (i+1) }
		start = Array.new(balls){ |i| (i+1) }
		one_min_shaft = []
		five_min_shaft = []
		one_hour_shaft = []
		# number of minutes in day
		for i in 0... minutes
			if queue == start
				print "Number of Days utnil the queue is the same as when it started: "
				print i/60
				print "\n"
			end
			if one_min_shaft.length != 4
				one_min_shaft.push queue.shift
				next
			elsif one_min_shaft.length == 4 and five_min_shaft.length != 11
				queue.concat(one_min_shaft.reverse)
				one_min_shaft = []
				five_min_shaft.push queue.shift
				next
			elsif one_min_shaft.length == 4 and five_min_shaft.length == 11 and one_hour_shaft.length != 11
				queue.concat(one_min_shaft.reverse)
				queue.concat(five_min_shaft.reverse)
				one_min_shaft = []
				five_min_shaft = []
				one_hour_shaft.push queue.shift
				next
			else
				queue.concat(one_min_shaft.reverse)
				queue.concat(five_min_shaft.reverse)
				queue.concat(one_hour_shaft.reverse)
				one_min_shaft = []
				five_min_shaft = []
				one_hour_shaft = []
			end
		end
		hash = {Min: one_min_shaft, FiveMin: five_min_shaft, Hour: one_hour_shaft, Queue: queue}
		print hash.to_json

		print "\n"
	end
end