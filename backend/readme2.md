dto とは request する際にマッピングするためのもの
entity とは interface(id をつければいいっぽい)

mongodb compass を使うには mongoDB を起動する必要あり。
(brew services start mongodb-community)
閉じる方法は、
(brew services stop mongodb-community)

npm i --save @nestjs/platform-fastify

to use env variables, you should put ConfigModule first before using env variables

@Prop({type:...})の type はデータベースに表示するデータのタイプを指定している。
