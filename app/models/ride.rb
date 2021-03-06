class Ride < ActiveRecord::Base


    belongs_to :attraction
    belongs_to :user

    def take_ride 
        if user.height < attraction.min_height && user.tickets < attraction.tickets
             "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
       
        
        elsif user.tickets < attraction.tickets 
             "Sorry. You do not have enough tickets to ride the #{attraction.name}."
          
        else
            new_user_tickets =  user.tickets - attraction.tickets

            user.update(tickets: new_user_tickets, happiness: user.happiness + attraction.happiness_rating, nausea: user.nausea + attraction.nausea_rating)
        end
    end
end
