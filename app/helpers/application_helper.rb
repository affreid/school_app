module ApplicationHelper
	def formatted_phone_number(phone)
		return unless phone.present?
		number_to_phone(phone, area_code: true)

		#^^if phone.nil?
			# happy path
		#else
			#unhappy
		#end

	end
end
