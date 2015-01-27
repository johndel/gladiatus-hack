def login

#gmail

  @driver = Selenium::WebDriver.for :firefox
  @driver.get "https://www.gmail.com"
  @driver.find_element(:id, "link-signup").click
  @driver.find_element(:id, "FirstName").click
  @driver.find_element(:id, "FirstName").clear
  @driver.find_element(:id, "FirstName").send_keys Faker::Name.first_name
  @driver.find_element(:id, "LastName").click
  @driver.find_element(:id, "LastName").clear
  @driver.find_element(:id, "LastName").send_keys Faker::Name.last_name
  @driver.find_element(:id, "GmailAddress").click
  @driver.find_element(:id, "GmailAddress").clear
  @driver.find_element(:id, "GmailAddress").send_keys Faker::Internet.user_name
  psw =  Faker::Internet.password
  @driver.find_element(:name, "Passwd").click
  @driver.find_element(:name, "Passwd").clear
  @driver.find_element(:name, "Passwd").send_keys psw
  @driver.find_element(:name, "PasswdAgain").click
  @driver.find_element(:name, "PasswdAgain").clear
  @driver.find_element(:name, "PasswdAgain").send_keys psw
  @driver.find_element(:id,":0").click
  @driver.find_element(:id, "BirthDay").click
  @driver.find_element(:id, "BirthDay").send_keys 1 + Random.rand(31)
  @driver.find_element(:id, "BirthYear").click
  @driver.find_element(:id, "BirthYear").send_keys 1940 + Random.rand(60)

end