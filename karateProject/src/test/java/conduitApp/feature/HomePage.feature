Feature: Test for the homepage

Background: Define URL
    Given url "https://api.realworld.io/api/"
    @TC_01
    Scenario: Get all tags
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags contains ['welcome','codebaseShow']
        And match response.tags !contains ['baby']
        And match response.tags == '#array'
        And match response.tags != '#string'
    @TC_02
    Scenario: Get 10 articles
        Given params { limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles == '#[3]'
        And match response.articlesCount == 3
        And