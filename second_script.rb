require 'rubygems'
require 'watir-webdriver'


def goto_the_puppy_adoption_site
  @browser = Watir::Browser.new :firefox
  @browser.goto 'http://puppies.herokuapp.com/'
end

def adopt_puppy_numer(num)
  @browser.button(:value =>'View Details', :index =>num-1).click
  @browser.button(:value =>'Adopt Me!').click
end

def continue_adopting_puppies
  @browser.button(:value =>'Adopt Another Puppy').click
end

goto_the_puppy_adoption_site
#sleep 5
adopt_puppy_numer 1
continue_adopting_puppies
adopt_puppy_numer 2
@browser.button(:value =>'Complete the Adoption').click
@browser.text_field(:id =>'order_name').set('Tuan Nguyen')
@browser.textarea(:id =>'order_address').set('Test Address')
@browser.text_field(:id =>'order_email').set('tuan.nguyen@example.com')
@browser.select_list(:id =>'order_pay_type').select('Credit card')
@browser.button(:value =>'Place Order').click
fail 'Browser text did not match expected value' unless @browser.text.include? 'Thank you for adopting a puppy!'
#sleep 5
@browser.close
