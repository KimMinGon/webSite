package fow

class Comment {
    String author
    String content
    String password
    Article article

    Date dateCreated

    static constraints = {
        author blank: false
        content minSize: 10
        password nullable: true
    }

    static mapping = {
        password column: '`password`'
    }


}
