# -*- coding: utf-8 -*-
require 'faker'
require 'rubygems'
require 'selenium-webdriver'
#load 'glad-methods.rb'
#load 'facebook.rb'
load 'twitter.rb'





def attack
    login
    get_time_of_next_attack
    show_hp

    @attack_number = @driver.find_element(:id, "expeditionpoints_value").text.match(/\d+/).to_s.to_i
    @boundroumi_number = @driver.find_element(:id, "dungeonpoints_value").text.match(/\d+/).to_s.to_i


 	  if @boundroumi_number > 0 and @mpou_time == 30
	    mpou_attack
	  end

	 if @arena_time == 30
            arena_attack
         end

	 if @cosmo_arena_time == 30
	   cosmoarena_attack
	 end

	 if @attack_number > 0 and @exp_time == 30
	   if @hp > 40
	     exp_attack
           else
	     puts "Needs energy (HP), give him something to eat or I will let him work-fight in dungeon to replace some energy"
	     max_job_per_hour
	     @total_time = 0
	   end
	 end

        if @boundroumi_number == 0 && @attack_number == 0
	  max_job_per_hour
	  @total_time = 0
	end

	 `killall -9 firefox`
         puts @total_time
         sleep @total_time
end

i = 0

loop do
  attack
end
