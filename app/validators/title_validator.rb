class TitleValidator < ActiveModel::EachValidator

	def validate_each(record, attribute, value)

		unless value =~ /\A[a-zA-Z0-9\s\.\,\(\)\-\*\'\_\$\?\!\@\#\%\&\*\(\[\])]+\z/
		       record.errors.add(attribute, 'ne doit pas contenir de caractères speciaux')
		end
	end
end
