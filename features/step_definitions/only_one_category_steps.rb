#Background

Given("I have selected {string} button") do |uncheckAllButton|
    click_on(uncheckAllButton)
end

When("I select {string} category from available category checkboxes") do |category|
    find("input[value=#{category}]").click
end

# 3. Select only one category and submit the form

When("I click {string}") do |submitButtonName|
    click_on(submitButtonName)
end

Then("I see the title {string}") do |suggestionsTitle|
    expect(page).to have_content(suggestionsTitle)
end

# 4. Validate that the selected category from scenario 3 is present in each entry of the list of names

When("I click submit") do
    click_on("Write me some fantasy names") 
end

Then("I see that {string} is present in each name suggestion") do |category|
    results = page.all(".name")
    results.each do |result|
    expect(result).to have_text(category)
    end
end