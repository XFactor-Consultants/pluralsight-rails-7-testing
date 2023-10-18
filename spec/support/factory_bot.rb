RSpec.configure do |config| 
    config.include FactoryBot::Syntax::Methods 

    config.before(:suite) do 
        Factorybot.find_definitions
    end 
end 