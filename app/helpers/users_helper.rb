module UsersHelper

def send_emailCode()
	6.times.map{Random.new.rand(0..9)}
end   
end