module PermissionsConcern
	#es para agergar tiposdeusuarios yu permisos
	extend ActiveSupport::Concern
	def is_tecnico?
		self.role == "tecnico"
	end
	def is_vendedor?
		self.role == "vendedor"
	end
	def is_almacen?
		self.role == "almacen"
	end
	def is_cajero?
		self.role == "cajero"
	end
	def is_admin?
		self.role == "admin"
	end
end