#Background

Given("There is no human name suggestion") do
    expect(find("input[name='original_name']").value).to be_empty
end

When("I click the {string} button for a human name") do |suggest|
    click_on(suggest)
end

When("A human name has been suggested") do
    click_on("Suggest")
    @humanName = find("input[name='original_name']").value
end

# 5.  Submit the form. Use the "Suggest" button and validate that a human name has been added to the human name input field.

Then("I see a human name has been added") do
    expect(find("input[name='original_name']").value).not_to be_empty
end

Then("I click submit form") do
    click_on("Write me some fantasy names")
end

# 6.Validate that the suggested human name (either first or last name) from scenario 5 is present at least once in the list of names

When("The form is submitted") do
    click_on("Write me some fantasy names")
end

Then("The human first or last name is included in at least one name result") do
    names = @humanName.split(' ')
    first_name = names[0]
    last_name = names[1]
    page.assert_selector(".name_heading", text: /(#{first_name}|#{last_name})/i)
end


