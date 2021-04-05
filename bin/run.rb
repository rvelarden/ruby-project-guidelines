require_relative '../config/environment'

prompt = TTY::Prompt.new


# def update_something_else
#     y_o_n = prompt.select("Would you like to update something else?", %w(Yes No))
#         if y_o_n == "No"
#             break
#         end
# end

musician_or_hirer = prompt.select("Welcome to Gigmania! Are you a musician or looking for a musician?", %w(Musician Looking_for_a_Musician))
if musician_or_hirer == "Looking_for_a_Musician"
    loop do
    what_name = prompt.ask("What is the title of your event?")
    selected_gig = Gig.find_or_create_by(name: what_name) 
        what_city = prompt.select("In what city are you looking for a musician?") do |menu|
            menu.choice "Los Angeles"
            menu.choice "New York"
            menu.choice "Philadelphia"
            menu.choice "Phoenix"
            menu.choice "Pittsburgh"
            menu.choice "Sydney"
        end
        what_genre = prompt.select("What type of music do you want?", %w(Classical Electronic Jazz)).downcase
        what_instrument = prompt.select("What type of instrument do you want?", %w(Harp Violin Viola DJ Cello Voice)).downcase
        what_ordering = prompt.select("How would you like to view your search results?", %w(Price_Ascending Rating_Descending))
        hired_musician = "Here are some available musicians in your area: "
        case what_ordering
            when "Price_Ascending"
                available_musicians = Musician.price_asc(what_city, what_genre, what_instrument)
                available_musicians.each do |r|
                    puts "#{r.name}" #why couldn't I increment stuff?
                end
            when "Rating_Descending"
                available_musicians = Musician.rating_desc(what_city, what_genre, what_instrument)
                available_musicians.each do |r|
                    puts "#{r.name}" #why couldn't I increment stuff?
                end
            end

        # view_again = prompt.select("Would you like to search by other parameters?", %w(Yes No))
        #     if y_o_n == "No"
        #         break
        #     else

        hire_musician = prompt.select("Would you like to hire one of these musicians?", %w(Yes No))
            # if hire_musician == "No"
            #     break
            if hire_musician == "Yes"
                selected_musician_name = prompt.ask("Please write in the name of your selected musician:")
                selected_musician = Musician.find_by(name: selected_musician_name)
                Contract.create(musician_id: selected_musician.id, gig_id: selected_gig.id)
                puts "You have hired '#{selected_musician.name}' for your event '#{selected_gig.name}.'"
            end
        another_musician = prompt.select("Would you like to search for musicians for another event?", %w(Yes No))
        if another_musician == "No"
            break
        end
    end
elsif musician_or_hirer == "Musician"
     what_name = prompt.ask("What is your name?")
     loop do
     if Musician.find_by(name: what_name) 
        selected_musician = Musician.find_by(name: what_name)
        what_do = prompt.select("What would you like to do, #{what_name}?", %w(Update_Profile See_My_Gigs Exit))
            if what_do == "Update_Profile"
                # continue = "Yes"
                # while continue == "Yes" do
                loop do
                what_update = prompt.select("What would you like to update?", %w(Name Genre Instrument Price City Status))
                case what_update
                    when "Name"
                        new_name = prompt.ask("What's your new name?")
                        selected_musician.update_name(new_name)
                        puts "Your name has been updated to #{selected_musician.name}"
                        puts " "
                        y_o_n = prompt.select("Would you like to update something else?", %w(Yes No))
                        if y_o_n == "No"
                            break
                        end
                    when "Genre"
                        new_genre = prompt.select("What's your new genre?", %w(Classical Electronic Jazz))
                        selected_musician.update_genre(new_genre.downcase)
                        puts "Your genre has been updated to #{selected_musician.genre}"
                        puts " "
                        y_o_n = prompt.select("Would you like to update something else?", %w(Yes No))
                        if y_o_n == "No"
                            break
                        end
                    when "Instrument"
                        new_instrument = prompt.ask("What's your new instrument?")
                        selected_musician.update_instrument(new_instrument)
                        puts "Your instrument has been updated to #{selected_musician.instrument}"
                        puts " "
                        y_o_n = prompt.select("Would you like to update something else?", %w(Yes No))
                        if y_o_n == "No"
                            break
                        end
                    when "Price"
                        new_price = prompt.ask("What's your new rate per hour?", convert: :float)
                        selected_musician.update_price(new_price)
                        puts "Your rate has been updated to #{selected_musician.price}"
                        puts " "
                        y_o_n = prompt.select("Would you like to update something else?", %w(Yes No))
                        if y_o_n == "No"
                            break
                        end
                    when "City"
                        new_city = prompt.ask("What's your new city?")
                        selected_musician.update_city(new_city)
                        puts "Your city has been updated to #{selected_musician.city}"
                        puts " "
                        y_o_n = prompt.select("Would you like to update something else?", %w(Yes No))
                        if y_o_n == "No"
                            break
                        end
                    when "Status"
                        y_o_n = prompt.select("Would you like to be listed as availble on the site?", %w(Yes No))
                        if y_o_n == "Yes" 
                            selected_musician.go_active
                            puts "Your status has been updated to active."
                        elsif y_o_n == "No"
                            selected_musician.go_inactive
                            puts "Your status has been updated to inactive. Please change your status back to 'active' when you'd like to be listed in search results again."
                        end
                        puts " "
                        y_o_n = prompt.select("Would you like to update something else?", %w(Yes No))
                        if y_o_n == "No"
                            break
                        end 
                end
                end
            elsif what_do == "Exit"
                break
            elsif what_do == "See_My_Gigs"
                puts "Here are your gigs: "
                # binding.pry

                all_contracts = Contract.where(musician_id: selected_musician.id)
                all_contracts.each do |c|
                    Gig.all.each do |g|
                        if g.id == c.gig_id
                            puts "#{g.name}"
                        end
                    end
                end
                    
                    
                    # Gig.where(id: all_contracts.gig_id)
                # relevant_gigs = Gig.where(id: all_contracts.gig_id)
                # relevant_gigs.each do |gig|
                #     puts "#{gig.name}"
                # end
                y_o_n = prompt.select("Would you like to do something else?", %w(Yes No))
                    if y_o_n == "No"
                        break
                    end
            end 
     else
        y_o_n = prompt.select("We could not find you in our catalogue. Would you like to create a new profile?", %w(Yes No))
            if y_o_n == "Yes"
                genre = prompt.select("What sort of music do you perform?", %w(Classical Electronic Jazz)).downcase
                instrument = prompt.ask("What is your primary instrument?")
                price = prompt.ask("What's your rate per hour?", convert: :float)
                city = prompt.ask("In what city are you looking for work?")
                new_musician = Musician.create(name: what_name, genre: genre, instrument: instrument, price: price, city: city, active: 1)
                puts "You now have access to all of our site features."
            elsif y_o_n == "No"
                # puts "Please visit us again when you are ready to join our vibrant community!"
                break
            end
    end
end
end
puts "Thanks for using Gigmania! Hope to see you next time!"
