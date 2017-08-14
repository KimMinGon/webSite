package fow

class Article {
    String title
    String link
    String author
    String password
    Date dateCreated

    Integer viewCount = 0
    Integer noteCount = 0

    CategoryType type

    String v

    static constraints = {
        title blank: false
        link url: true
        author blank: false
        password nullable: true
        viewCount bindable: false
        noteCount bindable: false
        v nullable: true
    }

    static mapping = {
        password column: '`password`'
    }
}
