def login
  #Twitter
  @driver = Selenium::WebDriver.for :firefox
  @driver.get "https://www.twitter.com"
  @driver.find_element(:name, "user[name]").click
  @driver.find_element(:name, "user[name]").clear
  @driver.find_element(:name, "user[name]").send_keys Faker::Name.name
  @driver.find_element(:name, "user[email]").click
  @driver.find_element(:name, "user[email]").clear
  @driver.find_element(:name, "user[email]").send_keys Faker::Internet.email
  @driver.find_element(:name, "user[user_password]").click
  @driver.find_element(:name, "user[user_password]").clear
  @driver.find_element(:name, "user[user_password]").send_keys Faker::Internet.password
  @driver.find_element(:name, "user[screen_name]").click
  @driver.find_element(:name, "user[screen_name]").clear
  @driver.find_element(:name, "user[screen_name]").send_keys Faker::Internet.user_name
end