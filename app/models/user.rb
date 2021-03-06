class User
	include ::ActiveModel::Model

	attr_accessor :name, :logged_in, :email, :password, :type

	def self.logged_in!
		self.new logged_in: true
	end

	def self.guest!
		self.new logged_in: false
	end

	def favorites
		Property.favorites self
	end

	def properties type = :owned
		case type
		when :owned
			Property.owned_by self
		else
			raise "ERROR: #{type} - not yet supported!"
		end
	end


	def self.landlord!
		self.new logged_in: true, type: :landlord
	end

	def self.tenant!
		self.new logged_in: true, type: :tenant
	end

	def landlord?
		type == :landlord
	end

	def tenant?
		type == :tenant
	end

	def type
		@type ||= :tenant
	end

	def name
		'Alex'
	end

	def display
		"Hi #{name} (#{type})"
	end

	def login_status
		logged_in? ? 'logged in' : 'not logged in'
	end

	def logged_in?
		@logged_in
	end

	def logged_out?
		!logged_in?
	end
end