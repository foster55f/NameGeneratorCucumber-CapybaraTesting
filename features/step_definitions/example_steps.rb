Given(/^I am on the fantasy name page$/) do
  find("h2", :text => "Name Generator")
end

Then(/^I see the text "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

# 1. That you are on the expected page for the Fantasy Name Generator
Given("I am on the expected page") do
  find("h2", :text => "Name Generator")
end

Then("I see the current path as {string}") do |url|
  expect(page).to have_current_path(url)
end

# 2. Submit the form with a specified number of names and validate that the correct number of suggestions populates
When("I fill in {string} with {int}") do |_numberOfExamplesQuestion, number|
  @number = number
  find("input[name$='count']").set(@number)
end

When("I click {string} button") do |submitButtonName|
  click_on(submitButtonName)
end

Then("I see that number of name results") do 
  expect(page).to have_selector(".name", count: @number)
end

