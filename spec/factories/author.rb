FactoryGirl.define do
	factory :author do
		fName "Margaret" 
		lName "Mitchell"
		biography "a"*300
		birthplace "a"*20
	end
	factory :invalid_author, class: :Author do
		fName nil
		lName nil
		biography nil
		birthplace nil
	end

	factory :new_attr_author, class: Author do
		fName "Margaret" 
		lName "Mitchell"
		biography "a"*600
		birthplace "a"*40
	end
end