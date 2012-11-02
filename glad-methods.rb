# -*- coding: utf-8 -*-

@total_time = 0

def login
	@driver = Selenium::WebDriver.for :firefox
	@driver.get "http://s1.gladiatus.gr/game/"
	@driver.find_element(:id, "login_username").click
	@driver.find_element(:id, "login_username").clear
	@driver.find_element(:id, "login_username").send_keys "yourusername"
	@driver.find_element(:id, "login_password").clear
	@driver.find_element(:id, "login_password").send_keys "yourpassword"
	@driver.find_element(:id, "loginsubmit").click
end

def login2
	@driver = Selenium::WebDriver.for :firefox
	@driver.get "http://s1.gladiatus.gr/game/"
	@driver.find_element(:id, "login_username").click
	@driver.find_element(:id, "login_username").clear
	@driver.find_element(:id, "login_username").send_keys "yourusername2"
	@driver.find_element(:id, "login_password").clear
	@driver.find_element(:id, "login_password").send_keys "yourpassword2"
	@driver.find_element(:id, "loginsubmit").click
end


def get_time_of_next_attack
      # From Attacks
      cooldown = @driver.find_elements(:id, "cooldown_bar_text_expedition") 
      time = cooldown.first.text
      hours = time.match(/\d+/)
      minutes = time.match(/:\d+/)#.gsub(":", "")
      seconds = time.match(/:\d+:\d+/)
      hours = hours.to_s.to_i
      minutes = minutes.to_s.slice(1..3).to_i
      seconds = seconds.to_s.slice(4..5).to_i
      @exp_time = 0
      @exp_time = hours*60*60 + minutes * 60 + seconds + 30
    	puts "Expedition: #{@exp_time}"

      # From Mpountroumi
      cooldown = @driver.find_elements(:id, "cooldown_bar_text_dungeon") 
      time = cooldown.first.text
      hours = time.match(/\d+/)
      minutes = time.match(/:\d+/)#.gsub(":", "")
      seconds = time.match(/:\d+:\d+/)
      hours = hours.to_s.to_i
      minutes = minutes.to_s.slice(1..3).to_i
      seconds = seconds.to_s.slice(4..5).to_i
      @mpou_time = 0
      @mpou_time = hours*60*60 + minutes * 60 + seconds + 30
	    puts "Mpountroumi: #{@mpou_time}"
     
      # From Arena
      cooldown = @driver.find_elements(:id, "cooldown_bar_text_arena") 
      time = cooldown.first.text
      hours = time.match(/\d+/)
      minutes = time.match(/:\d+/)#.gsub(":", "")
      seconds = time.match(/:\d+:\d+/)
      hours = hours.to_s.to_i
      minutes = minutes.to_s.slice(1..3).to_i
      seconds = seconds.to_s.slice(4..5).to_i
      @arena_time = 0
      @arena_time = hours*60*60 + minutes * 60 + seconds + 30
    	puts "Arena: #{@arena_time}"


      # From Cosmoarena
      cooldown = @driver.find_elements(:id, "cooldown_bar_text_ct") 
      time = cooldown.first.text
      hours = time.match(/\d+/)
      minutes = time.match(/:\d+/)#.gsub(":", "")
      seconds = time.match(/:\d+:\d+/)
      hours = hours.to_s.to_i
      minutes = minutes.to_s.slice(1..3).to_i
      seconds = seconds.to_s.slice(4..5).to_i
      @cosmo_arena_time = 0
      @cosmo_arena_time = hours*60*60 + minutes * 60 + seconds + 30
    	puts "Cosmo Arena: #{@cosmo_arena_time}"

        @times = []
	@times << @mpou_time
	@times << @exp_time
	@times << @arena_time
	@times << @cosmo_arena_time

	@times.sort!
	
	@total_time = @times[0]
	#if @mpou_time < @exp_time
	#	@total_time = @mpou_time	
	#else 
	#	@total_time = @exp_time
	#end
	
	puts "ATTACK!" if @total_time == 30
end


def show_hp
   @hp = @driver.find_element(:id, "header_values_hp_percent").text
   @hp = @hp.to_s.gsub("%","").to_i
   puts "HP: #{@hp}"
end

def exp_attack
  @driver.find_element(:class, "cooldown_bar_link").click  # p "Attack!"
  @driver.find_element(:xpath, "(//button[@value=''])[2]").click
end

def mpou_attack
  @driver.find_element(:xpath, "(//a[@class='cooldown_bar_link'])[2]").click
  start_boundroumi = @driver.find_elements(:class, "button1")
  start_boundroumi.first.click if start_boundroumi.first.attribute('value') == "Κανονικό"
  @driver.find_elements(:xpath, "(//img[@onclick])").first.click
end

def arena_attack
   @driver.find_element(:xpath, "(//a[@class='cooldown_bar_link'])[3]").click
   @driver.find_element(:link, "Αρένα Επαρχιών").click
   @arena_table = []
   (2..6).each do |i|
     @arena_table << [i, @driver.find_element(:xpath, "/html/body/div[2]/div/div[5]/div/div[2]/div[2]/table/tbody/tr[2]/td/div[2]/div/table/tbody/tr[#{i}]/td[2]").text]
   end
   @arena_table.sort_by! { |row| row[1] }
   puts "To mikrotero level einai tis grammis #{@arena_table[0][0] - 1}  me level #{@arena_table[0][1]}"
   @driver.find_element(:xpath, "/html/body/div[2]/div/div[5]/div/div[2]/div[2]/table/tbody/tr[2]/td/div[2]/div/table/tbody/tr[#{@arena_table[0][0]}]/td[4]/span").click
end

def cosmoarena_attack
  @driver.find_element(:xpath, "(//a[@class='cooldown_bar_link'])[4]").click  
  @driver.find_element(:link, "Αρένα Κοσμοσυρροής").click
  @cosmo_table = []
  (2..6).each do |i|
    @cosmo_table << [i, @driver.find_element(:xpath, "/html/body/div[2]/div/div[5]/div/div[2]/div[2]/table/tbody/tr[2]/td/div[2]/div/table/tbody/tr[#{i}]/td[2]").text]
  end
  @cosmo_table.sort_by! { |row| row[1] }
  puts "To mikrotero level einai tis grammis #{@cosmo_table[0][0] - 1} me level #{@cosmo_table[0][1]}"
  @driver.find_element(:xpath, "/html/body/div[2]/div/div[5]/div/div[2]/div[2]/table/tbody/tr[2]/td/div[2]/div/table/tbody/tr[#{@cosmo_table[0][0]}]/td[4]/span").click
  #@driver.find_element(:xpath, "/html/body/div[2]/div/div[5]/div/div[2]/div[2]/table/tbody/tr[2]/td/div[2]/div/table/tbody/tr[3]/td[4]/span").click
end

def gladjob_one
  @driver.execute_script("switchMenu(1)")	
  @driver.find_element(:link, "Δουλειά").click
  @driver.find_element(:id, "content").click
  unless @driver.find_elements(:id, "ticker1").size == 1
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "workTime")).select_by(:text, "1 Ώρα")
    @driver.find_element(:id, "doWork").click 
  end
   `killall -9 firefox`
   sleep 3720
   puts "3720"
end

def gladjob_eight
  @driver.execute_script("switchMenu(1)")	
  @driver.find_element(:link, "Δουλειά").click
  @driver.find_element(:id, "content").click
  unless @driver.find_elements(:id, "ticker1").size == 1
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "workTime")).select_by(:text, "8 Ώρες")
    @driver.find_element(:id, "doWork").click 
  end
   `killall -9 firefox`
   sleep 3720
   puts "3720"
end


def show_tagma_enemies
    login
    @driver.find_element(:link, "Τάγμα").click
    @driver.find_element(:id, "war_master_div").click
    @driver.find_elements(:xpath, "//div[@class='report_statistic']//table//tr").each do |table_line|
    	#puts table_line.find_elements(:xpath, "//td").first.text	 #first.find_element(:xpath, "//a").
	puts table_line.text[0..-3]
    end
end

def max_job_per_hour
  @driver.execute_script("switchMenu(1)")	
  @driver.find_element(:link, "Δουλειά").click
  @driver.find_element(:id, "content").click
  @driver.find_element(:id, "job_row_4").click
   unless @driver.find_elements(:id, "ticker1").size == 1
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "workTime")).select_by(:text, "1 Ώρα")
    @driver.find_element(:id, "doWork").click 
   end
   `killall -9 firefox`
   puts  "3720"
   sleep 3720
end

def eat
end

