class FormController < ApplicationController
  def index
    pdftk = PdfForms.new('/usr/local/bin/pdftk')
    binding.pry
    pdftk.get_field_names ("#{Rails.root}/public/title.pdf")
    binding.pry
    pdftk.fill_form "#{Rails.root}/public/title.pdf", 'starwars.pdf', form_name_first_last: 'Dan Danilyuk', form_todays_date: '12/27/2017', form_address_street: '123 Test Rd', form_address_city: 'PORTLAND', form_address_state: 'OR', form_address_zip: '97205', form_phone: '717.111.1111', form_email: 'DanDanilyuk@gmail.com', form_social: '111-11-1111', form_vin: 'S9G8G7D9F9G0S0F9S', form_make: 'Honda', form_model: 'CRF450', form_year: '2012', form_cc: '450', form_color: 'RED', form_purchase_date: '12/2/2016'
    send_file(
    "#{Rails.root}/starwars.pdf",
    filename: "STARWARSBABY.pdf",
    type: "application/pdf"
  )
  end
end
