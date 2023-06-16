Feature: POST call request
  Background:
    * url 'https://gorest.co.in'
    * def random_string =
    """
   function(s){
    var text = "";
    var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    for(var i=0; i<s; i++){
      text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      return text;
    }
   }
    """

    * def randomString = random_string(10)
    * print randomString
    * def reqPayload = read('classpath:src/test/resources/payload/user.json')
    * reqPayload.email = randomString + "@gmail.com"
    * print reqPayload

    Scenario: Create User With Given Data
      Given path '/public/v2/users'
      And request reqPayload
      And header Authorization = 'Bearer 911aaf5ee36571799fbac3b8aa50f95c07dbf11fd904ae4a9ae65bac00a3bd7c'
      When method post
      Then status 201
      And match $.id == '#present'
      And match $.name == '#present'



