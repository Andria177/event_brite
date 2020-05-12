class MultipleValidator < ActiveModel::EachValidator

	def validate_each(record, attribute, value)
		if value.nil? || value%5!=0
			record.errors.add(attribute, 'doit etre un multiple de 5')
		end
	
	end
end