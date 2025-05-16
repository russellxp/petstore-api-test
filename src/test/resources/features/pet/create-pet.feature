@functional
Feature: Crear una nueva mascota en PEtStore

  Background:
    * url 'https://petstore.swagger.io/v2'
    * def randomId = Math.floor(Math.random() * 1000000)
    * def randomName = 'Pet-' + randomId

    * print "randomId ===>" , randomId
    * print "randomName ===>" , randomName

  Scenario: Crear una mascota con datos dinamicos
    Given path 'pet'
    And request
        """
        {
        "id": #(randomId),
        "name": #(randomName),
         "photoUrls": [
    "string"
  ],
        "status": "available"
        }
        """

    When method POST
    Then  status 200

    And match response.id == randomId
    And match response.name == randomName
    And match response.status == 'available'
