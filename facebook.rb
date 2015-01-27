def login

#facebook
@driver = Selenium::WebDriver.for :firefox
  @driver.get "http:www.facebook.com"
  @driver.find_element(:id, "u_0_1").click
  @driver.find_element(:id, "u_0_1").clear
  @driver.find_element(:id, "u_0_1").send_keys Faker::Name.first_name
  @driver.find_element(:id, "u_0_3").click
  @driver.find_element(:id, "u_0_3").clear
  @driver.find_element(:id, "u_0_3").send_keys Faker::Name.last_name
  @driver.find_element(:id, "u_0_5").click
  @driver.find_element(:id, "u_0_5").clear
  @driver.find_element(:id, "u_0_5").send_keys Faker::Internet.email
  @driver.find_element(:id, "u_0_5").send_keys(:command,"a");
  @driver.find_element(:id, "u_0_5").send_keys(:command,"c");
  @driver.find_element(:id, "u_0_8").click
  @driver.find_element(:id, "u_0_8").clear
  @driver.find_element(:id, "u_0_8").send_keys(:command,"v");
  @driver.find_element(:id, "u_0_a").click
  @driver.find_element(:id, "u_0_a").clear
  @driver.find_element(:id, "u_0_a").send_keys Faker::Internet.password
  @driver.find_element(:id, "day").click
  @driver.find_element(:id, "day").send_keys 1 + Random.rand(31)
  @driver.find_element(:id, "day").send_keys (:enter)
  @driver.find_element(:id, "year").click
  @driver.find_element(:id, "year").send_keys 1940 + Random.rand(60)
  @driver.find_element(:id, "year").send_keys (:enter)
  if (1 + Random.rand(2)) > 1
    @driver.find_element(:id, "u_0_e").click;
  else
    @driver.find_element(:id, "u_0_d").click;
  end
  array= ["jan","feb","mar","apr","may","Jun","jul","aug","oct","nov","dec"]
  @driver.find_element(:id, "month").click
  @driver.find_element(:id, "month").send_keys array.sample
  @driver.find_element(:id, "month").send_keys (:enter)
  @driver.find_element(:id, "loginsubmit").click
end