FactoryGirl.define do
	factory :author do
		fName "Margaret" 
		lName "Mitchell"
		biography "a"*300
		birthplace "a"*20
	end
end
