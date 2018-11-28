require 'rails_helper'

describe "Apartments API" do
  it "gets a list of Apartments" do
    # Create a new cat in the Test Database (not the same one as development)
    Apartment.create(street1: '123 teststreet', street2: 'apt 4', city: 'La Jolla', postal_code: 1234567, state: 'CA', country: 'US', building_manager: 'Kate', manager_phone: '123-9876', manager_hours: '1pm-7pm')

    # Make a request to the API
    get '/apartments'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to be_success

    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end

  it "creates a apartment" do
    apartment_params = {
      apartment: {
        street1: '123 teststreet',
        street2: 'apt 4',
        city: 'La Jolla',
        postal_code: 1234567,
        state: 'CA',
        country: 'US',
        building_manager: 'Kate',
        manager_phone: '123-9876',
        manager_hours: '1pm-7pm'
      }
    }
    post '/apartments', params: apartment_params
    expect(response).to be_success

    new_apartment = Apartment.first
    expect(new_apartment.city).to eq('La Jolla')
  end

  # it "doesn't create a appartment without a city" do
  #   apartment_params = {
  #     apartment: {
  #       street1: '123 teststreet',
  #       street2: 'apt 4',
  #       city: 'La Jolla',
  #       postal_code: 1234567,
  #       state: 'CA',
  #       country: 'US',
  #       building_manager: 'Kate',
  #       manager_phone: '123-9876',
  #       manager_hours: '1pm-7pm'
  #     }
  #   }
  #   post '/apartments', params: apartment_params
  #   expect(response.status).to eq 422
  # end
end
