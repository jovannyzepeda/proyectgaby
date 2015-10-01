module Scope
  extend ActiveSupport::Concern
  included do
  	scope :lista_usuarios, lambda{|id|where("id != ? ",id)}
  end

end