class Event < ApplicationRecord   
    
    has_many :participations, class_name:'Attendance'
    has_many :users, through: :attendances
    belongs_to :admin, class_name: "User"

    validate :start_date_cannot_be_in_the_past
    validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validate :duration_is_multiple_of_5
    validates :title, presence: true, length: {minimum: 5, maximum: 140}
    validates :description, presence: true, length: {minimum: 20, maximum: 1000}
    validates :price, presence:true, numericality: {in: 1..1000}
    validates :location, presence: true


    def start_date_cannot_be_in_the_past
        if start_date.present? && start_date < Time.now
        errors.add(:start_date, "La date de début ne peut pas être dans le passé.")
        end
    end

    def duration_is_multiple_of_5
        if duration%5 != 0
          errors.add(:duration, "La durée de l'évènement doit être un multiple de 5.")
        end
    end
end
