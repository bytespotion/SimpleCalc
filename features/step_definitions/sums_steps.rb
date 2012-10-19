Then /^I should see a "(.*?)" in the screen$/ do |arg1|
  check_element_exists("view marked:'screen' text:'#{arg1}'")
end