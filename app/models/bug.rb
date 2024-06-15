class Bug < ApplicationRecord

belongs_to :project
belongs_to :assigned_to, class_name: 'User', optional: true
has_one_attached :screenshot
enum status: { todo: 0, inprogress: 1, resolved: 2 }

end
