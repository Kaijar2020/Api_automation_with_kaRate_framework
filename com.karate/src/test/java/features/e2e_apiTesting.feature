Feature: E2E Testing to perform GET<POST<PUT and DELETE request
  Background:
    * url 'https://gorest.co.in'
    * def random_string =
    """
   function(s){
    var text = "";
    var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    for(var i=0; i<s; i++)
      text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      return text;

   }
    """

    * def randomString = random_string(10)
    * print randomString
    * def reqPayload = read('classpath:src/test/resources/payload/user.json')
    * reqPayload.email = randomString + "@gmail.com"
    * print reqPayload

    #1.Create user using post
  Scenario: end to end testing
    Given path '/public/v2/users'
    And request reqPayload
    And header Authorization = 'Bearer 911aaf5ee36571799fbac3b8aa50f95c07dbf11fd904ae4a9ae65bac00a3bd7c'
    When method post
    Then status 201
    And match $.id == '#present'
    And match $.name == '#present'

    #Fetch the user id from the post call response
    * def userId = $.id
    * print userId

    #2.Get The user
    Given path '/public/v2/users/'+userId
    And request reqPayload
    And header Authorization = 'Bearer 911aaf5ee36571799fbac3b8aa50f95c07dbf11fd904ae4a9ae65bac00a3bd7c'
    When method get
    Then status 200

     #3.Update the user
    * def reqPutPayload =

    """
     {
      "gender": "female",
      "status": "active",
    }
    """

    Given path '/public/v2/users/'+userId
    And request reqPutPayload
    And header Authorization = 'Bearer 911aaf5ee36571799fbac3b8aa50f95c07dbf11fd904ae4a9ae65bac00a3bd7c'
    When method put
    Then status 200
    And match $.id == '#present'
    And match $.id == userId
    And match $.name == '#present'

    #4.Delete the same user
    Given path '/public/v2/users/'+userId
    And header Authorization = 'Bearer 911aaf5ee36571799fbac3b8aa50f95c07dbf11fd904ae4a9ae65bac00a3bd7c'
    When method delete
    Then status 204

    #5.Verify the delete operation
    Given path '/public/v2/users/'+userId
    And header Authorization = 'Bearer 911aaf5ee36571799fbac3b8aa50f95c07dbf11fd904ae4a9ae65bac00a3bd7c'
    When method get
    Then status 404
    And match $.message == 'Resource not found'









