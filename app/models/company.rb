class Company < ApplicationRecord
	validates :name, presence: :true, 
						length: {minimum: 3, maximum:100}, 
						uniqueness: { scope: :d_type, 
							case_sensitive: false,
							message: "Esta empresa ya se encuentra registrada" }
end
