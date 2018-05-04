class FormsController < ApplicationController

  def index
  end

  def new
    @form = Form.new
  end

  def create
    Form.create(name_first_last: form_params[:name_first_last].upcase, address_street: form_params[:address_street].upcase, address_city: form_params[:address_city].upcase, address_state: form_params[:address_state].upcase, address_zip: form_params[:address_zip], phone: form_params[:phone], email: form_params[:email].upcase, vin: form_params[:vin].upcase, make: form_params[:make].upcase, model: form_params[:model].upcase, year: form_params[:year], cc: form_params[:cc], color: form_params[:color].upcase, purchase_date: form_params[:purchase_date])
    pdftk = Forms.new('/app/vendor/pdftk/bin/pdftk')
    # PDFTK For AWS
    # pdftk = PdfForms.new('/usr/bin/pdftk')
    pdftk.fill_form "#{Rails.root}/public/title.pdf", 'starwars.pdf', form_name_first_last: form_params[:name_first_last].upcase, form_todays_date: (Time.now.strftime("%m/%d/%Y")), form_address_street: form_params[:address_street].upcase, form_address_city: form_params[:address_city].upcase, form_address_state: form_params[:address_state], form_address_zip: form_params[:address_zip], form_phone: form_params[:phone], form_email: form_params[:email].upcase, form_social: (form_params[:social].insert(3, '-').insert(6, '-')), form_vin: form_params[:vin].upcase, form_make: form_params[:make].upcase, form_model: form_params[:model].upcase, form_year: form_params[:year], form_cc: form_params[:cc], form_color: form_params[:color].upcase, form_purchase_date: form_params[:purchase_date], form_address_full: (form_params[:name_first_last].upcase + ', ' +  form_params[:address_street].upcase + ', ' + form_params[:address_city].upcase + ', ' + form_params[:address_state] + ' ' + form_params[:address_zip])
    File.open("#{Rails.root}/starwars.pdf", 'r') do |f|
      send_data f.read, type: "application/pdf", filename: "#{form_params[:name_first_last].gsub(' ','_') }_Title_Form.pdf"
    end
    File.delete("#{Rails.root}/starwars.pdf")
  end

private
  def form_params
    params.require(:form).permit(:name_first_last, :todays_date, :address_street, :address_city, :address_state, :address_zip, :phone, :email, :social, :vin, :make, :model, :year, :cc, :color, :purchase_date)
  end
end
