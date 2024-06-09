module UserType
    extend ActiveSupport::Concern
  
    included do
      enum role: { manager: 0, qa: 1, developer: 2 }
    end
  end
  