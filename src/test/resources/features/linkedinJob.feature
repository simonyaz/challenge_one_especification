#Author: simonycamargo@gmail.com
@JobApplyTests
Feature: Job apply on Linkedin
  Candidates should be able to 
  search for a job 
  and apply to it

  Background: 
    Given I have logged in Linkedin

  @SearchJob
  Scenario Outline: Search for a job
    Given I am on search job page
    And I search for <title>
    And I search for <city>
    When I click on search button
    Then I verify <result> job on the list

    Examples: 
      | title                      | city      | result      |
      | Tester Drupal - English    | Campinas  | 1           |
      | Scrum Master               | Campinas  | more than 1 |
      | xxxxxxxxxx                 | Campinas  | 0           |

  @ApplyJob
  Scenario: Apply for a job
    Given I am on search job page
    And I search for a job
    And I get a list of jobs results
    When I select one of them
    And I click on apply button
    Then I should see the company employment page
    And the job applied is saved on my account

  @SearchJobWithCityError
  Scenario: Show error message when try to search a nonexistent city
    Given I am on search job page
    When I fill filter information with a nonexistent city
    Then I should see a error message
