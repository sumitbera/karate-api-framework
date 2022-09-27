Feature: Articles

Background: Define URL
    Given url "https://api.realworld.io/api/"

    # @TC_03
    # Scenario: Create a new article
    #     Given path 'users/login'
    #     And request {"user": {"email": "karateNew@test.com","password": "karate123"}}
    #     When method Post
    #     And status 200
    #     * def token = response.user.token

    #     Given header Authorization = 'Token ' + token
    #     Given path 'articles'
    #     And request {"article": {"tagList": [],"title": "test article","description": "bla bla","body": "Long article"}}
    #     When method Post
    #     Then status 200
    #     And match response.article.title == 'test article'
        

        Scenario: Create and Delete article
            Given path 'users/login'
            And request {"user": {"email": "karateNew@test.com","password": "karate123"}}
            When method Post
            And status 200
            * def token = response.user.token

            Given header Authorization = 'Token ' + token
            Given path 'articles'
            And request {"article": {"tagList": [],"title": "test article","description": "bla bla","body": "Long article"}}
            When method Post
            Then status 200
            And match response.article.title == 'test article'
            * def articleId = response.article.slug

            Given header Authorization = 'Token ' + token
            Given params { limit:10, offset:0}
            Given path 'articles'
            When method Get
            Then status 200
            And match response.articles[0].title == 'test article'

            Given header Authorization = 'Token ' + token
            Given path 'articles',articleId
            When method Delete
            Then status 204

            Given params { limit:10, offset:0}
            Given path 'articles'
            When method Get
            Then status 200
            And match response.articles[0].title != 'test article'