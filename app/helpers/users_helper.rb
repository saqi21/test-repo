module UsersHelper

def age(dob)
	age=((Date.today - dob).to_i)/365
end
def send_emailCode()
	6.times.map{Random.new.rand(0..9)}
end 
end