class User < ApplicationRecord
  has_many :work_records, dependent: :destroy
end
