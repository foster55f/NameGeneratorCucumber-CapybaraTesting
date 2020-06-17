Given(/^I am on the fantasy name page$/) do
  find('h2', :text => "Name Generator")
end

Then(/^I see the text "(.*?)"$/) do |text|
  page.has_text?(text)
end

# 1. That you are on the expected page for the Fantasy Name Generator
Given("I am on the expected page") do
  find("h2", :text => "Name Generator")
end

Then("I see the current path as {string}") do |url|
  page.has_current_path?(url)
end

# 2. Submit the form with a specified number of names and validate that the correct number of suggestions populates
When("I fill in {string} with {int}") do |_numberOfExamplesQuestion, number|
  @number = number
  find("input[name='count']").set(number)
end

When("I click {string} button") do |submitButtonName|
  click_on(submitButtonName)
end

Then("I see that number of name results") do 
  page.has_css?('name', count: @number)
end

# 3. Select only one category and submit the form
Given("I have selected {string} button") do |uncheckAll|
  click_on(uncheckAll)
end

When("I select {string} category from available category checkboxes") do |category|
  find("input[value=#{category}]").click
end

When("I click {string}") do |submitButtonName|
  click_on(submitButtonName)
end

Then("I see the title {string}") do |suggestionsTitle|
  page.has_text?(suggestionsTitle)
end

# 4. Validate that the selected category from scenario 3 is present in each entry of the list of names
Given("I have only selected the {string} category") do |category|
  click_on("Uncheck all")
  find("input[value=#{category}]").click
end

When("I click submit") do
  click_on("Write me some fantasy names")
end

Then("I see that {string} is present in each name suggestion") do |category|
  results = page.all(".name")
  results.each do |result|
    result.has_text?(category)
  end
end

# 5. Use the "Suggest" button and validate that a human name has been added to the human name input field. Submit the form.
Given("There is no human name suggestion") do
  find("input[name='original_name']").value.empty?
end

When("I click the {string} button for a human name") do |suggest|
  click_on(suggest)
end

Then("I see a human name has been added") do
  !find("input[name='original_name']").value.empty?
end

Then("I click submit form") do
  click_on("Write me some fantasy names")
end

# 6.Validate that the suggested human name (either first or last name) from scenario 5 is present at least once in the list of names
Given("A human name has been suggested") do
  click_on("Suggest")
  @humanName = find("input[name='original_name']").value
end

Given("The form has been submitted") do
  click_on("Write me some fantasy names")
end

Then("The human first or last name is included in at least one name result") do
  names = @humanName.split(" ")
  first_name = names[0]
  last_name = names[1]
  page.assert_selector(".name_heading", text: /(#{first_name}|#{last_name})/i)
end



