class CustomerController < ApplicationController
	def find_id(type)
		@customer = Customer.find_by_type(type);
		return @customer.id;
	end
end
