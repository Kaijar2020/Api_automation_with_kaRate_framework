Feature: Get API Feature

  Scenario: Get user details
    Given url 'https://gorest.co.in/public/v2/users'
    And path '1800'
    When method GET
    Then status 200
    * def jsonResponse = response
    * print jsonResponse
    * def actEmail = jsonResponse.email
    * match actEmail == 'anandamayi_kaniyar_miss@feest.io'

  Scenario: User Not Found
    Given url 'https://gorest.co.in//public/v2/users'
    And path '17'
    When method GET
    Then status 404

  Scenario: GET API with query parameter
    * def query = {status:'active', gender: 'male', id:2731875}
    Given url 'https://gorest.co.in/public/v2/users'
    And params query
    When method GET
    Then status 200
    * def jsonResponse = response
    * print jsonResponse

  Scenario: Get Authorization
    Given header Authorization = 'Bearer911aaf5ee36571799fbac3b8aa50f95c07dbf11fd904ae4a9ae65bac00a3bd7c'
    Given url 'https://gorest.co.in/public/v2/users'
    And path '1800'
    When method GET
    Then status 200
    * def jsonResponse = response
    * print jsonResponse
    * def actEmail = jsonResponse.email
    * match actEmail == 'jha_esha@satterfield.org'



