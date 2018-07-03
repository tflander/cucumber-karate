Feature: Testing a REST API
  Users should be able to submit GET and POST requests to a web service

  Background:
    Given url 'http://localhost:8080/api/'

  Scenario: Retrieve TODOs for user
    Given path 'users/todd/todos'
    When method get
    Then status 200
    * def expectedResponse = read('classpath:expectedResponse/retrieveTodoForUser.js')
    * set response[*].targetDate = 'replacement for today'
        And match response == expectedResponse
