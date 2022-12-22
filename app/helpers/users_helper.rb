module UsersHelper

def age(dob)
	age=((Date.today - dob).to_i)/365
end
end