class AddCityToAppointments < ActiveRecord::Migration[5.2]
  def change
	  add_reference :appointments, :city, index: true
  end
end
