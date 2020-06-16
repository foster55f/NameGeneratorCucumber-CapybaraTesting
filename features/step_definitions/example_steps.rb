Given(/^I am on the fantasy name page$/) do
  find('h2', :text => "Name Generator")
end

Then(/^I see the text "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

# 1. That you are on the expected page for the Fantasy Name Generator
Given("I am on the expected page for the Fantasy Name Generator") do
  find('h2', :text => "Name Generator")
end

Then("I see the current path as {string}") do |sitelink|
  expect(page).to have_current_path(sitelink)
end

# 2. Submit the form with a specified number of names and validate that the correct number of 
# suggestions populates
When("I fill in How many examples of each type would you like to generate? with {int}") do |number|
  find(:css, "input[name$='count']").set(number)
end

When("I click {string} button") do |submitButtonName|
  click_on submitButtonName
end

Then("I see {int} name suggestions") do |numberOfSuggestions|
  expect(page).to have_selector('.name', count: numberOfSuggestions)
end

# 3. Select only one category and submit the form
When("I select {string} button") do |uncheckAllButton|
  click_on(uncheckAllButton)
end

When("I select {string} category from available category checkboxes") do |category|
  find("input[value=#{category}]").click
end

When("I click {string}") do |submitButtonName|
  click_on submitButtonName
end

Then("I see the title {string}") do |suggestionsTitle|
  expect(page).to have_content(suggestionsTitle)
end

# 4. Validate that the selected category from scenario 3 is present in each entry of the list of names
Given("I have only selected the {string} category") do |category|
  click_on('Uncheck all')
  find("input[value=#{category}]").click
end

Given("I click submit") do
  click_on(class: "create_form_submit")
end

Then("I see that {string} is present in each name suggestion") do |category|
  results = page.all(:css, '.name')
  results.each do |result|
    expect(result).to have_text(category)
  end
end

# 5. Use the "Suggest" button and validate that a human name has been added to the 
#human name input field. Submit the form.
Given("Human name input field is empty") do
  expect(find(:css, '.sizeMedium').value).to be_empty
end

When("I click {string} button for a human name") do |suggest|
  click_on suggest
end

When("I see a human name has been added") do
  expect(find(:css, '.sizeMedium').value).not_to be_empty
end

Then("I click submit form") do
  click_on "Write me some fantasy names"
end

# 6.Validate that the suggested human name (either first or last name) from scenario 5 
#is present at least once in the list of names
Given("Human name has been added") do
  click_on "Suggest"
  @humanName = find(:css, '.sizeMedium').value
end

Given("Form has been submitted") do
  click_on(class: "create_form_submit")
end

Then("A name suggestion includes first or last human name") do
  names = @humanName.split(' ')
  first_name = names[0]
  last_name = names[1]
  page.assert_selector('.name_heading', text: /^(#{first_name}|#{last_name})/i)
end



