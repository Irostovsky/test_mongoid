Given /^I will confirm any popups$/ do
  page.execute_script("window.confirm = function (msg) { return true; }")
end
