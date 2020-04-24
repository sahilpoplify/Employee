class Employee < ApplicationRecord
    belongs_to :city
    has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
    belongs_to :manager, class_name: "Employee", optional: true
    mount_uploader :image, ImageUploader
    
    validates_size_of :image, maximum: 1.megabytes, message: "should be less than 1MB"

    
    
    validates :name, :city_id, presence: true
    validate :validate_willing, on: :create
    

        def validate_willing
                if self.willing == true
                    self.errors.add(:willing, "New joinee does not have the option for relocation")
                    return false
                end
            true
        end

end
